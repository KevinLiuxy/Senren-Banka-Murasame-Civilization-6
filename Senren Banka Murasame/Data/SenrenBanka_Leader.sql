INSERT INTO Types (Type, Kind)
VALUES	('LEADER_MURASAME',	'KIND_LEADER'	);

INSERT INTO Leaders (LeaderType, Name, Sex, InheritFrom, SceneLayers)
VALUES ('LEADER_MURASAME', 'LOC_LEADER_MURASAME_NAME', 'Female', 'LEADER_DEFAULT', 4);

INSERT INTO CivilizationLeaders (CivilizationType, LeaderType, CapitalName)
VALUES ('CIVILIZATION_SENREN_BANKA', 'LEADER_MURASAME', 'LOC_CITY_NAME_SENREN_BANKA_1');

INSERT INTO LoadingInfo (LeaderType, ForegroundImage, BackgroundImage, PlayDawnOfManAudio)
VALUES ('LEADER_MURASAME', NULL, 'BACKGROUND_MURASAME_LOADING', 1);

INSERT INTO DiplomacyInfo (Type, BackgroundImage)
VALUES ('LEADER_MURASAME', 'BACKGROUND_MURASAME_INGAME');

INSERT INTO LeaderQuotes (LeaderType, Quote, QuoteAudio)
VALUES ('LEADER_MURASAME', 'LOC_PEDIA_LEADERS_PAGE_MURASAME_QUOTE', 'SRBK_MS_MISC_PEP_TALK_A');

--------------------------------------------------------------