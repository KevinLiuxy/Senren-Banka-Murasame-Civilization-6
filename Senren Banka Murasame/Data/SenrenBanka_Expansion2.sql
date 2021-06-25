UPDATE Traits SET Description = 'LOC_TRAIT_CIVILIZATION_SENREN_BANKA_DESCRIPTION_GS'
WHERE TraitType = 'TRAIT_CIVILIZATION_SENREN_BANKA';

UPDATE Traits SET Description = 'LOC_TRAIT_LEADER_GUARDIAN_OF_HOORI_DESCRIPTION_GS'
WHERE TraitType = 'TRAIT_LEADER_GUARDIAN_OF_HOORI';

UPDATE Traits SET Description = 'LOC_TRAIT_CIVILIZATION_DISTRICT_ONSEN_TOWN_DESCRIPTION_GS'
WHERE TraitType = 'TRAIT_CIVILIZATION_DISTRICT_ONSEN_TOWN';

UPDATE Districts SET Description = 'LOC_DISTRICT_ONSEN_TOWN_DESCRIPTION_GS'
WHERE DistrictType = 'DISTRICT_ONSEN_TOWN';

UPDATE Modifiers SET SubjectRequirementSetId = 'DISTRICT_IS_ONSEN_TOWN_ADJACENT_TO_ONSEN'
WHERE ModifierId = 'ONSEN_TOWN_ADD_AMENITIES';

UPDATE Modifiers SET SubjectRequirementSetId = 'DISTRICT_IS_ONSEN_TOWN_ADJACENT_TO_ONSEN'
WHERE ModifierId = 'ONSEN_TOWN_ADD_TOURISM';

INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES	('TRAIT_CIVILIZATION_SENREN_BANKA',			'TRAIT_SENREN_BANKA_COMMERCIAL_VOLCANIC_SOIL_ADJACENCY'	),
		('TRAIT_CIVILIZATION_SENREN_BANKA',			'TRAIT_SENREN_BANKA_HOLYSITE_VOLCANIC_SOIL_ADJACENCY'	),
		('TRAIT_CIVILIZATION_SENREN_BANKA',			'TRAIT_SENREN_BANKA_THEATER_VOLCANIC_SOIL_ADJACENCY'	),
		('TRAIT_CIVILIZATION_SENREN_BANKA',			'TRAIT_SENREN_BANKA_COMMERCIAL_GEOTHERMAL_ADJACENCY'	),
		('TRAIT_CIVILIZATION_SENREN_BANKA',			'TRAIT_SENREN_BANKA_HOLYSITE_GEOTHERMAL_ADJACENCY'		),
		('TRAIT_CIVILIZATION_SENREN_BANKA',			'TRAIT_SENREN_BANKA_THEATER_GEOTHERMAL_ADJACENCY'		),
		('TRAIT_LEADER_GUARDIAN_OF_HOORI',			'MURASAME_FOREST_VALID_CANAL'							),
		('TRAIT_CIVILIZATION_DISTRICT_ONSEN_TOWN',	'ONSEN_TOWN_GEOTHERMAL_CULTURE'							);

INSERT INTO Districts_XP2 (DistrictType, PreventsDrought)
VALUES ('DISTRICT_ONSEN_TOWN', 1);

INSERT INTO District_Adjacencies (DistrictType, YieldChangeId)
VALUES ('DISTRICT_INDUSTRIAL_ZONE', 'OnsenTown_Production');

INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict)
VALUES ('OnsenTown_Production', 'LOC_DISTRICT_AQUEDUCT_PRODUCTION', 'YIELD_PRODUCTION', 2, 1, 'DISTRICT_ONSEN_TOWN');

INSERT INTO District_BuildChargeProductions (DistrictType, UnitType, PercentProductionPerCharge)
VALUES ('DISTRICT_ONSEN_TOWN', 'UNIT_MILITARY_ENGINEER', 20);

INSERT INTO Improvement_ValidFeatures (ImprovementType, FeatureType)
VALUES	('IMPROVEMENT_KANMIDOKORO',	'FEATURE_FLOODPLAINS_GRASSLAND'	),
		('IMPROVEMENT_KANMIDOKORO',	'FEATURE_FLOODPLAINS_PLAINS'	),
		('IMPROVEMENT_KANMIDOKORO',	'FEATURE_VOLCANIC_SOIL'			);

INSERT INTO StartBiasFeatures (CivilizationType, FeatureType, Tier)
VALUES ('CIVILIZATION_SENREN_BANKA', 'FEATURE_GEOTHERMAL_FISSURE', 1);

INSERT INTO AgendaPreferredLeaders (LeaderType, AgendaType, PercentageChance)
VALUES ('LEADER_MURASAME', 'AGENDA_DESTINATION_CIV', 67);

INSERT INTO AiFavoredItems (ListType, Item, Favored)
VALUES ('MurasameWonders', 'BUILDING_GREAT_BATH', 1);

--------------------------------------------------------------
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES (
	'TRAIT_SENREN_BANKA_COMMERCIAL_VOLCANIC_SOIL_ADJACENCY',
	'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY',
	'REQUIREMENTS_CITY_BLE_10_POPULATION'
),(
	'TRAIT_SENREN_BANKA_HOLYSITE_VOLCANIC_SOIL_ADJACENCY',
	'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY',
	'REQUIREMENTS_CITY_BLE_10_POPULATION'
),(
	'TRAIT_SENREN_BANKA_THEATER_VOLCANIC_SOIL_ADJACENCY',
	'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY',
	'REQUIREMENTS_CITY_BLE_10_POPULATION'
),(
	'TRAIT_SENREN_BANKA_COMMERCIAL_GEOTHERMAL_ADJACENCY',
	'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY',
	'REQUIREMENTS_CITY_BLE_10_POPULATION'
),(
	'TRAIT_SENREN_BANKA_HOLYSITE_GEOTHERMAL_ADJACENCY',
	'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY',
	'REQUIREMENTS_CITY_BLE_10_POPULATION'
),(
	'TRAIT_SENREN_BANKA_THEATER_GEOTHERMAL_ADJACENCY',
	'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY',
	'REQUIREMENTS_CITY_BLE_10_POPULATION'
),(
	'MURASAME_FOREST_VALID_CANAL',
	'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS',
	NULL
),(
	'ONSEN_TOWN_GEOTHERMAL_CULTURE',
	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',
	'CITY_HAS_ONSEN_TOWN_REQUIREMENTS'
),(
	'ONSEN_TOWN_GEOTHERMAL_CULTURE_MODIFIER',
	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',
	'PLOT_HAS_GEOTHERMAL_REQUIREMENTS_SENREN_BANKA'
);

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES	('TRAIT_SENREN_BANKA_COMMERCIAL_VOLCANIC_SOIL_ADJACENCY',	'DistrictType',		'DISTRICT_COMMERCIAL_HUB'					),
		('TRAIT_SENREN_BANKA_COMMERCIAL_VOLCANIC_SOIL_ADJACENCY',	'FeatureType',		'FEATURE_VOLCANIC_SOIL'						),
		('TRAIT_SENREN_BANKA_COMMERCIAL_VOLCANIC_SOIL_ADJACENCY',	'YieldType',		'YIELD_GOLD'								),
		('TRAIT_SENREN_BANKA_COMMERCIAL_VOLCANIC_SOIL_ADJACENCY',	'Amount',			2											),
		('TRAIT_SENREN_BANKA_COMMERCIAL_VOLCANIC_SOIL_ADJACENCY',	'Description',		'LOC_SRBK_DISTRICT_VOLCANIC_SOIL_GOLD'		),
		('TRAIT_SENREN_BANKA_HOLYSITE_VOLCANIC_SOIL_ADJACENCY',		'DistrictType',		'DISTRICT_HOLY_SITE'						),
		('TRAIT_SENREN_BANKA_HOLYSITE_VOLCANIC_SOIL_ADJACENCY',		'FeatureType',		'FEATURE_VOLCANIC_SOIL'						),
		('TRAIT_SENREN_BANKA_HOLYSITE_VOLCANIC_SOIL_ADJACENCY',		'YieldType',		'YIELD_FAITH'								),
		('TRAIT_SENREN_BANKA_HOLYSITE_VOLCANIC_SOIL_ADJACENCY',		'Amount',			2											),
		('TRAIT_SENREN_BANKA_HOLYSITE_VOLCANIC_SOIL_ADJACENCY',		'Description',		'LOC_SRBK_DISTRICT_VOLCANIC_SOIL_FAITH'		),
		('TRAIT_SENREN_BANKA_THEATER_VOLCANIC_SOIL_ADJACENCY',		'DistrictType',		'DISTRICT_THEATER'							),
		('TRAIT_SENREN_BANKA_THEATER_VOLCANIC_SOIL_ADJACENCY',		'FeatureType',		'FEATURE_VOLCANIC_SOIL'						),
		('TRAIT_SENREN_BANKA_THEATER_VOLCANIC_SOIL_ADJACENCY',		'YieldType',		'YIELD_CULTURE'								),
		('TRAIT_SENREN_BANKA_THEATER_VOLCANIC_SOIL_ADJACENCY',		'Amount',			2											),
		('TRAIT_SENREN_BANKA_THEATER_VOLCANIC_SOIL_ADJACENCY',		'Description',		'LOC_SRBK_DISTRICT_VOLCANIC_SOIL_CULTURE'	),
		('TRAIT_SENREN_BANKA_COMMERCIAL_GEOTHERMAL_ADJACENCY',		'DistrictType',		'DISTRICT_COMMERCIAL_HUB'					),
		('TRAIT_SENREN_BANKA_COMMERCIAL_GEOTHERMAL_ADJACENCY',		'FeatureType',		'FEATURE_GEOTHERMAL_FISSURE'				),
		('TRAIT_SENREN_BANKA_COMMERCIAL_GEOTHERMAL_ADJACENCY',		'YieldType',		'YIELD_GOLD'								),
		('TRAIT_SENREN_BANKA_COMMERCIAL_GEOTHERMAL_ADJACENCY',		'Amount',			2											),
		('TRAIT_SENREN_BANKA_COMMERCIAL_GEOTHERMAL_ADJACENCY',		'Description',		'LOC_SRBK_DISTRICT_GEOTHERMAL_GOLD'			),
		('TRAIT_SENREN_BANKA_HOLYSITE_GEOTHERMAL_ADJACENCY',		'DistrictType',		'DISTRICT_HOLY_SITE'						),
		('TRAIT_SENREN_BANKA_HOLYSITE_GEOTHERMAL_ADJACENCY',		'FeatureType',		'FEATURE_GEOTHERMAL_FISSURE'				),
		('TRAIT_SENREN_BANKA_HOLYSITE_GEOTHERMAL_ADJACENCY',		'YieldType',		'YIELD_FAITH'								),
		('TRAIT_SENREN_BANKA_HOLYSITE_GEOTHERMAL_ADJACENCY',		'Amount',			2											),
		('TRAIT_SENREN_BANKA_HOLYSITE_GEOTHERMAL_ADJACENCY',		'Description',		'LOC_SRBK_DISTRICT_GEOTHERMAL_FAITH'		),
		('TRAIT_SENREN_BANKA_THEATER_GEOTHERMAL_ADJACENCY',			'DistrictType',		'DISTRICT_THEATER'							),
		('TRAIT_SENREN_BANKA_THEATER_GEOTHERMAL_ADJACENCY',			'FeatureType',		'FEATURE_GEOTHERMAL_FISSURE'				),
		('TRAIT_SENREN_BANKA_THEATER_GEOTHERMAL_ADJACENCY',			'YieldType',		'YIELD_CULTURE'								),
		('TRAIT_SENREN_BANKA_THEATER_GEOTHERMAL_ADJACENCY',			'Amount',			2											),
		('TRAIT_SENREN_BANKA_THEATER_GEOTHERMAL_ADJACENCY',			'Description',		'LOC_SRBK_DISTRICT_GEOTHERMAL_CULTURE'		),
		('MURASAME_FOREST_VALID_CANAL',								'DistrictType',		'DISTRICT_CANAL'							),
		('MURASAME_FOREST_VALID_CANAL',								'FeatureType',		'FEATURE_FOREST'							),
		('ONSEN_TOWN_GEOTHERMAL_CULTURE',							'ModifierId',		'ONSEN_TOWN_GEOTHERMAL_CULTURE_MODIFIER'	),
		('ONSEN_TOWN_GEOTHERMAL_CULTURE_MODIFIER',					'YieldType',		'YIELD_CULTURE'								),
		('ONSEN_TOWN_GEOTHERMAL_CULTURE_MODIFIER',					'Amount',			3											);

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES	('DISTRICT_IS_ONSEN_TOWN_ADJACENT_TO_ONSEN',		'REQUIREMENTSET_TEST_ALL'),
		('PLOT_ADJACENT_TO_ONSEN_REQUIREMENTS',				'REQUIREMENTSET_TEST_ANY'),
		('CITY_HAS_ONSEN_TOWN_REQUIREMENTS',				'REQUIREMENTSET_TEST_ALL'),
		('PLOT_HAS_GEOTHERMAL_REQUIREMENTS_SENREN_BANKA',	'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES	('PLOT_ADJACENT_INCLUDE_ONSEN',						'PLOT_ADJACENT_GEOTHERMAL_FISSURE_SENREN_BANKA'		),
		('DISTRICT_IS_ONSEN_TOWN_ADJACENT_TO_ONSEN',		'REQUIRES_DISTRICT_IS_ONSEN_TOWN'					),
		('DISTRICT_IS_ONSEN_TOWN_ADJACENT_TO_ONSEN',		'REQUIRES_PLOT_ADJACENT_TO_ONSEN'					),
		('PLOT_ADJACENT_TO_ONSEN_REQUIREMENTS',				'PLOT_ADJACENT_TO_GEOTHERMAL_FISSURE_REQUIREMENT'	),
		('PLOT_ADJACENT_TO_ONSEN_REQUIREMENTS',				'PLOT_ADJACENT_TO_VOLCANIC_SOIL_REQUIREMENT'		),
		('PLOT_ADJACENT_TO_ONSEN_REQUIREMENTS',				'PLOT_ADJACENT_TO_VOLCANO_REQUIREMENT_SENREN_BANKA'	),
		('CITY_HAS_ONSEN_TOWN_REQUIREMENTS',				'REQUIRES_CITY_HAS_ONSEN_TOWN'						),
		('PLOT_HAS_GEOTHERMAL_REQUIREMENTS_SENREN_BANKA',	'REQUIRES_PLOT_HAS_GEOTHERMAL_FIISSURE'				);

INSERT INTO Requirements (RequirementId, RequirementType)
VALUES	('REQUIRES_PLOT_ADJACENT_TO_ONSEN',						'REQUIREMENT_REQUIREMENTSET_IS_MET'				),
		('PLOT_ADJACENT_GEOTHERMAL_FISSURE_SENREN_BANKA',		'REQUIREMENT_PLOT_ADJACENT_FEATURE_TYPE_MATCHES'),
		('PLOT_ADJACENT_TO_VOLCANO_REQUIREMENT_SENREN_BANKA',	'REQUIREMENT_PLOT_ADJACENT_FEATURE_TYPE_MATCHES'),
		('REQUIRES_CITY_HAS_ONSEN_TOWN',						'REQUIREMENT_CITY_HAS_DISTRICT'					);

INSERT INTO RequirementArguments (RequirementId, Name, Value)
VALUES	('REQUIRES_PLOT_ADJACENT_TO_ONSEN',						'RequirementSetId',		'PLOT_ADJACENT_TO_ONSEN_REQUIREMENTS'	),
		('REQUIRES_PLOT_ADJACENT_TO_ONSEN',						'OnlyOwnersCity',		0										),
		('PLOT_ADJACENT_GEOTHERMAL_FISSURE_SENREN_BANKA',		'FeatureType',			'FEATURE_GEOTHERMAL_FISSURE'			),
		('PLOT_ADJACENT_GEOTHERMAL_FISSURE_SENREN_BANKA',		'MinRange',				0										),
		('PLOT_ADJACENT_TO_VOLCANO_REQUIREMENT_SENREN_BANKA',	'FeatureType',			'FEATURE_VOLCANO'						),
		('REQUIRES_CITY_HAS_ONSEN_TOWN',						'DistrictType',			'DISTRICT_ONSEN_TOWN'					),
		('REQUIRES_CITY_HAS_ONSEN_TOWN',						'MustBeFunctioning',	1										);

--------------------------------------------------------------
INSERT INTO NamedDeserts (NamedDesertType, Name)
VALUES ('NAMED_DESSERT_SENREN_BANKA1', 'LOC_NAMED_DESSERT_SENREN_BANKA1');

INSERT INTO NamedDesertCivilizations (NamedDesertType, CivilizationType)
VALUES ('NAMED_DESSERT_SENREN_BANKA1', 'CIVILIZATION_SENREN_BANKA');

INSERT INTO NamedDesertCivilizations (NamedDesertType, CivilizationType)
SELECT NamedDesertType, 'CIVILIZATION_SENREN_BANKA'
FROM NamedDesertCivilizations WHERE CivilizationType = 'CIVILIZATION_JAPAN';

INSERT INTO NamedLakes (NamedLakeType, Name)
VALUES	('NAMED_LAKE_SENREN_BANKA1', 'LOC_NAMED_LAKE_SENREN_BANKA1'),
		('NAMED_LAKE_SENREN_BANKA2', 'LOC_NAMED_LAKE_SENREN_BANKA2'),
		('NAMED_LAKE_SENREN_BANKA3', 'LOC_NAMED_LAKE_SENREN_BANKA3'),
		('NAMED_LAKE_SENREN_BANKA4', 'LOC_NAMED_LAKE_SENREN_BANKA4'),
		('NAMED_LAKE_SENREN_BANKA5', 'LOC_NAMED_LAKE_SENREN_BANKA5'),
		('NAMED_LAKE_SENREN_BANKA6', 'LOC_NAMED_LAKE_SENREN_BANKA6');

INSERT INTO NamedLakeCivilizations (NamedLakeType, CivilizationType)
VALUES	('NAMED_LAKE_SENREN_BANKA1', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_LAKE_SENREN_BANKA2', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_LAKE_SENREN_BANKA3', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_LAKE_SENREN_BANKA4', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_LAKE_SENREN_BANKA5', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_LAKE_SENREN_BANKA6', 'CIVILIZATION_SENREN_BANKA');

INSERT INTO NamedLakeCivilizations (NamedLakeType, CivilizationType)
SELECT NamedLakeType, 'CIVILIZATION_SENREN_BANKA'
FROM NamedLakeCivilizations WHERE CivilizationType = 'CIVILIZATION_JAPAN';

INSERT INTO NamedMountains (NamedMountainType, Name)
VALUES	('NAMED_MOUNTAIN_SENREN_BANKA1', 'LOC_NAMED_MOUNTAIN_SENREN_BANKA1'),
		('NAMED_MOUNTAIN_SENREN_BANKA2', 'LOC_NAMED_MOUNTAIN_SENREN_BANKA2'),
		('NAMED_MOUNTAIN_SENREN_BANKA3', 'LOC_NAMED_MOUNTAIN_SENREN_BANKA3'),
		('NAMED_MOUNTAIN_SENREN_BANKA4', 'LOC_NAMED_MOUNTAIN_SENREN_BANKA4');

INSERT INTO NamedMountainCivilizations (NamedMountainType, CivilizationType)
VALUES	('NAMED_MOUNTAIN_SENREN_BANKA1', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_MOUNTAIN_SENREN_BANKA2', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_MOUNTAIN_SENREN_BANKA3', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_MOUNTAIN_SENREN_BANKA4', 'CIVILIZATION_SENREN_BANKA');

INSERT INTO NamedMountainCivilizations (NamedMountainType, CivilizationType)
SELECT NamedMountainType, 'CIVILIZATION_SENREN_BANKA'
FROM NamedMountainCivilizations WHERE CivilizationType = 'CIVILIZATION_JAPAN';

INSERT INTO NamedOceanCivilizations (NamedOceanType, CivilizationType)
SELECT NamedOceanType, 'CIVILIZATION_SENREN_BANKA'
FROM NamedOceanCivilizations WHERE CivilizationType = 'CIVILIZATION_JAPAN';

INSERT INTO NamedRivers (NamedRiverType, Name)
VALUES	('NAMED_RIVER_SENREN_BANKA1', 'LOC_NAMED_RIVER_SENREN_BANKA1'),
		('NAMED_RIVER_SENREN_BANKA2', 'LOC_NAMED_RIVER_SENREN_BANKA2'),
		('NAMED_RIVER_SENREN_BANKA3', 'LOC_NAMED_RIVER_SENREN_BANKA3'),
		('NAMED_RIVER_SENREN_BANKA4', 'LOC_NAMED_RIVER_SENREN_BANKA4');

INSERT INTO NamedRiverCivilizations (NamedRiverType, CivilizationType)
VALUES	('NAMED_RIVER_SENREN_BANKA1', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_RIVER_SENREN_BANKA2', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_RIVER_SENREN_BANKA3', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_RIVER_SENREN_BANKA4', 'CIVILIZATION_SENREN_BANKA');

INSERT INTO NamedRiverCivilizations (NamedRiverType, CivilizationType)
SELECT NamedRiverType, 'CIVILIZATION_SENREN_BANKA'
FROM NamedRiverCivilizations WHERE CivilizationType = 'CIVILIZATION_JAPAN';

INSERT INTO NamedSeaCivilizations (NamedSeaType, CivilizationType)
SELECT NamedSeaType, 'CIVILIZATION_SENREN_BANKA'
FROM NamedSeaCivilizations WHERE CivilizationType = 'CIVILIZATION_JAPAN';

INSERT INTO NamedVolcanoes (NamedVolcanoType, Name)
VALUES	('NAMED_VOLCANO_SENREN_BANKA1', 'LOC_NAMED_VOLCANO_SENREN_BANKA1'),
		('NAMED_VOLCANO_SENREN_BANKA2', 'LOC_NAMED_VOLCANO_SENREN_BANKA2'),
		('NAMED_VOLCANO_SENREN_BANKA3', 'LOC_NAMED_VOLCANO_SENREN_BANKA3'),
		('NAMED_VOLCANO_SENREN_BANKA4', 'LOC_NAMED_VOLCANO_SENREN_BANKA4'),
		('NAMED_VOLCANO_SENREN_BANKA5', 'LOC_NAMED_VOLCANO_SENREN_BANKA5'),
		('NAMED_VOLCANO_SENREN_BANKA6', 'LOC_NAMED_VOLCANO_SENREN_BANKA6');

INSERT INTO NamedVolcanoCivilizations (NamedVolcanoType, CivilizationType)
VALUES	('NAMED_VOLCANO_SENREN_BANKA1', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_VOLCANO_SENREN_BANKA2', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_VOLCANO_SENREN_BANKA3', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_VOLCANO_SENREN_BANKA4', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_VOLCANO_SENREN_BANKA5', 'CIVILIZATION_SENREN_BANKA'),
		('NAMED_VOLCANO_SENREN_BANKA6', 'CIVILIZATION_SENREN_BANKA');

INSERT INTO NamedVolcanoCivilizations (NamedVolcanoType, CivilizationType)
SELECT NamedVolcanoType, 'CIVILIZATION_SENREN_BANKA'
FROM NamedVolcanoCivilizations WHERE CivilizationType = 'CIVILIZATION_JAPAN';