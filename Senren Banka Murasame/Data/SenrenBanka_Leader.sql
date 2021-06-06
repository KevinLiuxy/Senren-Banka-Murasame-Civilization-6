INSERT INTO Types (Type, Kind)
VALUES	('LEADER_MURASAME',			'KIND_LEADER'	),
		('TRAIT_LEADER_MURASAME',	'KIND_TRAIT'	);

INSERT INTO Leaders (LeaderType, Name, Sex, InheritFrom, SceneLayers)
VALUES ('LEADER_MURASAME', 'LOC_LEADER_MURASAME_NAME', 'Female', 'LEADER_DEFAULT', 4);

INSERT INTO CivilizationLeaders (CivilizationType, LeaderType, CapitalName)
VALUES ('CIVILIZATION_SENREN_BANKA', 'LEADER_MURASAME', 'LOC_CITY_NAME_SENREN_BANKA_1');

INSERT INTO LoadingInfo (LeaderType, ForegroundImage, BackgroundImage, PlayDawnOfManAudio)
VALUES ('LEADER_MURASAME', NULL, 'BACKGROUND_MURASAME_LOADING', 1);

INSERT INTO DiplomacyInfo (Type, BackgroundImage)
VALUES ('LEADER_MURASAME', 'BACKGROUND_MURASAME_INGAME');

INSERT INTO LeaderQuotes (LeaderType, Quote, QuoteAudio)
VALUES ('LEADER_MURASAME', 'LOC_PEDIA_LEADERS_PAGE_MURASAME_QUOTE', 'SRBK_MS_WIKI_QUOTE');

--------------------------------------------------------------
INSERT INTO Traits (TraitType, Name, Description)
VALUES	('TRAIT_LEADER_MURASAME', 'LOC_TRAIT_LEADER_MURASAME_NAME', 'LOC_TRAIT_LEADER_MURASAME_DESCRIPTION');

INSERT INTO LeaderTraits (LeaderType, TraitType)
VALUES	('LEADER_MURASAME', 'TRAIT_LEADER_MURASAME');

INSERT INTO AiListTypes (ListType)
VALUES	('MurasameCivics'),('MurasameTechs'),('MurasameWonders'),('MurasamePseudoYield');

INSERT INTO AiLists (LeaderType, ListType, System)
VALUES	('TRAIT_LEADER_MURASAME',	'MurasameCivics',		'Civics'		),
		('TRAIT_LEADER_MURASAME',	'MurasameTechs',		'Technologies'	),
		('TRAIT_LEADER_MURASAME',	'MurasameWonders',		'Buildings'		),
		('TRAIT_LEADER_MURASAME',	'MurasamePseudoYield',	'PseudoYields'	);

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
		('MurasameWonders',		'BUILDING_HANGING_GARDENS',		0);

INSERT INTO AiFavoredItems (ListType, Item, Value)
VALUES	('MurasamePseudoYield',	'PSEUDOYIELD_GREATWORK_RELIC',		50),
		('MurasamePseudoYield',	'PSEUDOYIELD_GREATWORK_ARTIFACT',	20),
		('MurasamePseudoYield',	'PSEUDOYIELD_TOURISM',				20);
/*
INSERT INTO Agendas (AgendaType, Name, Description)
VALUES	('')*/