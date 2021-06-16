INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_GUARDIAN_OF_HOORI', 'MURASAME_FOREST_VALID_PRESERVE');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES ('MURASAME_FOREST_VALID_PRESERVE', 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES	('MURASAME_FOREST_VALID_PRESERVE',	'DistrictType',	'DISTRICT_PRESERVE'	),
		('MURASAME_FOREST_VALID_PRESERVE',	'FeatureType',	'FEATURE_FOREST'	);