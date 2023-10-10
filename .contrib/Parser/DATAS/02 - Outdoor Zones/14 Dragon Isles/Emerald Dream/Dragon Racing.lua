---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------
root(ROOTS.Zones, m(DRAGON_ISLES, bubbleDown({ ["timeline"] = { ADDED_10_2_0 } }, {
	m(EMERALD_DREAM, {
		n(DRAGONRIDING_RACING, {
			header(HEADERS.Achievement, 19120, {	-- Emerald Dream Racing Completionist: Gold
				n(ACHIEVEMENTS, {
					ach(19109, {	-- Emerald Dream: Bronze
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19047,	-- Canopy Concours: Bronze
							19062,	-- Emerald Amble: Bronze
							19032,	-- Shoreline Switchback: Bronze
							18978,	-- Smoldering Sprint: Bronze
							18993,	-- Viridescent Venture: Bronze
							18943,	-- Ysera Invitational: Bronze
						}},
					}),
					ach(19110, {	-- Emerald Dream: Silver
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19048,	-- Canopy Concours: Silver
							19063,	-- Emerald Amble: Silver
							19033,	-- Shoreline Switchback: Silver
							18979,	-- Smoldering Sprint: Silver
							18994,	-- Viridescent Venture: Silver
							18944,	-- Ysera Invitational: Silver
						}},
					}),
					ach(19111, {	-- Emerald Dream: Gold
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19049,	-- Canopy Concours: Gold
							19064,	-- Emerald Amble: Gold
							19034,	-- Shoreline Switchback: Gold
							18980,	-- Smoldering Sprint: Gold
							18995,	-- Viridescent Venture: Gold
							18945,	-- Ysera Invitational: Gold
						}},
					}),
					ach(19112, {	-- Emerald Dream Advanced: Bronze
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19050,	-- Canopy Concours Advanced: Bronze
							19065,	-- Emerald Amble Advanced: Bronze
							19035,	-- Shoreline Switchback Advanced: Bronze
							18981,	-- Smoldering Sprint Advanced: Bronze
							18996,	-- Viridescent Venture Advanced: Bronze
							18946,	-- Ysera Invitational Advanced: Bronze
						}},
					}),
					ach(19113, {	-- Emerald Dream Advanced: Silver
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19051,	-- Canopy Concours Advanced: Silver
							19066,	-- Emerald Amble Advanced: Silver
							19036,	-- Shoreline Switchback Advanced: Silver
							18982,	-- Smoldering Sprint Advanced: Silver
							18997,	-- Viridescent Venture Advanced: Silver
							18947,	-- Ysera Invitational Advanced: Silver
						}},
					}),
					ach(19114, {	-- Emerald Dream Advanced: Gold
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19052,	-- Canopy Concours Advanced: Gold
							19067,	-- Emerald Amble Advanced: Gold
							19037,	-- Shoreline Switchback Advanced: Gold
							18983,	-- Smoldering Sprint Advanced: Gold
							18998,	-- Viridescent Venture Advanced: Gold
							18948,	-- Ysera Invitational Advanced: Gold
						}},
					}),
					ach(19115, {	-- Emerald Dream Reverse: Bronze
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19053,	-- Canopy Concours Reverse: Bronze
							19068,	-- Emerald Amble Reverse: Bronze
							19038,	-- Shoreline Switchback Reverse: Bronze
							18984,	-- Smoldering Sprint Reverse: Bronze
							18999,	-- Viridescent Venture Reverse: Bronze
							18949,	-- Ysera Invitational Reverse: Bronze
						}},
					}),
					ach(19116, {	-- Emerald Dream Reverse: Silver
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19054,	-- Canopy Concours Reverse: Silver
							19069,	-- Emerald Amble Reverse: Silver
							19039,	-- Shoreline Switchback Reverse: Silver
							18985,	-- Smoldering Sprint Reverse: Silver
							19000,	-- Viridescent Venture Reverse: Silver
							18950,	-- Ysera Invitational Reverse: Silver
						}},
					}),
					ach(19117, {	-- Emerald Dream Reverse: Gold
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19055,	-- Canopy Concours Reverse: Gold
							19070,	-- Emerald Amble Reverse: Gold
							19040,	-- Shoreline Switchback Reverse: Gold
							18986,	-- Smoldering Sprint Reverse: Gold
							19001,	-- Viridescent Venture Reverse: Gold
							18951,	-- Ysera Invitational Reverse: Gold
						}},
					}),
					ach(19118, {	-- Emerald Dream Racing Completionist
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19109,	-- Emerald Dream: Bronze
							19112,	-- Emerald Dream Advanced: Bronze
							19115,	-- Emerald Dream Reverse: Bronze
						}},
					}),
					ach(19119, {	-- Emerald Dream Racing Completionist: Silver
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19110,	-- Emerald Dream: Silver
							19113,	-- Emerald Dream Advanced: Silver
							19116,	-- Emerald Dream Reverse: Silver
						}},
					}),
					ach(19120, {	-- Emerald Dream Racing Completionist: Gold
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19111,	-- Emerald Dream: Gold
							19114,	-- Emerald Dream Advanced: Gold
							19117,	-- Emerald Dream Reverse: Gold
						}},
						["g"] = {
							title(522),	-- Dream Racer <Name>
						},
					}),
				}),
				n(QUESTS, {
					dragonridingrace(78102, {	-- Canopy Concours
						["provider"] = { "n", 202749 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19047),	-- Canopy Concours: Bronze
							ach(19048),	-- Canopy Concours: Silver
							ach(19049),	-- Canopy Concours: Gold
						},
					}),
					dragonridingrace(78103, {	-- Canopy Concours - Advanced
						["provider"] = { "n", 202749 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19050),	-- Canopy Concours Advanced: Bronze
							ach(19051),	-- Canopy Concours Advanced: Silver
							ach(19052),	-- Canopy Concours Advanced: Gold
						},
					}),
					dragonridingrace(78104, {	-- Canopy Concours - Reverse
						["provider"] = { "n", 202749 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19053),	-- Canopy Concours Reverse: Bronze
							ach(19054),	-- Canopy Concours Reverse: Silver
							ach(19055),	-- Canopy Concours Reverse: Gold
						},
					}),
					dragonridingrace(78115, {	-- Emerald Amble
						["provider"] = { "n", 202676 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19062),	-- Emerald Amble: Bronze
							ach(19063),	-- Emerald Amble: Silver
							ach(19064),	-- Emerald Amble: Gold
						},
					}),
					dragonridingrace(78116, {	-- Emerald Amble - Advanced
						["provider"] = { "n", 202676 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19065),	-- Emerald Amble Advanced: Bronze
							ach(19066),	-- Emerald Amble Advanced: Silver
							ach(19067),	-- Emerald Amble Advanced: Gold
						},
					}),
					dragonridingrace(78117, {	-- Emerald Amble - Reverse
						["provider"] = { "n", 202676 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19068),	-- Emerald Amble Reverse: Bronze
							ach(19069),	-- Emerald Amble Reverse: Silver
							ach(19070),	-- Emerald Amble Reverse: Gold
						},
					}),
					dragonridingrace(78016, {	-- Shoreline Switchback
						["provider"] = { "n", 202524 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19032),	-- Shoreline Switchback: Bronze
							ach(19033),	-- Shoreline Switchback: Silver
							ach(19034),	-- Shoreline Switchback: Gold
						},
					}),
					dragonridingrace(78017, {	-- Shoreline Switchback - Advanced
						["provider"] = { "n", 202524 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19035),	-- Shoreline Switchback Advanced: Bronze
							ach(19036),	-- Shoreline Switchback Advanced: Silver
							ach(19037),	-- Shoreline Switchback Advanced: Gold
						},
					}),
					dragonridingrace(78018, {	-- Shoreline Switchback - Reverse
						["provider"] = { "n", 202524 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19038),	-- Shoreline Switchback Reverse: Bronze
							ach(19039),	-- Shoreline Switchback Reverse: Silver
							ach(19040),	-- Shoreline Switchback Reverse: Gold
						},
					}),
					dragonridingrace(77983, {	-- Smoldering Sprint
						["provider"] = { "n", 202772 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(18978),	-- Smoldering Sprint: Bronze
							ach(18979),	-- Smoldering Sprint: Silver
							ach(18980),	-- Smoldering Sprint: Gold
						},
					}),
					dragonridingrace(77984, {	-- Smoldering Sprint - Advanced
						["provider"] = { "n", 202772 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(18981),	-- Smoldering Sprint Advanced: Bronze
							ach(18982),	-- Smoldering Sprint Advanced: Silver
							ach(18983),	-- Smoldering Sprint Advanced: Gold
						},
					}),
					dragonridingrace(77985, {	-- Smoldering Sprint - Reverse
						["provider"] = { "n", 202772 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(18984),	-- Smoldering Sprint Reverse: Bronze
							ach(18985),	-- Smoldering Sprint Reverse: Silver
							ach(18986),	-- Smoldering Sprint Reverse: Gold
						},
					}),
					dragonridingrace(77996, {	-- Viridescent Venture
						["provider"] = { "n", 202795 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(18993),	-- Viridescent Venture: Bronze
							ach(18994),	-- Viridescent Venture: Silver
							ach(18995),	-- Viridescent Venture: Gold
						},
					}),
					dragonridingrace(77997, {	-- Viridescent Venture - Advanced
						["provider"] = { "n", 202795 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(18996),	-- Viridescent Venture Advanced: Bronze
							ach(18997),	-- Viridescent Venture Advanced: Silver
							ach(18998),	-- Viridescent Venture Advanced: Gold
						},
					}),
					dragonridingrace(77998, {	-- Viridescent Venture - Reverse
						["provider"] = { "n", 202795 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(18999),	-- Viridescent Venture Reverse: Bronze
							ach(19000),	-- Viridescent Venture Reverse: Silver
							ach(19001),	-- Viridescent Venture Reverse: Gold
						},
					}),
					dragonridingrace(77841, {	-- Ysera Invitational
						["provider"] = { "n", 202973 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(18943),	-- Ysera Invitational: Bronze
							ach(18944),	-- Ysera Invitational: Silver
							ach(18945),	-- Ysera Invitational: Gold
						},
					}),
					dragonridingrace(77842, {	-- Ysera Invitational - Advanced
						["provider"] = { "n", 202973 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(18946),	-- Ysera Invitational Advanced: Bronze
							ach(18947),	-- Ysera Invitational Advanced: Silver
							ach(18948),	-- Ysera Invitational Advanced: Gold
						},
					}),
					dragonridingrace(77843, {	-- Ysera Invitational - Reverse
						["provider"] = { "n", 202973 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(18949),	-- Ysera Invitational Reverse: Bronze
							ach(18950),	-- Ysera Invitational Reverse: Silver
							ach(18951),	-- Ysera Invitational Reverse: Gold
						},
					}),
				}),
			}),
			header(HEADERS.Achievement, 19129, {	-- Emerald Dream Challenge Racing Completionist: Gold
				n(ACHIEVEMENTS, {
					ach(19121, {	-- Emerald Dream Challenge: Bronze
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19056,	-- Canopy Concours Challenge: Bronze
							19071,	-- Emerald Amble Challenge: Bronze
							19041,	-- Shoreline Switchback Challenge: Bronze
							18987,	-- Smoldering Sprint Challenge: Bronze
							19002,	-- Viridescent Venture Challenge: Bronze
							18952,	-- Ysera Invitational Challenge: Bronze
						}},
					}),
					ach(19122, {	-- Emerald Dream Challenge: Silver
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19058,	-- Canopy Concours Challenge: Silver
							19073,	-- Emerald Amble Challenge: Silver
							19043,	-- Shoreline Switchback Challenge: Silver
							18989,	-- Smoldering Sprint Challenge: Silver
							19004,	-- Viridescent Venture Challenge: Silver
							18954,	-- Ysera Invitational Challenge: Silver
						}},
					}),
					ach(19123, {	-- Emerald Dream Challenge: Gold
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19060,	-- Canopy Concours Challenge: Gold
							19075,	-- Emerald Amble Challenge: Gold
							19045,	-- Shoreline Switchback Challenge: Gold
							18991,	-- Smoldering Sprint Challenge: Gold
							19006,	-- Viridescent Venture Challenge: Gold
							18956,	-- Ysera Invitational Challenge: Gold
						}},
					}),
					ach(19124, {	-- Emerald Dream Reverse Challenge: Bronze
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19057,	-- Canopy Concours Reverse Challenge: Bronze
							19072,	-- Emerald Amble Reverse Challenge: Bronze
							19042,	-- Shoreline Switchback Reverse Challenge: Bronze
							18988,	-- Smoldering Sprint Reverse Challenge: Bronze
							19003,	-- Viridescent Venture Reverse Challenge: Bronze
							18953,	-- Ysera Invitational Reverse Challenge: Bronze
						}},
					}),
					ach(19125, {	-- Emerald Dream Reverse Challenge: Silver
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19059,	-- Canopy Concours Reverse Challenge: Silver
							19074,	-- Emerald Amble Reverse Challenge: Silver
							19044,	-- Shoreline Switchback Reverse Challenge: Silver
							18990,	-- Smoldering Sprint Reverse Challenge: Silver
							19005,	-- Viridescent Venture Reverse Challenge: Silver
							18955,	-- Ysera Invitational Reverse Challenge: Silver
						}},
					}),
					ach(19126, {	-- Emerald Dream Reverse Challenge: Gold
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19061,	-- Canopy Concours Reverse Challenge: Gold
							19076,	-- Emerald Amble Reverse Challenge: Gold
							19046,	-- Shoreline Switchback Reverse Challenge: Gold
							18992,	-- Smoldering Sprint Reverse Challenge: Gold
							19007,	-- Viridescent Venture Reverse Challenge: Gold
							18957,	-- Ysera Invitational Reverse Challenge: Gold
						}},
					}),
					ach(19127, {	-- Emerald Dream Challenge Racing Completionist
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19121,	-- Emerald Dream Challenge: Bronze
							19124,	-- Emerald Dream Reverse Challenge: Bronze
						}},
					}),
					ach(19128, {	-- Emerald Dream Challenge Racing Completionist: Silver
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19122,	-- Emerald Dream Challenge: Silver
							19125,	-- Emerald Dream Reverse Challenge: Silver
						}},
					}),
					ach(19129, {	-- Emerald Dream Challenge Racing Completionist: Gold
						-- Meta Achievement
						["sym"] = {{"meta_achievement",
							19123,	-- Emerald Dream Challenge: Gold
							19126,	-- Emerald Dream Reverse Challenge: Gold
						}},
						["g"] = {
							title(524),	-- Emerald Ace <Name>
						},
					}),
				}),
				n(QUESTS, {
					dragonridingrace(78105, {	-- Canopy Concours - Challenge
						["provider"] = { "n", 202749 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19056),	-- Canopy Concours Challenge: Bronze
							ach(19058),	-- Canopy Concours Challenge: Silver
							ach(19060),	-- Canopy Concours Challenge: Gold
						},
					}),
					dragonridingrace(78106, {	-- Canopy Concours - Reverse Challenge
						["provider"] = { "n", 202749 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19057),	-- Canopy Concours Reverse Challenge: Bronze
							ach(19059),	-- Canopy Concours Reverse Challenge: Silver
							ach(19061),	-- Canopy Concours Reverse Challenge: Gold
						},
					}),
					dragonridingrace(78118, {	-- Emerald Amble - Challenge
						["provider"] = { "n", 202676 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19071),	-- Emerald Amble Challenge: Bronze
							ach(19073),	-- Emerald Amble Challenge: Silver
							ach(19075),	-- Emerald Amble Challenge: Gold
						},
					}),
					dragonridingrace(78119, {	-- Emerald Amble - Reverse Challenge
						["provider"] = { "n", 202676 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19072),	-- Emerald Amble Reverse Challenge: Bronze
							ach(19074),	-- Emerald Amble Reverse Challenge: Silver
							ach(19076),	-- Emerald Amble Reverse Challenge: Gold
						},
					}),
					dragonridingrace(78019, {	-- Shoreline Switchback - Challenge
						["provider"] = { "n", 202524 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19041),	-- Shoreline Switchback Challenge: Bronze
							ach(19043),	-- Shoreline Switchback Challenge: Silver
							ach(19045),	-- Shoreline Switchback Challenge: Gold
						},
					}),
					dragonridingrace(78020, {	-- Shoreline Switchback - Reverse Challenge
						["provider"] = { "n", 202524 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19042),	-- Shoreline Switchback Reverse Challenge: Bronze
							ach(19044),	-- Shoreline Switchback Reverse Challenge: Silver
							ach(19046),	-- Shoreline Switchback Reverse Challenge: Gold
						},
					}),
					dragonridingrace(77986, {	-- Viridescent Venture - Challenge
						["provider"] = { "n", 202795 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19002),	-- Viridescent Venture Challenge: Bronze
							ach(19004),	-- Viridescent Venture Challenge: Silver
							ach(19006),	-- Viridescent Venture Challenge: Gold
						},
					}),
					dragonridingrace(77987, {	-- Viridescent Venture - Reverse Challenge
						["provider"] = { "n", 202795 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(19003),	-- Viridescent Venture Reverse Challenge: Bronze
							ach(19005),	-- Viridescent Venture Reverse Challenge: Silver
							ach(19007),	-- Viridescent Venture Reverse Challenge: Gold
						},
					}),
					dragonridingrace(77999, {	-- Smoldering Sprint - Challenge
						["provider"] = { "n", 202772 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(18987),	-- Smoldering Sprint Challenge: Bronze
							ach(18989),	-- Smoldering Sprint Challenge: Silver
							ach(18991),	-- Smoldering Sprint Challenge: Gold
						},
					}),
					dragonridingrace(78000, {	-- Smoldering Sprint - Reverse Challenge
						["provider"] = { "n", 202772 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(18988),	-- Smoldering Sprint Reverse Challenge: Bronze
							ach(18990),	-- Smoldering Sprint Reverse Challenge: Silver
							ach(18992),	-- Smoldering Sprint Reverse Challenge: Gold
						},
					}),
					dragonridingrace(77844, {	-- Ysera Invitational - Challenge
						["provider"] = { "n", 202973 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(18952),	-- Ysera Invitational Challenge: Bronze
							ach(18954),	-- Ysera Invitational Challenge: Silver
							ach(18956),	-- Ysera Invitational Challenge: Gold
						},
					}),
					dragonridingrace(77845, {	-- Ysera Invitational - Reverse Challenge
						["provider"] = { "n", 202973 },	-- Bronze Timekeeper
						--["coord"] = {  },
						["g"] = {
							ach(18953),	-- Ysera Invitational Reverse Challenge: Bronze
							ach(18955),	-- Ysera Invitational Reverse Challenge: Silver
							ach(18957),	-- Ysera Invitational Reverse Challenge: Gold
						},
					}),
				}),
			}),
		}),
	}),
})));