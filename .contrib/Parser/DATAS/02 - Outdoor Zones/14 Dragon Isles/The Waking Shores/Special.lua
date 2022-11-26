---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------
root("Zones", m(DRAGON_ISLES, bubbleDown({ ["timeline"] = TIMELINE_DFREL }, {
	m(THE_WAKING_SHORES, {
		n(SPECIAL, {
			o(377899, {	-- Hidden Hornswog Hostage
				["coord"] = { 64.9, 69.6, THE_WAKING_SHORES },
				["questID"] = 67048,
				["g"] = {
					i(199916),	-- Roseate Hopper (PET!)
				},
			}),
			i(200063, {	-- Observant Riddle "Treat"
				["cost"] = {
					{ "i", 200065, 1 },	-- 1xAdventurer's Lost Soap Bar
					{ "i", 200064, 1 },	-- 1xMarmoni's Prize
					{ "i", 200066, 1 },	-- 1xWell-Preserved Bone
				},
			}),
			n(192362, {	-- Possessive Hornswog
				["coord"] = { 64.9, 69.6, THE_WAKING_SHORES },
				["questID"] = 70864,
				["cost"] = { { "i", 200063, 1 }, },	-- 1xObservant Riddle "Treat"
			}),
		}),
	}),
})));