-------------------------------------------------------------------
--      E X P A N S I O N   F E A T U R E S    M O D U L E       --
-------------------------------------------------------------------
AZEROTHIAN_ARCHIVES = createHeader({
	readable = "Azerothian Archives",
	icon = "Interface\\Icons\\trade_archaeology",
	text = {
		en = [[~GetSpellInfo(419242)]],
	},
});

root(ROOTS.ExpansionFeatures, tier(DF_TIER, bubbleDown({ ["timeline"] = { ADDED_10_2_5 } }, {
	n(AZEROTHIAN_ARCHIVES, {
		["maps"] = {
			THALDRASZUS,
		},
		["g"] = {
			n(ACHIEVEMENTS, {
				ach(19790, {	-- The Archives Called, You Answered
					["sym"] = {{"meta_achievement",
						19685,	-- Tenured Archivist
						19786,	-- When a Rock is Just a Rock
						19791,	-- Goggle Wobble
						19787,	-- Clued In
						19789,	-- Relic Rescuer
						19788,	-- Tome Comber
						19793,	-- Finally At Rest
						19792,	-- Just One More Thing
					}},
					["g"] = {
						title(536),	-- Isles Archivist
					},
				}),
				ach(19787),	-- Clued in
				ach(19793, {	-- Finally At Rest
					["g"] = {
						i(213134),	-- Hap'he (PET!)
					},
				}),
				ach(19791),	-- Goggle Wobble
				ach(19792, {	-- Just One More Thing
					["g"] = {
						i(213133),	-- Reese (PET!)
					},
				}),
				ach(19789),	-- Relic Rescuer
				ach(19788),	-- Tome Comber
				ach(19786),	-- When a Rock is Just a Rock
			}),
			n(FACTIONS, {
				faction(FACTION_AZEROTHIAN_ARCHIVES, {
					ach(19685, {	-- Tenured Archiviest
						["minReputation"] = { FACTION_AZEROTHIAN_ARCHIVES, 5 },
					}),
				}),
			}),
			n(QUESTS, {
				q(77325, {	-- To the Archives!
					["provider"] = { "o", 405593 },	-- Azerothian Archives!
					["coord"] = { 46.6, 47.5, VALDRAKKEN },
				}),
				q(77267, {	-- Excavation 101
					["sourceQuests"] = { 77325 },	-- To the Archives!
					["provider"] = { "n", 208614 },	-- Roska Rocktooth
					["coord"] = { 61.5, 31.1, THALDRASZUS },
					["g"] = {
						i(210956),	-- Archivist's Fire Totem (QI!)
					},
				}),
				q(77231, {	-- Technoscrying 101
					["sourceQuests"] = { 77325 },	-- To the Archives!
					["provider"] = { "n", 208355 },	-- Zenata
					["coord"] = { 61.6, 31.1, THALDRASZUS },
					["g"] = {
						i(208084),	-- Technoscryers (QI!)
					},
				}),
				-- both quest above unlocked after 77325 cannot be completed as 31/12
				q(79226, {	-- The Big Dig: Traitor's Rest
					["coord"] = { 61.6, 31.3, THALDRASZUS },
					["isWeekly"] = true,
					["provider"] = { "n", 112802 },	-- Eadweard Dalyngrigge
					["g"] = {
						currency(2657),	-- Mysterious Fragment
						currency(2819),	-- Archivist Knowledge
						i(213175),	-- Dusty Djaradin Tome
						i(213185),	-- Dusty Centaur Tome
						i(213186),	-- Dusty Niffen Tome
						i(213187),	-- Dusty Drakonid Tome
						i(213188),	-- Dusty Dracthyr Tome
					},
				}),
			}),
			n(VENDORS, {
				n(209192, {	-- Provisioner Aristta
					["coord"] = { 61.4, 31.4, THALDRASZUS },
					["g"] = {
						i(213536, {	-- Priceless Artifact
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 1000 } },
						}),
						i(212635, {	-- Historian's Utility Belt (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 5000 } },
						}),
						i(212634, {	-- Historian's Fingerless Gloves (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 5000 } },
						}),
						i(212637, {	-- Historian's Striders (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 5000 } },
						}),
						i(212636, {	-- Historian's Trousers (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 7000 } },
						}),
						i(212633, {	-- Historian's Fitted Vest (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 7000 } },
						}),
						i(213276, {	-- Archivist's Magnifying Mace (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 10000 } },
						}),
						i(213275, {	-- Archivist's Rockpuller (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 10000 } },
						}),
						i(213274, {	-- Archivist's Pathfinder (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 10000 } },
						}),
						i(212870, {	-- Archivist's Stone Chisel (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 10000 } },
						}),
						i(208459, {	-- Archivist's Improvised Cudgetl (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 10000 } },
						}),
						i(208458, {	-- Archivist's Extravagant Lantern (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 10000 } },
						}),
						i(212941, {	-- Archivist's "Light Touch" (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 10000 } },
						}),
						i(208457, {	-- Archivist's Spelunking Torch (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 10000 } },
						}),
						i(208455, {	-- Archivist's Sturdy Hook (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 10000 } },
						}),
						i(208454, {	-- Archivist's Mining Pick (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 10000 } },
						}),
						i(208453, {	-- Archivist's Super Scooper (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 10000 } },
						}),
						i(208450, {	-- Coiled Archivist's Rope (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 10000 } },
						}),
						i(208547, {	-- Archivist's Reading Spectacles (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 12000 } },
						}),
						i(208546, {	-- Archivist's Rose-Tinted Glasses (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 12000 } },
						}),
						i(208456, {	-- Archivist's Elegant Bag (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 15000 } },
						}),
						i(212794, {	-- Historian's Hefty Habersack (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 15000 } },
						}),
						i(208452, {	-- Historian's Dapper Cap (COSMETIC!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 15000 } },
						}),
						i(192796, {	-- Explorer's Stonehide Packbeast (MOUNT!)
							["cost"] = { { "c", MYSTERIOUS_FRAGMENT, 20000 } },
						}),
					},
				}),
			}),
		},
	}),
})));

root(ROOTS.HiddenQuestTriggers, tier(DF_TIER, {
	n(AZEROTHIAN_ARCHIVES, bubbleDownSelf({ ["timeline"] = { ADDED_10_2_5 } }, {
		q(79616),	-- Completes alongside the weekly Azerothian Archive quest (spellID 434198)
		q(79664),	-- Completes alongside the weekly Azerothian Archive quest (spellID 434203)
		q(79670),	-- Completes alongside the weekly Azerothian Archive quest (spellID 434928)
	})),
}));