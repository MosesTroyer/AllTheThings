﻿-------------------------------------------------------
--   C U S T O M   H E A D E R S   M O D U L E   --
-------------------------------------------------------
local _ = select(2, ...);
local L = _.L;
local simplifiedLocale = string.sub(GetLocale(),1,2);

_.HeaderConstants = {
	ACHIEVEMENTS = -1000000,
	BONUS_OBJECTIVES = -1000001,
	COMMON_BOSS_DROPS = -1000003,
	COMMON_VENDOR_ITEMS = -1000004,
	DROPS = -1000005,
	EXPLORATION = -1000006,
	FACTIONS = -1000007,
	FLIGHT_PATHS = -1000008,
	HOLIDAYS = -1000009,
	QUESTS = -1000012,
	RARES = -1000013,
	REWARDS = -1000014,
	SECRETS = -1000015,
	SPECIAL = -1000016,
	TREASURES = -1000017,
	VENDORS = -1000018,
	WORLD_BOSSES = -1000019,
	WORLD_QUESTS = -1000020,
	ZONE_DROPS = -1000021,
	ZONE_REWARDS = -1000022,
	HONOR_TITLES = -1000024,
	PVP = -1000025,
};

local a = L.HEADER_ICONS;
for key,value in pairs({
	[-1000000] = _.asset("Category_Achievements"),
	[-1000001] = "Interface/Icons/Inv_misc_map08",
	[-1000002] = _.asset("Interface_World_boss"),
	[-1000003] = "Interface/Icons/Achievement_Garrison_Horde_PVE",
	[-1000004] = "Interface/Icons/INV_Misc_Coin_02",
	[-1000005] = _.asset("Category_WorldDrops"),
	[-1000006] = _.asset("INV_Misc_Map02"),
	[-1000007] = _.asset("Category_Factions"),
	[-1000008] = _.asset("Category_FlightPaths"),
	[-1000009] = _.asset("Category_Holidays"),
	[-1000010] = "Interface/Icons/Inv_misc_map02",
	[-1000011] = "Interface/Icons/achievement_reputation_05",
	[-1000012] = _.asset("Interface_Quest_header"),
	[-1000013] = _.asset("Interface_Rare"),
	[-1000014] = _.asset("Interface_Rewards"),
	[-1000015] = _.asset("Category_Secrets"),
	[-1000016] = "Interface/Icons/Inv_archaeology_70_starlightbeacon",
	[-1000017] = _.asset("Interface_Tchest"),
	[-1000018] = _.asset("Interface_Vendor"),
	[-1000019] = _.asset("Interface_World_boss"),
	[-1000020] = _.asset("Interface_WorldQuest"),
	[-1000021] = _.asset("Interface_Zone_drop"),
	[-1000022] = _.asset("Interface_Rewards"),
	[-1000023] = "Interface/Icons/DiabloAnniversary_HoradricCube",
	[-1000024] = "Interface/Icons/inv_sword_48",
	[-1000025] = _.asset("Category_PvP"),
	[-1000026] = "Interface/Icons/achievement_featsofstrength_gladiator_01",
	[-1000027] = "Interface/Icons/achievement_featsofstrength_gladiator_02",
	[-1000028] = "Interface/Icons/achievement_featsofstrength_gladiator_03",
	[-1000029] = "Interface/Icons/achievement_featsofstrength_gladiator_04",
	[-1000030] = "Interface/Icons/ability_mount_redfrostwyrm_01",
	[-1000031] = "Interface/Icons/ability_mount_redfrostwyrm_01",
	[-1000032] = "Interface/Icons/ability_mount_redfrostwyrm_01",
	[-1000033] = "Interface/Icons/ability_mount_redfrostwyrm_01",
	[-1000034] = "Interface/Icons/ability_mount_redfrostwyrm_01",
	[-1000035] = "Interface/Icons/INV_Chest_Plate03",
	[-1000036] = "Interface/Icons/inv_scroll_11",
	[-1000037] = "Interface/Icons/inv_scroll_11",
	[-1000038] = "Interface/Icons/inv_scroll_11",
	[-1000039] = "Interface/Icons/inv_scroll_11",
	[-1000040] = "Interface/Icons/inv_scroll_11",
	[-1000041] = "Interface/Icons/inv_scroll_11",
	[-1000042] = "Interface/Icons/inv_scroll_11",
	[-1000043] = "Interface/Icons/inv_scroll_11",
	[-1000044] = "Interface/Icons/inv_scroll_11",
	[-1000045] = "Interface/Icons/inv_scroll_11",
	[-1000046] = "Interface/Icons/inv_scroll_11",
	[-1000047] = "Interface/Icons/inv_scroll_11",
	[-1000048] = "Interface/Icons/DiabloAnniversary_HoradricCube",
	[-1000049] = "Interface/Icons/diabloanniversary_achievement",
	[-1000050] = "Interface/Icons/inv_jewelry_amulet_03",
}) do a[key] = value; end

local a = L.HEADER_NAMES;
for key,value in pairs({
	[-1000000] = ACHIEVEMENTS,
	[-1000001] = TRACKER_HEADER_BONUS_OBJECTIVES,
	[-1000002] = RAID_BOSSES,
	[-1000003] = BATTLE_PET_BREED_QUALITY2.." "..TRANSMOG_SOURCE_1,
	[-1000004] = "Common Vendor Items",
	[-1000005] = "Drops",
	[-1000006] = "Exploration",
	[-1000007] = FACTION,
	[-1000008] = GetSpellInfo(218950),
	[-1000009] = GetItemSubClassInfo(15,3),
	[-1000010] = BRAWL_TOOLTIP_MAPS,
	[-1000011] = SPLASH_BATTLEFORAZEROTH_8_2_5_FEATURE1_TITLE,
	[-1000012] = TRACKER_HEADER_QUESTS,
	[-1000013] = BATTLE_PET_BREED_QUALITY4,
	[-1000014] = QUEST_REWARDS,
	[-1000015] = "Secrets",
	[-1000016] = SPECIAL,
	[-1000017] = GetSpellInfo(225652).." "..GetSpellInfo(168498),
	[-1000018] = TUTORIAL_TITLE20,
	[-1000019] = WORLD.." "..RAID_BOSSES,
	[-1000020] = TRACKER_HEADER_WORLD_QUESTS,
	[-1000021] = ZONE.." "..BATTLE_PET_SOURCE_1,
	[-1000022] = "Zone Rewards",
	[-1000023] = "Diablo IV",
	[-1000024] = HONOR .. " " .. PAPERDOLL_SIDEBAR_TITLES,
	[-1000025] = BUG_CATEGORY14,
	[-1000026] = select(2, GetAchievementInfo(2091))..": Season 1",
	[-1000027] = select(2, GetAchievementInfo(418))..": Season 2",
	[-1000028] = select(2, GetAchievementInfo(419))..": Season 3",
	[-1000029] = select(2, GetAchievementInfo(420))..": Season 4",
	[-1000030] = select(2, GetAchievementInfo(3336))..": Season 5",
	[-1000031] = "Hateful Gladiator",
	[-1000032] = select(2, GetAchievementInfo(3436))..": Season 6",
	[-1000033] = select(2, GetAchievementInfo(3758))..": Season 7",
	[-1000034] = select(2, GetAchievementInfo(4599))..": Season 8",
	[-1000035] = "Tier 0.5 Sets",
	[-1000036] = "Great Odyn and the Firelord",
	[-1000037] = "The Wanderer and the Serpent",
	[-1000038] = "Halls of Gold and Glory",
	[-1000039] = "The Keeper's Eye",
	[-1000040] = "First of the Val'kyr",
	[-1000041] = "The Sealing of the Halls of Valor",
	[-1000042] = "His Name Is Dragonblood",
	[-1000043] = "The Last Words of Asgrim the Dreadkiller",
	[-1000044] = "A Shieldmaiden's Creed",
	[-1000045] = "The Prophecy of Rythas the Oracle",
	[-1000046] = "The Lessons of the Blackfist",
	[-1000047] = "Volund's Folly",
	[-1000048] = "Diablo Events",
	[-1000049] = "Diablo 20th Anniversary",
	[-1000050] = C_PetJournal.GetPetInfoBySpeciesID(179),
}) do a[key] = value; end

local a = L.HEADER_DESCRIPTIONS;
for key,value in pairs({
	[-1000014] = "Contains Things which are rewarded or are available from other content within the containing section.\nThey are consolidated here in an effort to reduce duplication from many possible Sources.",
	[-1000015] = "Naughty secrets...",
	[-1000020] = "World Quests are time-limited Quests available in specific locations with variable rewards.\n\nMake sure to check the ATT World Quests window (/attwq) often to see what time-limited Things you should go collect!",
	[-1000022] = "These items can drop from repeatable treasure chests, wish crickets, world quests or table missions.",
	[-1000050] = "This is a Battlegrounds-based event that coincides with the beginning of the Summer Olympic games. The only time this was celebrated was in 2008 to correspond to the Beijing Olympics, and although there appeared to be the intention to repeat this event, it never returned.",
}) do a[key] = value; end

local a = L.HEADER_LORE;
for key,value in pairs({
	[-1000035] = "The Dungeon Set 2 class sets, commonly referred to as Tier 0.5, are obtained by completing a long quest chain to upgrade the first set available as drops in end game dungeons into stronger versions of themselves. In current WoW, these sets are covetted by Collectors as the quest chain was completely removed from the game with Cataclysm. In WoW Classic, you should finish this quest chain on all of your characters before then!",
}) do a[key] = value; end

if simplifiedLocale == "de" then
a = L.HEADER_NAMES;
for key,value in pairs({
	[-1000003] = "Gemeinsame Bossbeute",
	[-1000015] = "Rätsel",
	[-1000031] = "Hasserfüllten Gladiator",
	[-1000036] = "Der große Odyn und der Feuerlord",
	[-1000037] = "Der Wanderer und die Schlange",
	[-1000038] = "Hallen des Goldes und des Ruhmes",
	[-1000039] = "Das Auge des Hüters",
	[-1000040] = "Die erste der Val'kyr",
	[-1000041] = "Die Versiegelung der Hallen der Tapferkeit",
	[-1000049] = "20. Geburtstag von Diablo",
}) do a[key] = value; end
end

if simplifiedLocale == "es" then
a = L.HEADER_NAMES;
for key,value in pairs({
	[-1000031] = "Gladiador Odioso",
	[-1000036] = "El gran Odyn y el Señor del Fuego",
	[-1000037] = "El nómada y la serpiente",
	[-1000038] = "Cámaras de oro y gloria",
	[-1000039] = "El ojo del guardián",
	[-1000040] = "La primera Val'kyr",
	[-1000041] = "El sello de las Cámaras del Valor",
	[-1000042] = "Se llama Sangredragón",
	[-1000043] = "Las últimas palabras de Asgrim el Mataterrador",
	[-1000044] = "El credo de una doncella escudera",
	[-1000045] = "La profecía de Rythas el Oráculo",
	[-1000046] = "Las lecciones de Puño Opaco",
	[-1000047] = "La locura de Volund",
}) do a[key] = value; end
end

if simplifiedLocale == "fr" then
a = L.HEADER_NAMES;
for key,value in pairs({
	[-1000004] = "Objets communs des vendeurs",
	[-1000022] = "Récompenses de la zone",
	[-1000026] = select(2, GetAchievementInfo(2091))..": Saison 1",
	[-1000027] = select(2, GetAchievementInfo(418))..": Saison 2",
	[-1000028] = select(2, GetAchievementInfo(419))..": Saison 3",
	[-1000029] = select(2, GetAchievementInfo(420))..": Saison 4",
	[-1000030] = select(2, GetAchievementInfo(3336))..": Saison 5",
	[-1000031] = "Gladiateur Haineux",
	[-1000032] = select(2, GetAchievementInfo(3436))..": Saison 6",
	[-1000033] = select(2, GetAchievementInfo(3758))..": Saison 7",
	[-1000034] = select(2, GetAchievementInfo(4599))..": Saison 8",
	[-1000035] = "Ensembles Tier 0.5",
	[-1000036] = "Le grand Odyn et le seigneur du feu",
	[-1000042] = "Il s’appelait Sang de dragon",
	[-1000043] = "Les dernières paroles d’Asgrim le Tueur de l’effroi",
	[-1000044] = "Le credo de la vierge guerrière",
	[-1000045] = "La prophétie de Rythas l’Oracle",
	[-1000046] = "Les leçons du poing noir",
	[-1000047] = "La folie de Volund",
	[-1000049] = "20e anniversaire de Diablo",
}) do a[key] = value; end
end

if simplifiedLocale == "it" then
a = L.HEADER_NAMES;
for key,value in pairs({
	[-1000031] = "Gladiatore Perfido",
}) do a[key] = value; end
end

if simplifiedLocale == "ko" then
a = L.HEADER_NAMES;
for key,value in pairs({
	[-1000031] = "원한에 검투사",
}) do a[key] = value; end
end

if simplifiedLocale == "pt" then
a = L.HEADER_NAMES;
for key,value in pairs({
	[-1000031] = "Gladiador Odioso",
	[-1000036] = "O Grande Odyn e o Senhor do Fogo",
	[-1000037] = "O Andarilho e a Serpente",
	[-1000038] = "Os Salões de Ouro e Glória",
	[-1000039] = "O Olho do Guardião",
	[-1000040] = "A Primeira das Val'kyren",
	[-1000041] = "O Selamento dos Salões da Bravura",
	[-1000042] = "Ele se chama Sangue de Dragão",
	[-1000043] = "As Últimas Palavras de Asgrim, o Algoz Medonho",
	[-1000044] = "A Crença de uma Dama Escudeira",
	[-1000045] = "A Profecia de Rythas, o Oráculo",
	[-1000046] = "As Lições do Punho Negro",
	[-1000047] = "A Tolice de Volund",
}) do a[key] = value; end
end

if simplifiedLocale == "ru" then
a = L.HEADER_NAMES;
for key,value in pairs({
	[-1000003] = "Общая добыча с боссов",
	[-1000004] = "Обычные предметы у Торговцев",
	[-1000005] = BATTLE_PET_SOURCE_1,
	[-1000008] = "Точка полета",
	[-1000013] = "Редкие",
	[-1000015] = "Секреты",
	[-1000017] = "Сундук с сокровищами",
	[-1000019] = "Мировые Боссы",
	[-1000021] = "Добыча локации",
	[-1000022] = "Добыча локации",
	[-1000026] = select(2, GetAchievementInfo(2091))..": Сезон 1",
	[-1000027] = select(2, GetAchievementInfo(418))..": Сезон 2",
	[-1000028] = select(2, GetAchievementInfo(419))..": Сезон 3",
	[-1000029] = select(2, GetAchievementInfo(420))..": Сезон 4",
	[-1000030] = select(2, GetAchievementInfo(3336))..": Сезон 5",
	[-1000031] = "Злобный гладиатор",
	[-1000032] = select(2, GetAchievementInfo(3436))..": Сезон 6",
	[-1000033] = select(2, GetAchievementInfo(3758))..": Сезон 7",
	[-1000034] = select(2, GetAchievementInfo(4599))..": Сезон 8",
	[-1000035] = "Комплекты T0.5",
	[-1000036] = "Великий Один и Повелитель Огня",
	[-1000037] = "Странник и змей",
	[-1000038] = "Чертоги золота и славы",
	[-1000039] = "Глаз Хранителя",
	[-1000040] = "Первая из валь'кир",
	[-1000041] = "Печать на Чертогах Доблести",
	[-1000042] = "Октель Драконья Кровь",
	[-1000043] = "Последние слова Азгрима Смертоубийцы",
	[-1000044] = "Кредо девы щита",
	[-1000045] = "Пророчество Райтаса Провидца",
	[-1000046] = "Уроки Черного Кулака",
	[-1000047] = "Безрассудный Волунд",
	[-1000048] = "События Diablo",
	[-1000049] = "20-ая годовщина Diablo",
}) do a[key] = value; end
end

if simplifiedLocale == "zh" then
a = L.HEADER_NAMES;
for key,value in pairs({
	[-1000004] = "常规商人物品",
	[-1000005] = "掉落",
	[-1000015] = "秘密",
	[-1000018] = "商人",
	[-1000022] = "区域奖励",
	[-1000023] = "暗黑破坏神IV",
	[-1000026] = select(2, GetAchievementInfo(2091)).."：第1赛季",
	[-1000027] = select(2, GetAchievementInfo(418)).."：第2赛季",
	[-1000028] = select(2, GetAchievementInfo(419)).."：第3赛季",
	[-1000029] = select(2, GetAchievementInfo(420)).."：第4赛季",
	[-1000030] = select(2, GetAchievementInfo(3336)).."：第5赛季",
	[-1000031] = "憎恨角斗士",
	[-1000032] = select(2, GetAchievementInfo(3436)).."：第6赛季",
	[-1000033] = select(2, GetAchievementInfo(3758)).."：第7赛季",
	[-1000034] = select(2, GetAchievementInfo(4599)).."：第8赛季",
	[-1000035] = "等级 0.5 套装",
	[-1000036] = "伟大的奥丁与炎魔之王",
	[-1000037] = "流浪者与蛇",
	[-1000038] = "黄金与荣耀的殿堂",
	[-1000039] = "守护者之眼",
	[-1000040] = "首位瓦格里",
	[-1000041] = "封印英灵殿",
	[-1000042] = "他名叫龙血",
	[-1000043] = "亡灵杀手艾斯格里姆的遗言",
	[-1000044] = "女武神的信条",
	[-1000045] = "神谕者莱萨斯的预言",
	[-1000046] = "黑拳的教诲",
	[-1000047] = "沃伦德的愚行",
	[-1000049] = "暗黑破坏神20周年庆",
}) do a[key] = value; end
end

if simplifiedLocale == "cn" then
a = L.HEADER_DESCRIPTIONS;
for key,value in pairs({
	[-1000014] = "包含有奖励或可从包含部分中的其他内容获得的事物。\n在此处合并以减少来自许多可能重复来源。",
	[-1000015] = "淘气的秘密…",
	[-1000020] = "世界任务是有时间限制的任务，可在特定地点进行，奖励不一。\n\n一定要经常查看 ATT 世界任务窗口(/attwq)，看看有什么限时的东西你应该去收藏！",
	[-1000022] = "这些物品可以从可重复的宝箱、祈愿蟋蟀、世界任务或桌面任务中掉落。",
}) do a[key] = value; end
end

if simplifiedLocale == "fr" then
a = L.HEADER_DESCRIPTIONS;
for key,value in pairs({
	[-1000014] = "Contient des objets de récompenses ou disponibles dans d’autres contenus de la section qui les contient.\nIls sont regroupés ici dans le but de réduire la duplication de nombreuses sources possibles.",
	[-1000015] = "Vilains secrets...",
	[-1000020] = "Les quêtes mondiales sont des quêtes limitées dans le temps, disponibles dans des lieux spécifiques avec des récompenses variables.\n\nN’oublie pas de consulter souvent la fenêtre des quêtes mondiales ATT (/attwq) pour voir quelles sont les objets limités dans le temps que tu dois collecter !",
	[-1000022] = "Ces objets peuvent provenir de coffres au trésor répétitifs, Criquet à souhait, de quêtes mondiales ou des missions de la table de commandement.",
}) do a[key] = value; end
end

if simplifiedLocale == "ru" then
a = L.HEADER_DESCRIPTIONS;
for key,value in pairs({
	[-1000014] = "Штучки, которые можно получить в награду с разного контента в родительской секции.\nОни собраны здесь, чтобы уменьшить количество источников, когда Штучка доступна из многих мест.",
	[-1000015] = "Секретики...",
	[-1000020] = "Локальные задания – это ограниченные по времени задания, доступные в определённых местах с переменными наградами.\n\nЧаще проверяйте окно локальных заданий ATT (/attwq), чтобы увидеть какие ограниченные по времени Штучки можно собрать!",
	[-1000022] = "Эти предметы можно получить в награду из повторяемых сокровищ, заветных сверчков, локальных заданий или заданий командирского стола.",
}) do a[key] = value; end
end