INSERT INTO Players(
	Domain,
	CivilizationType,
	CivilizationName,
	CivilizationIcon,
	CivilizationAbilityName,
	CivilizationAbilityDescription,
	CivilizationAbilityIcon,
	LeaderType,
	LeaderName,
	LeaderIcon,
	LeaderAbilityName,
	LeaderAbilityDescription,
	LeaderAbilityIcon,
	Portrait,
	PortraitBackground
) VALUES (
	/* Domain  */ 'Players:Expansion2_Players',
	/* CivType */ 'CIVILIZATION_SENREN_BANKA',
	/* CivName */ 'LOC_CIVILIZATION_SENREN_BANKA_NAME',
	/* CivIcon */ 'ICON_CIVILIZATION_SENREN_BANKA',
	/* UA Name */ 'LOC_TRAIT_CIVILIZATION_SENREN_BANKA_NAME',
	/* UA Dscp */ 'LOC_TRAIT_CIVILIZATION_SENREN_BANKA_DESCRIPTION_GS',
	/* UA Icon */ 'ICON_CIVILIZATION_SENREN_BANKA',
	/* LdrType */ 'LEADER_MURASAME',
	/* LdrName */ 'LOC_LEADER_MURASAME_NAME',
	/* LdrIcon */ 'ICON_LEADER_MURASAME',
	/* LA Name */ 'LOC_TRAIT_LEADER_MURASAME_NAME',
	/* LA Dscp */ 'LOC_TRAIT_LEADER_MURASAME_DESCRIPTION',
	/* LA Icon */ 'ICON_LEADER_MURASAME',
	/* Prtrait */ 'PORTRAIT_LEADER_MURASAME',
	/* Backgnd */ 'PORTRAIT_BACKGROUND_SENREN_BANKA'
);

INSERT INTO PlayerItems (Domain, CivilizationType, LeaderType, Type, Icon, Name, Description, SortIndex)
VALUES (
	/* Domain  */ 'Players:Expansion2_Players',
	/* CivType */ 'CIVILIZATION_SENREN_BANKA',
	/* LdrType */ 'LEADER_MURASAME',
	/* ItmType */ 'UNIT_JAPANESE_SAMURAI',
	/* ItmIcon */ 'ICON_UNIT_JAPANESE_SAMURAI',
	/* ItmName */ 'LOC_UNIT_JAPANESE_SAMURAI_NAME',
	/* Dscrptn */ 'LOC_UNIT_JAPANESE_SAMURAI_DESCRIPTION',
	/* SortIdx */ 10
),(
	/* Domain  */ 'Players:Expansion2_Players',
	/* CivType */ 'CIVILIZATION_SENREN_BANKA',
	/* LdrType */ 'LEADER_MURASAME',
	/* ItmType */ 'DISTRICT_ONSEN_RESORT',
	/* ItmIcon */ 'ICON_DISTRICT_ONSEN_RESORT',
	/* ItmName */ 'LOC_DISTRICT_ONSEN_RESORT_NAME',
	/* Dscrptn */ 'LOC_DISTRICT_ONSEN_RESORT_DESCRIPTION_GS',
	/* SortIdx */ 20
),(
	/* Domain  */ 'Players:Expansion2_Players',
	/* CivType */ 'CIVILIZATION_SENREN_BANKA',
	/* LdrType */ 'LEADER_MURASAME',
	/* ItmType */ 'BUILDING_KANMIDOKORO',
	/* ItmIcon */ 'ICON_BUILDING_KANMIDOKORO',
	/* ItmName */ 'LOC_BUILDING_KANMIDOKORO_NAME',
	/* Dscrptn */ 'LOC_BUILDING_KANMIDOKORO_DESCRIPTION',
	/* SortIdx */ 30
),(
	/* Domain  */ 'Players:Expansion2_Players',
	/* CivType */ 'CIVILIZATION_SENREN_BANKA',
	/* LdrType */ 'LEADER_MURASAME',
	/* ItmType */ 'PROJECT_GOSHINTO_A',
	/* ItmIcon */ 'ICON_PROJECT_GOSHINTO_A',
	/* ItmName */ 'LOC_PROJECT_GOSHINTO_A_NAME_FRONTEND',
	/* Dscrptn */ 'LOC_PROJECT_GOSHINTO_A_DESCRIPTION',
	/* SortIdx */ 40
),(
	/* Domain  */ 'Players:Expansion2_Players',
	/* CivType */ 'CIVILIZATION_SENREN_BANKA',
	/* LdrType */ 'LEADER_MURASAME',
	/* ItmType */ 'PROJECT_GOSHINTO_B',
	/* ItmIcon */ 'ICON_PROJECT_GOSHINTO_B',
	/* ItmName */ 'LOC_PROJECT_GOSHINTO_B_NAME_FRONTEND',
	/* Dscrptn */ 'LOC_PROJECT_GOSHINTO_B_DESCRIPTION',
	/* SortIdx */ 50
);