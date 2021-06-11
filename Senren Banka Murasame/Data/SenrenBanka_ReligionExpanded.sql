INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES	('PLOT_IS_ADJACENT_TO_HOLYSITE_TIER3_BUILDING',	'REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE1'),
		('PLOT_IS_ADJACENT_TO_HOLYSITE_TIER3_BUILDING',	'REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE2'),
		('PLOT_IS_ADJACENT_TO_HOLYSITE_TIER3_BUILDING',	'REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE3'),
		('PLOT_IS_ADJACENT_TO_HOLYSITE_TIER3_BUILDING',	'REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE4'),
		('PLOT_IS_ADJACENT_TO_HOLYSITE_TIER3_BUILDING',	'REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE5'),
		('PLOT_IS_ADJACENT_TO_HOLYSITE_TIER3_BUILDING',	'REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE6'),
		('PLOT_IS_ADJACENT_TO_HOLYSITE_TIER3_BUILDING',	'REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE7');

INSERT INTO Requirements (RequirementId, RequirementType, Inverse)
VALUES	('REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE1',	'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES',	0),
		('REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE2',	'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES',	0),
		('REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE3',	'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES',	0),
		('REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE4',	'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES',	0),
		('REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE5',	'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES',	0),
		('REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE6',	'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES',	0),
		('REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE7',	'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES',	0);

INSERT INTO RequirementArguments (RequirementId, Name, Value)
VALUES	('REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE1',	'BuildingType',	'BUILDING_P0K_BASILICA'		),
		('REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE2',	'BuildingType',	'BUILDING_P0K_BETH_MANDA'	),
		('REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE3',	'BuildingType',	'BUILDING_P0K_KHALWAT'		),
		('REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE4',	'BuildingType',	'BUILDING_P0K_BUTTO'		),
		('REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE5',	'BuildingType',	'BUILDING_P0K_DERASAR'		),
		('REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE6',	'BuildingType',	'BUILDING_P0K_CANDI'		),
		('REQUIRES_PLOT_ADJACENT_FAITH_BUILDING3_RE7',	'BuildingType',	'BUILDING_P0K_SERAPEUM'		);