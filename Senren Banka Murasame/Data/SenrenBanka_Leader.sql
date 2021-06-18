INSERT INTO Types (Type, Kind)
VALUES	('LEADER_MURASAME',											'KIND_LEADER'	),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',							'KIND_TRAIT'	),
		('TRAIT_AGENDA_FUTATSU_NO_KAGE',							'KIND_TRAIT'	),
		('MODIFIER_MURASAME_CITIES_ADJUST_CITY_COMBAT_BONUS',		'KIND_MODIFIER'	),
		('MODIFIER_MURASAME_CITIES_ADJUST_RESOURCE_HARVEST_BONUS',	'KIND_MODIFIER'	);

INSERT INTO Leaders (LeaderType, Name, Sex, InheritFrom, SceneLayers)
VALUES ('LEADER_MURASAME', 'LOC_LEADER_MURASAME_NAME', 'Female', 'LEADER_DEFAULT', 4);

INSERT INTO CivilizationLeaders (CivilizationType, LeaderType, CapitalName)
VALUES ('CIVILIZATION_SENREN_BANKA', 'LEADER_MURASAME', 'LOC_CITY_NAME_SENREN_BANKA_1');

INSERT INTO LoadingInfo (LeaderType, ForegroundImage, BackgroundImage, PlayDawnOfManAudio)
VALUES ('LEADER_MURASAME', 'FOREGROUND_MURASAME', 'BACKGROUND_MURASAME', 1);

INSERT INTO LeaderQuotes (LeaderType, Quote, QuoteAudio)
VALUES ('LEADER_MURASAME', 'LOC_PEDIA_LEADERS_PAGE_MURASAME_QUOTE', 'SRBK_MS_WIKI_QUOTE');

--------------------------------------------------------------
INSERT INTO Traits (TraitType, Name, Description)
VALUES	('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'LOC_TRAIT_LEADER_GUARDIAN_OF_HOORI_NAME',	'LOC_TRAIT_LEADER_GUARDIAN_OF_HOORI_DESCRIPTION'),
		('TRAIT_AGENDA_FUTATSU_NO_KAGE',	'LOC_AGENDA_FUTATSU_NO_KAGE_NAME',			'LOC_AGENDA_FUTATSU_NO_KAGE_DESCRIPTION'		);

INSERT INTO LeaderTraits (LeaderType, TraitType)
VALUES	('LEADER_MURASAME',	'TRAIT_LEADER_GUARDIAN_OF_HOORI'			),
		('LEADER_MURASAME',	'TRAIT_LEADER_CULTURAL_MAJOR_CIV'			),
		('LEADER_MURASAME',	'TRAIT_LEADER_LOW_CITY_STATE_PREFERENCE_WAR');

INSERT INTO Agendas (AgendaType, Name, Description)
VALUES ('AGENDA_FUTATSU_NO_KAGE', 'LOC_AGENDA_FUTATSU_NO_KAGE_NAME', 'LOC_AGENDA_FUTATSU_NO_KAGE_DESCRIPTION');

INSERT INTO HistoricalAgendas (LeaderType, AgendaType)
VALUES ('LEADER_MURASAME', 'AGENDA_FUTATSU_NO_KAGE');

INSERT INTO ExclusiveAgendas (AgendaOne, AgendaTwo)
VALUES	('AGENDA_FUTATSU_NO_KAGE',	'AGENDA_DARWINIST'		),
		('AGENDA_FUTATSU_NO_KAGE',	'AGENDA_EXPLOITATIVE'	);

INSERT INTO AgendaTraits (AgendaType, TraitType)
VALUES ('AGENDA_FUTATSU_NO_KAGE', 'TRAIT_AGENDA_FUTATSU_NO_KAGE');

INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES	('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_FAITH_PURCHASE_RECON'			),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_FAITH_PURCHASE_MELEE'			),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_FAITH_PURCHASE_RANGED'		),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_FAITH_PURCHASE_SIEGE'			),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_FAITH_PURCHASE_LIGHT_CAVALRY'	),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_FAITH_PURCHASE_HEAVY_CAVALRY'	),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_FAITH_PURCHASE_ANTI_CAVALRY'	),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_ONSEN_TOWN_UNIT_HEAL'			),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_ADJUST_CITY_COMBAT_BONUS'		),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_ADJUST_PLOT_PURCHASE_COST'	),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_HARVEST_YIELDS_DEBUFF'		),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_FOREST_VALID_CAMPUS'			),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_FOREST_VALID_HOLY_SITE'		),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_FOREST_VALID_COMMERCIAL_HUB'	),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_FOREST_VALID_ENTERTAINMENT'	),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_FOREST_VALID_THEATER'			),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_FOREST_VALID_ONSEN_TOWN'		),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_FOREST_VALID_NEIGHBORHOOD'	),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MURASAME_FOREST_VALID_GOVERNMENT'		),
		('TRAIT_AGENDA_FUTATSU_NO_KAGE',	'AGENDA_FUTATSU_NO_KAGE_ONLY_KANOJO'	),
		('TRAIT_AGENDA_FUTATSU_NO_KAGE',	'AGENDA_FUTATSU_NO_KAGE_BUILD_HAREM'	);

--------------------------------------------------------------
INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES	('MURASAME_FAITH_PURCHASE_RECON',			'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE'		),
		('MURASAME_FAITH_PURCHASE_MELEE',			'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE'		),
		('MURASAME_FAITH_PURCHASE_RANGED',			'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE'		),
		('MURASAME_FAITH_PURCHASE_SIEGE',			'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE'		),
		('MURASAME_FAITH_PURCHASE_LIGHT_CAVALRY',	'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE'		),
		('MURASAME_FAITH_PURCHASE_HEAVY_CAVALRY',	'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE'		),
		('MURASAME_FAITH_PURCHASE_ANTI_CAVALRY',	'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE'		),
		('MURASAME_ADJUST_PLOT_PURCHASE_COST',		'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST'		),
		('MURASAME_HARVEST_YIELDS_DEBUFF',			'MODIFIER_MURASAME_CITIES_ADJUST_RESOURCE_HARVEST_BONUS'),
		('MURASAME_FOREST_VALID_CAMPUS',			'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS'),
		('MURASAME_FOREST_VALID_HOLY_SITE',			'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS'),
		('MURASAME_FOREST_VALID_COMMERCIAL_HUB',	'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS'),
		('MURASAME_FOREST_VALID_ENTERTAINMENT',		'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS'),
		('MURASAME_FOREST_VALID_THEATER',			'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS'),
		('MURASAME_FOREST_VALID_ONSEN_TOWN',		'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS'),
		('MURASAME_FOREST_VALID_NEIGHBORHOOD',		'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS'),
		('MURASAME_FOREST_VALID_GOVERNMENT',		'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES (
	'MURASAME_ONSEN_TOWN_UNIT_HEAL',
	'MODIFIER_PLAYER_UNITS_ADJUST_HEAL_PER_TURN',
	'PLOT_ADJACENT_INCLUDE_ONSEN'
),(
	'MURASAME_ADJUST_CITY_COMBAT_BONUS',
	'MODIFIER_MURASAME_CITIES_ADJUST_CITY_COMBAT_BONUS',
	'MURASAME_CITY_HAS_HOLY_SITE_REQUIREMENTS'
),(
	'AGENDA_FUTATSU_NO_KAGE_ONLY_KANOJO',
	'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',
	'MURASAME_FIREND_OR_ALLY_LONG_TIME'
),(
	'AGENDA_FUTATSU_NO_KAGE_BUILD_HAREM',
	'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',
	'MURASAME_NOT_FIREND_NOR_CONNECTION'
);

INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType)
VALUES (
	'MODIFIER_MURASAME_CITIES_ADJUST_CITY_COMBAT_BONUS',
	'COLLECTION_PLAYER_CITIES',
	'EFFECT_ADJUST_CITY_COMBAT_BONUS'
),(
	'MODIFIER_MURASAME_CITIES_ADJUST_RESOURCE_HARVEST_BONUS',
	'COLLECTION_PLAYER_CITIES',
	'EFFECT_ADJUST_CITY_RESOURCE_HARVEST_BONUS'
);

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES	('MURASAME_FAITH_PURCHASE_RECON',			'Tag',				'CLASS_RECON'					),
		('MURASAME_FAITH_PURCHASE_MELEE',			'Tag',				'CLASS_MELEE'					),
		('MURASAME_FAITH_PURCHASE_RANGED',			'Tag',				'CLASS_RANGED'					),
		('MURASAME_FAITH_PURCHASE_SIEGE',			'Tag',				'CLASS_SIEGE'					),
		('MURASAME_FAITH_PURCHASE_LIGHT_CAVALRY',	'Tag',				'CLASS_LIGHT_CAVALRY'			),
		('MURASAME_FAITH_PURCHASE_HEAVY_CAVALRY',	'Tag',				'CLASS_HEAVY_CAVALRY'			),
		('MURASAME_FAITH_PURCHASE_ANTI_CAVALRY',	'Tag',				'CLASS_ANTI_CAVALRY'			),
		('MURASAME_ONSEN_TOWN_UNIT_HEAL',			'Type',				'ALL'							),
		('MURASAME_ONSEN_TOWN_UNIT_HEAL',			'Amount',			15								),
		('MURASAME_ADJUST_CITY_COMBAT_BONUS',		'Amount',			7								),
		('MURASAME_ADJUST_PLOT_PURCHASE_COST',		'Amount',			-30								),
		('MURASAME_HARVEST_YIELDS_DEBUFF',			'Amount',			-60								),
		('MURASAME_FOREST_VALID_CAMPUS',			'DistrictType',		'DISTRICT_CAMPUS'				),
		('MURASAME_FOREST_VALID_CAMPUS',			'FeatureType',		'FEATURE_FOREST'				),
		('MURASAME_FOREST_VALID_HOLY_SITE',			'DistrictType',		'DISTRICT_HOLY_SITE'			),
		('MURASAME_FOREST_VALID_HOLY_SITE',			'FeatureType',		'FEATURE_FOREST'				),
		('MURASAME_FOREST_VALID_COMMERCIAL_HUB',	'DistrictType',		'DISTRICT_COMMERCIAL_HUB'		),
		('MURASAME_FOREST_VALID_COMMERCIAL_HUB',	'FeatureType',		'FEATURE_FOREST'				),
		('MURASAME_FOREST_VALID_ENTERTAINMENT',		'DistrictType',		'DISTRICT_ENTERTAINMENT_COMPLEX'),
		('MURASAME_FOREST_VALID_ENTERTAINMENT',		'FeatureType',		'FEATURE_FOREST'				),
		('MURASAME_FOREST_VALID_THEATER',			'DistrictType',		'DISTRICT_THEATER'				),
		('MURASAME_FOREST_VALID_THEATER',			'FeatureType',		'FEATURE_FOREST'				),
		('MURASAME_FOREST_VALID_ONSEN_TOWN',		'DistrictType',		'DISTRICT_ONSEN_TOWN'			),
		('MURASAME_FOREST_VALID_ONSEN_TOWN',		'FeatureType',		'FEATURE_FOREST'				),
		('MURASAME_FOREST_VALID_NEIGHBORHOOD',		'DistrictType',		'DISTRICT_NEIGHBORHOOD'			),
		('MURASAME_FOREST_VALID_NEIGHBORHOOD',		'FeatureType',		'FEATURE_FOREST'				),
		('MURASAME_FOREST_VALID_GOVERNMENT',		'DistrictType',		'DISTRICT_GOVERNMENT'			),
		('MURASAME_FOREST_VALID_GOVERNMENT',		'FeatureType',		'FEATURE_FOREST'				),
		('AGENDA_FUTATSU_NO_KAGE_ONLY_KANOJO',		'InitialValue',		1								),
		('AGENDA_FUTATSU_NO_KAGE_ONLY_KANOJO',		'MaxValue',			15								),
		('AGENDA_FUTATSU_NO_KAGE_ONLY_KANOJO',		'IncrementTurns',	5								),
		('AGENDA_FUTATSU_NO_KAGE_ONLY_KANOJO',		'IncrementValue',	1								),
		('AGENDA_FUTATSU_NO_KAGE_BUILD_HAREM',		'InitialValue',		-1								),
		('AGENDA_FUTATSU_NO_KAGE_BUILD_HAREM',		'MaxValue',			-10								),
		('AGENDA_FUTATSU_NO_KAGE_BUILD_HAREM',		'IncrementTurns',	5								),
		('AGENDA_FUTATSU_NO_KAGE_BUILD_HAREM',		'IncrementValue',	-1
),(
	'AGENDA_FUTATSU_NO_KAGE_ONLY_KANOJO',
	'StatementKey',
	'LOC_DIPLO_KUDO_LEADER_MURASAME_REASON_ANY'
),(
	'AGENDA_FUTATSU_NO_KAGE_ONLY_KANOJO',
	'SimpleModifierDescription',
	'LOC_DIPLO_MODIFIER_FUTATSU_NO_KAGE_ONLY_KANOJO'
),(
	'AGENDA_FUTATSU_NO_KAGE_BUILD_HAREM',
	'StatementKey',
	'LOC_DIPLO_WARNING_LEADER_MURASAME_REASON_ANY'
),(
	'AGENDA_FUTATSU_NO_KAGE_BUILD_HAREM',
	'SimpleModifierDescription',
	'LOC_DIPLO_MODIFIER_FUTATSU_NO_KAGE_BUILD_HAREM'
);

INSERT INTO ModifierStrings (ModifierId, Context, Text)
VALUES	('AGENDA_FUTATSU_NO_KAGE_ONLY_KANOJO',	'Sample',	'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'),
		('AGENDA_FUTATSU_NO_KAGE_BUILD_HAREM',	'Sample',	'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES	('MURASAME_CITY_HAS_HOLY_SITE_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL'),
		('PLOT_ADJACENT_INCLUDE_ONSEN',					'REQUIREMENTSET_TEST_ANY'),
		('MURASAME_FIREND_OR_ALLY_LONG_TIME',			'REQUIREMENTSET_TEST_ANY'),
		('MURASAME_NOT_FIREND_NOR_CONNECTION',			'REQUIREMENTSET_TEST_ALL'),
		('MURASAME_IS_FIREND_MET_LONG_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL'),
		('MURASAME_NO_DELIGATION_LONG_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL'),
		('MURASAME_NO_EMBASSY_LONG_REQUIREMENTS',		'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES	('MURASAME_CITY_HAS_HOLY_SITE_REQUIREMENTS',	'REQUIRES_CITY_HAS_HOLY_SITE'				),
		('PLOT_ADJACENT_INCLUDE_ONSEN',					'REQUIRES_PLOT_ADJACENT_ONSEN_TOWN'			),
		('MURASAME_FIREND_OR_ALLY_LONG_TIME',			'REQUIRES_MURASAME_MET_LONG_IS_FIREND'		),
		('MURASAME_FIREND_OR_ALLY_LONG_TIME',			'REQUIRES_MURASAME_IS_ALLY'					),
		('MURASAME_NOT_FIREND_NOR_CONNECTION',			'REQUIRES_MURASAME_MET_LONG_NO_DELIGATION'	),
		('MURASAME_NOT_FIREND_NOR_CONNECTION',			'REQUIRES_MURASAME_MET_LONG_NO_EMBASSY'		),
		('MURASAME_IS_FIREND_MET_LONG_REQUIREMENTS',	'REQUIRES_MAJOR_CIV_OPPONENT'				),
		('MURASAME_IS_FIREND_MET_LONG_REQUIREMENTS',	'REQUIRES_PLAYER_AT_PEACE'					),
		('MURASAME_IS_FIREND_MET_LONG_REQUIREMENTS',	'REQUIRES_MET_MURASAME_LONG_AGO'			),
		('MURASAME_IS_FIREND_MET_LONG_REQUIREMENTS',	'REQUIRES_PLAYER_DECLARED_FRIEND'			),
		('MURASAME_NO_DELIGATION_LONG_REQUIREMENTS',	'REQUIRES_MAJOR_CIV_OPPONENT'				),
		('MURASAME_NO_DELIGATION_LONG_REQUIREMENTS',	'REQUIRES_PLAYER_AT_PEACE'					),
		('MURASAME_NO_DELIGATION_LONG_REQUIREMENTS',	'REQUIRES_MET_30_TURNS_AGO'					),
		('MURASAME_NO_DELIGATION_LONG_REQUIREMENTS',	'REQUIRES_PLAYER_NOT_MURASAME_FRIEND'		),
		('MURASAME_NO_DELIGATION_LONG_REQUIREMENTS',	'REQUIRES_PLAYER_NOT_ALLY'					),
		('MURASAME_NO_DELIGATION_LONG_REQUIREMENTS',	'REQUIRES_PLAYER_NOT_MURASAME_DELEGATION'	),
		('MURASAME_NO_EMBASSY_LONG_REQUIREMENTS',		'REQUIRES_MAJOR_CIV_OPPONENT'				),
		('MURASAME_NO_EMBASSY_LONG_REQUIREMENTS',		'REQUIRES_PLAYER_AT_PEACE'					),
		('MURASAME_NO_EMBASSY_LONG_REQUIREMENTS',		'REQUIRES_MET_30_TURNS_AGO'					),
		('MURASAME_NO_EMBASSY_LONG_REQUIREMENTS',		'REQUIRES_PLAYER_NOT_MURASAME_FRIEND'		),
		('MURASAME_NO_EMBASSY_LONG_REQUIREMENTS',		'REQUIRES_PLAYER_NOT_ALLY'					),
		('MURASAME_NO_EMBASSY_LONG_REQUIREMENTS',		'REQUIRES_PLAYER_NOT_MURASAME_EMBASSY'		);

INSERT INTO Requirements (RequirementId, RequirementType, Inverse)
VALUES	('REQUIRES_PLOT_ADJACENT_ONSEN_TOWN',			'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0),
		('REQUIRES_MURASAME_MET_LONG_IS_FIREND',		'REQUIREMENT_REQUIREMENTSET_IS_MET',				0),
		('REQUIRES_MURASAME_IS_ALLY',					'REQUIREMENT_REQUIREMENTSET_IS_MET',				0),
		('REQUIRES_MURASAME_MET_LONG_NO_DELIGATION',	'REQUIREMENT_REQUIREMENTSET_IS_MET',				0),
		('REQUIRES_MURASAME_MET_LONG_NO_EMBASSY',		'REQUIREMENT_REQUIREMENTSET_IS_MET',				0),
		('REQUIRES_MET_MURASAME_LONG_AGO',				'REQUIREMENT_PLAYER_MET_X_TURNS_AGO',				0),
		('REQUIRES_PLAYER_NOT_MURASAME_FRIEND',			'REQUIREMENT_DECLARED_FRIEND',						1),
		('REQUIRES_PLAYER_NOT_MURASAME_DELEGATION',		'REQUIREMENT_DELEGATION',							1),
		('REQUIRES_PLAYER_NOT_MURASAME_EMBASSY',		'REQUIREMENT_RESIDENT_EMBASSY',						1);

INSERT INTO RequirementArguments (RequirementId, Name, Value)
VALUES	('REQUIRES_PLOT_ADJACENT_ONSEN_TOWN',			'DistrictType',			'DISTRICT_ONSEN_TOWN'						),
		('REQUIRES_PLOT_ADJACENT_ONSEN_TOWN',			'MinRange',				0											),
		('REQUIRES_MURASAME_MET_LONG_IS_FIREND',		'RequirementSetId',		'MURASAME_IS_FIREND_MET_LONG_REQUIREMENTS'	),
		('REQUIRES_MURASAME_IS_ALLY',					'RequirementSetId',		'PLAYER_ALLY'								),
		('REQUIRES_MURASAME_MET_LONG_NO_DELIGATION',	'RequirementSetId',		'MURASAME_NO_DELIGATION_LONG_REQUIREMENTS'	),
		('REQUIRES_MURASAME_MET_LONG_NO_EMBASSY',		'RequirementSetId',		'MURASAME_NO_EMBASSY_LONG_REQUIREMENTS'		),
		('REQUIRES_MET_MURASAME_LONG_AGO',				'TurnsAgo',				60											);

--------------------------------------------------------------
INSERT INTO AiListTypes (ListType)
VALUES	('MurasameCivics'),('MurasameTechs'),('MurasameWonders'),('MurasameYield'),('MurasamePseudoYield');

INSERT INTO AiLists (LeaderType, ListType, System)
VALUES	('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MurasameCivics',		'Civics'		),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MurasameTechs',		'Technologies'	),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MurasameWonders',		'Buildings'		),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MurasameYield',		'Yields'		),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',	'MurasamePseudoYield',	'PseudoYields'	);

INSERT INTO AiFavoredItems (ListType, Item, Favored)
VALUES	('MurasameCivics',		'CIVIC_THEOLOGY',				1),
		('MurasameCivics',		'CIVIC_FEUDALISM',				1),
		('MurasameCivics',		'CIVIC_CONSERVATION',			1),
		('MurasameTechs',		'TECH_IRON_WORKING',			1),
		('MurasameTechs',		'TECH_ENGINEERING',				1),
		('MurasameTechs',		'TECH_FLIGHT',					1),
		('MurasameWonders',		'BUILDING_EIFFEL_TOWER',		1),
		('MurasameWonders',		'BUILDING_MAHABODHI_TEMPLE',	1),
		('MurasameWonders',		'BUILDING_ORACLE',				1),
		('MurasameWonders',		'BUILDING_KOTOKU_IN',			1),
		('MurasameWonders',		'BUILDING_HANGING_GARDENS',		0);

INSERT INTO AiFavoredItems (ListType, Item, Value)
VALUES	('MurasameYield',		'YIELD_FOOD',					-50	),
		('MurasamePseudoYield',	'PSEUDOYIELD_GREATWORK_RELIC',	50	),
		('MurasamePseudoYield',	'PSEUDOYIELD_TOURISM',			20	),
		('MurasamePseudoYield',	'PSEUDOYIELD_ENVIRONMENT',		5	);

INSERT INTO FavoredReligions (LeaderType, ReligionType)
VALUES ('LEADER_MURASAME', 'RELIGION_SHINTO');