-- Base Class Helpers
-- Contains necessary logic for defining, creating and working with all Class structures in a consistent manner
local appName, app = ...;

-- Global locals
local type, ipairs, pairs, tonumber, setmetatable, rawget, tinsert, unpack
	= type, ipairs, pairs, tonumber, setmetatable, rawget, tinsert, unpack;

-- App locals
local GetRelativeValue = app.GetRelativeValue;
local containsValue = app.containsValue;

-- Lib Helpers
local constructor = function(id, t, typeID)
	if t then
		if not t.g and t[1] then
			return { g=t, [typeID]=id };
		else
			t[typeID] = id;
			return t;
		end
	else
		return {[typeID] = id};
	end
end
local returnZero = function() return 0; end;

-- Provides a Unique Counter value for the Key referenced on each reference
local uniques = setmetatable({}, { __index = function(t, key) return 0; end });
local UniqueCounter = setmetatable({}, {
	__index = function(t, key)
		local count = uniques[key] + 1;
		-- app.PrintDebug("UniqueCounter",key,count)
		uniques[key] = count;
		return count;
	end
});
app.UniqueCounter = UniqueCounter;

-- Proper unique hash for a Class Object is not as simple as ID..Value, there are many situations where that does not provide adequate uniqueness
local function CreateHash(t)
	local key = t.key or t.text;
	if key then
		local hash = key .. (t[key] or "NOKEY");
		if key == "criteriaID" and t.achievementID then
			hash = hash .. ":" .. t.achievementID;
		elseif key == "itemID" and t.modItemID and t.modItemID ~= t.itemID then
			hash = key .. t.modItemID;
		elseif key == "creatureID" then
			if t.encounterID then hash = hash .. ":" .. t.encounterID; end
			local difficultyID = GetRelativeValue(t, "difficultyID");
			if difficultyID then hash = hash .. "-" .. difficultyID; end
		elseif key == "encounterID" then
			if t.creatureID then hash = hash .. ":" .. t.creatureID; end
			local difficultyID = GetRelativeValue(t, "difficultyID");
			if difficultyID then hash = hash .. "-" .. difficultyID; end
			if t.crs then
				local numCrs = #t.crs;
				if numCrs == 1 then
					hash = hash .. t.crs[1];
				elseif numCrs == 2 then
					hash = hash .. t.crs[1] .. t.crs[2];
				elseif numCrs > 2 then
					hash = hash .. t.crs[1] .. t.crs[2] .. t.crs[3];
				end
			end
		elseif key == "difficultyID" then
			local instanceID = GetRelativeValue(t, "instanceID") or GetRelativeValue(t, "headerID");
			if instanceID then hash = hash .. "-" .. instanceID; end
		elseif key == "headerID" then
			-- for custom headers, they may be used in conjunction with other bits of data that we don't want to merge together (because it makes no sense)
			-- Separate if using Class requirements
			if t.c then
				for _,class in pairs(t.c) do
					hash = hash .. "C" .. class;
				end
			end
			-- Separate if using Faction/Race requirements
			if t.r then
				hash = "F" .. t.r .. hash;
			elseif t.races then
				for _,race in pairs(t.races) do
					hash = hash .. "R" .. race;
				end
			end
		elseif key == "spellID" and t.itemID then
			-- Some recipes teach the same spell, so need to differentiate by their itemID as well
			hash = hash .. ":" .. t.itemID;
		end
		if t.rank then
			hash = hash .. "." .. t.rank;
			-- app.PrintDebug("hash.rank",hash)
		end
		if t.nomerge then
			hash = hash.."__"..UniqueCounter["Hash"];
		end
		t.hash = hash;
		return hash;
	end
end
app.CreateHash = CreateHash;

-- Represents default field evaluation logic for all Classes unless defined within the Class
local DefaultFields = {
	-- Cloned groups will not directly have a parent, but they will instead have a sourceParent, so fill in with that instead
	["parent"] = function(t)
		return t.sourceParent;
	end,
	-- A semi-unique string value that identifies this object based on its key, or text if it doesn't have one.
	["hash"] = function(t)
		return CreateHash(t);
	end,
	-- Default text should be a valid link or name
	["text"] = function(t)
		return t.link or t.name;
	end,
	-- Whether or not something is repeatable.
	["repeatable"] = function(t)
		return t.isDaily or t.isWeekly or t.isMonthly or t.isYearly;
	end,
	["costProgress"] = returnZero,
    ["costTotal"] = returnZero,
	["progress"] = returnZero,
    ["total"] = returnZero,
};

if app.IsRetail then
	-- Crieve doesn't see these fields being included as necessary,
	-- future research project is to look into seeing if this is something we want to keep or put somewhere else. (such as a function)
	for fieldName,fieldMethod in pairs({
		-- modItemID doesn't exist for Items which NEVER use a modID or bonusID (illusions, music rolls, mounts, etc.)
		["modItemID"] = function(t)
			return t.itemID;
		end,
		-- whether something is considered 'missing' by seeing if it can search for itself
		["_missing"] = function(t)
			local key = t.key;
			-- only process this logic for real 'Things' in the game
			if not app.ThingKeys[key] then return; end
			-- quest 76250
			-- item with modID, so key is itemID, t[key] is 13544
			-- SFO uses 'modItemID' to verify 'itemID' search result object accuracy, thus '13544' never matches the expected '13544.01'
			-- so we need to know to search by 'itemID' but using the 'modItemID' here for base itemID lookups of missing
			-- i.e. if searching 13544, we allow 13544.01 to count as a non-missing representation of the search... makes sense?
			local val = key == "itemID" and t.modItemID or t[key];
			local o = app.SearchForObject(key, val, "field") or (val == t.itemID and app.SearchForObject(key, val));
			local missing = true;
			while o do
				missing = rawget(o, "_missing");
				o = not missing and (o.sourceParent or o.parent) or nil;
			end
			t._missing = missing or false;
			return missing;
		end,
		["nmc"] = function(t)
			local c = t.c;
			local nmc = c and not containsValue(c, app.ClassIndex) or false;
			-- app.PrintDebug("base.nmc",t.__type,nmc)
			t.nmc = nmc;
			return nmc;
		end,
		["nmr"] = function(t)
			local races = t.races;
			local r = t.r;
			local nmr = (r and r ~= app.FactionID) or (races and not containsValue(races, app.RaceIndex)) or false;
			-- app.PrintDebug("base.nmr",t.__type,nmr)
			t.nmr = nmr;
			return nmr;
		end,
		-- we like to use different field names in different places
		["filterID"] = function(t)
			return t.f
		end,
		["iconPath"] = function(t)
			return rawget(t, "icon")
		end,
		["creatureID"] = function(t)	-- TODO: Do something about this, it's silly.
			return t.npcID;
		end,
	}) do
		DefaultFields[fieldName] = fieldMethod;
	end
end

-- Creates a Base Object Table which will evaluate the provided set of 'fields' (each field value being a keyed function)
local classDefinitions, _cache = {};
local call = function(class, key, t)
	_cache = rawget(class, key);
	if _cache then return _cache(t) end
end
local BaseObjectFields = not app.__perf and function(fields, className)
	if not className then
		print("A Class Name must be declared when using BaseObjectFields");
	end
	local class = { __type = function() return className; end };
	if not classDefinitions[className] then
		classDefinitions[className] = class;
	else
		print("A Class has already been defined with that name!", className);
	end
	if fields then
		for key,method in pairs(fields) do
			class[key] = method;
		end
	end

	-- Inject the default fields into the class
	for key,method in pairs(DefaultFields) do
		if not class[key] then
			class[key] = method;
		end
	end
	return {
		__class = class,
		__index = function(t, key)
			_cache = class[key];
			if _cache then return _cache(t); end
		end
	};
end
-- performance tracking wrapped base fields
or function(fields, className)
	if not className then
		print("A Class Name must be declared when using BaseObjectFields");
	end
	local class = { __type = function() return className; end };
	if not classDefinitions[className] then
		classDefinitions[className] = class;
	else
		print("A Class has already been defined with that name!", className);
	end
	if fields then
		for key,method in pairs(fields) do
			class[key] = method;
		end
	end

	-- Inject the default fields into the class
	for key,method in pairs(DefaultFields) do
		if not class[key] then
			class[key] = method;
		end
	end
	app.__perf.CaptureTable(class, className)
	return {
		__class = class,
		__index = function(t, key)
			_cache = class[key];
			if _cache then return _cache(t); end
			-- capture a new empty function return for missing keys so we can track how much missing keys are called on various classes
			class[key] = function() end
			return class[key]()
		end
	}
end
app.BaseObjectFields = BaseObjectFields;
app.BaseClass = BaseObjectFields(nil, "BaseClass");

-- Create a dictionary of classes by their classKey, for reference in generic object contructors.
local classesByKey = setmetatable({}, {
	__newindex = function(t, key, value)
		if rawget(t, key) then
			return;
		end
		rawset(t, key, value);
	end,
});
local ignoredFields = {
	g = true,
};
local function CreateClassInstance(key, id, t)
	if key then
		if key == "creatureID" then
			key = "npcID";
			if t then
				t.creatureID = nil;
				t.npcID = id;
			end
		end
		local classConstructor = classesByKey[key];
		if classConstructor then return classConstructor(id, t); end
	elseif not key then
		local classConstructor;
		for key,value in pairs(t) do
			classConstructor = classesByKey[key];
			if classConstructor then return classConstructor(value, t); end
		end
	end
	--[[
	print("CreateClassInstance::Failed to Find Class Constructor for", key, id);
	for key,value in pairs(t) do
		print(" ", key, value);
	end
	]]--
	return t;
end
local function CloneClassInstance(object, ignoreChildren)
	local clone = {};
	if object[1] then
		-- Create an Array of Clones
		for i,o in ipairs(object) do
			tinsert(clone, CloneClassInstance(o, ignoreChildren));
		end
		return clone;
	else
		-- Clone the object.
		for k,v in pairs(object) do
			if not ignoredFields[k] then
				rawset(clone, k, v);
			end
		end
		if object.g and not ignoreChildren then
			clone.g = {};
			for i,o in ipairs(object.g) do
				o = CloneClassInstance(o);
				tinsert(clone.g, o);
				o.parent = clone;
			end
		end

		local meta = getmetatable(object);
		if meta then
			setmetatable(clone, meta);
			return clone;
		else
			return CreateClassInstance(object.key, object[object.key], clone);
		end
	end
end
app.CloneClassInstance = CloneClassInstance;
app.CreateClassInstance = CreateClassInstance;

app.CreateClass = function(className, classKey, fields, ...)
	-- Validate arguments
	if not className then
		print("A Class Name must be declared when using CreateClass");
	end
	if not classKey then
		print("A Class Key must be declared when using CreateClass");
	end
	if not fields then
		print("Fields must be declared when using CreateClass");
	end

	-- app.PrintDebug("CreateClass",className, classKey)

	-- Ensure that a key field exists!
	if not fields.key then
		fields.key = function() return classKey; end;
	end

	-- If this object supports collectibleAsCost, that means it needs a way to fallback to a version of itself without any cost evaluations should it detect that it doesn't use it anywhere.
	if fields.collectibleAsCost then
		local simpleclass = {};
		for key,method in pairs(fields) do
			simpleclass[key] = method;
		end
		simpleclass.collectibleAsCost = app.ReturnFalse;
		simpleclass.collectedAsCost = nil;
		local simplemeta = BaseObjectFields(simpleclass, "Simple" .. className);
		fields.simplemeta = function(t) return simplemeta; end;
	end

	local args = { ... };
	local total = #args;
	if total > 0 then
		local conditionals = {};
		for i=1,total,3 do
			local subclassName = args[i];
			if subclassName then
				local class = args[i + 1];
				tinsert(conditionals, args[i + 2]);
				if class then
					for key,method in pairs(fields) do
						if not rawget(class, key) then
							class[key] = method;
						end
					end
					if class.collectibleAsCost then
						local simpleclass = {};
						for key,method in pairs(class) do
							simpleclass[key] = method;
						end
						simpleclass.collectibleAsCost = app.ReturnFalse;
						simpleclass.collectedAsCost = nil;
						local simplemeta = BaseObjectFields(simpleclass, "Simple" .. className .. subclassName);
						class.simplemeta = function(t) return simplemeta; end;
					end
					tinsert(conditionals, BaseObjectFields(class, className .. subclassName));
				else
					tinsert(conditionals, {});
				end
			end
		end
		total = #conditionals;
		fields.conditionals = conditionals;
		local Class = BaseObjectFields(fields, className);
		local classConstructor = function(id, t)
			t = constructor(id, t, classKey);
			for i=1,total,2 do
				if conditionals[i](t) then
					return setmetatable(t, conditionals[i + 1]);
				end
			end
			return setmetatable(t, Class);
		end;
		classesByKey[classKey] = classConstructor;
		return classConstructor, Class;
	else
		local Class = BaseObjectFields(fields, className);
		local classConstructor = function(id, t)
			return setmetatable(constructor(id, t, classKey), Class);
		end;
		classesByKey[classKey] = classConstructor;
		return classConstructor, Class;
	end
end
app.CreateClassFromArray = function(arr)
	return app.CreateClass(unpack(arr));
end
app.CreateClassWithInfo = function(className, classKey, classInfo, fields)
	-- Validate arguments
	if not className then
		print("A Class Name must be declared when using CreateClassWithInfo");
	end
	if not classKey then
		print("A Class Key must be declared when using CreateClassWithInfo");
	end
	if not fields then
		print("Fields must be declared when using CreateClassWithInfo");
	end
	if not classInfo then
		print("ClassInfo must be declared when using CreateClassWithInfo");
	end

	-- Ensure that a key and _type field exists!
	local class = {
		__type = function() return className; end,
		key = function() return classKey; end
	};
	for key,method in pairs(DefaultFields) do class[key] = method; end
	for key,method in pairs(fields) do class[key] = method; end
	if not classDefinitions[className] then
		classDefinitions[className] = class;
	else
		print("A Class has already been defined with that name!", className);
	end

	local classConstructor = function(id, t)
		if t then
			if not t.g and t[1] then
				t = { g=t };
			end
		else
			t = {};
		end
		local info = classInfo[id];
		return setmetatable(t, {
			__index = function(t, key)
				return info[key] or call(class, key, t);
			end,
		});
	end;
	classesByKey[classKey] = classConstructor;
	return classConstructor;
end
app.ExtendClass = function(baseClassName, className, classKey, fields, ...)
	local baseClass = classDefinitions[baseClassName];
	if baseClass then
		if not fields then fields = {}; end
		for key,method in pairs(baseClass) do
			if not fields[key] then
				fields[key] = method;
			end
		end
		fields.__type = nil;
		fields.key = nil;
	else
		print("Could not find specified base class:", baseClassName);
	end
	-- app.PrintDebug("ExtendClass",baseClassName, className, classKey)
	return app.CreateClass(className, classKey, fields, ...);
end

-- Allows wrapping one Type Object with another Type Object. This allows for fall-through field logic
-- without requiring a full copied definition of identical field functions and raw Object content
app.WrapObject = function(object, baseObject)
	if not object or not baseObject then
		error("Tried to WrapObject with none provided!",object,baseObject)
	end
	-- need to preserve the existing object's meta AND return the object being wrapped while also allowing fallback to the base object
	local objectMeta = getmetatable(object)
	if not objectMeta then
		error("Tried to WrapObject which has no metatable! (Wrapping not necessary)")
	end
	-- save the set of originally-defined meta-fields of this object's class
	object.__class = objectMeta.__class
	local objectMetaIndex = objectMeta.__index
	if not objectMetaIndex then
		error("Tried to WrapObject which has no index!")
	end
	if type(objectMetaIndex) == "function" then
		return setmetatable(object, {
			__index = function(t, key)
				-- app.PrintDebug("__wrapf",key
				-- 	,"Wrapped?",t.__class[key]~=nil
				-- 	,"WrapVal:",objectMetaIndex(t, key)
				-- 	,"BaseVal:",baseObject[key])
				-- the original class of the object defines a function for 'key' then use that only (allows false/nil overrides properly)
				if t.__class[key] then
					return objectMetaIndex(t, key)
				end
				return baseObject[key];
			end
		});
	end
	return setmetatable(object, {
		__index = function(t, key)
			return objectMetaIndex[key] or baseObject[key];
		end
	});
end

-- Create a local cache table which can be used by a Type class of a Thing to easily store shared
-- information based on a unique key field for any Thing object of that Type
app.CreateCache = function(idField)
	local cache, _t, v = {};
	cache.GetCached = function(t)
		local id = t[idField];
		if id then
			_t = cache[id];
			if not _t then
				_t = {};
				cache[id] = _t;
			end
			return _t, id;
		end
		app.PrintDebug("CACHE_MISS",idField,t.__type,t.hash)
		app.PrintTable(t)
	end;
	cache.GetCachedField = function(t, field, default_function)
		--[[ -- Debug Prints
		local _t, id = cache.GetCached(t);
		app.PrintDebug("GetCachedField",t.hash,id,field,_t[field]);
		--]]
		_t = cache.GetCached(t);
		if _t then
			-- set a default provided cache value if any default function was provided and evalutes to a value
			v = _t[field];
			if not v and default_function then
				local defVal = default_function(t, field);
				if defVal then
					v = defVal;
					_t[field] = v;
				end
			end
			return v;
		end
	end;
	cache.SetCachedField = function(t, field, value)
		--[[ Debug Prints
		local _t, id = cache.GetCached(t);
		if _t[field] then
			print("SetCachedField",id,field,"Old",t[field],"New",value);
		else
			print("SetCachedField",id,field,"New",value);
		end
		--]]
		_t = cache.GetCached(t);
		if _t then _t[field] = value; end
	end;
	return cache;
end

--[[
-- Proof of Concept with Class Conditionals
local fields = {
	["name"] = function(t)
		return "Loki";
	end,
	["OnTest"] = function()
		return function(t)
			print(t.name .. " (" .. t.__type .. "): I'm a god!");
		end
	end,
};
local fieldsWithArgs = {
	OnTest = function()
		return function(t)
			print(t.name .. " (" .. t.__type .. "): I'm a variant!");
		end
	end
};
local fieldsWithFeeling = {
	OnTest = function()
		return function(t)
			print(t.name .. " (" .. t.__type .. "): I'm a variant... with feeling!");
		end
	end
};
app.CreateExample = app.CreateClass("Example", "exampleID", fields,
	"WithArgs", fieldsWithArgs, (function(t) return t.args; end),
	"WithFeeling", fieldsWithFeeling, (function(t) return t.feeling; end));

for i,instance in ipairs({
	app.CreateExample(1),
	app.CreateExample(2, { name = "Alligator Loki", args = "I'm a Crocodile!" }),
	app.CreateExample(3, { name = "Sylvie", feeling = "Pretty Neat" }),
}) do
	instance.OnTest(instance);
end
]]--

-- Collected helper functions.
app.SetAccountCollected = function()
	app.print("SetCollected not initialized yet...");
end;
app.SetAccountCollectedForSubType = function()
	app.print("SetCollectedForSubType not initialized yet...");
end
app.SetCollected = function()
	app.print("SetCollected not initialized yet...");
end;
app.SetCollectedForSubType = function()
	app.print("SetCollectedForSubType not initialized yet...");
end