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
	/* Domain  */ 'Players:Expansion1_Players',
	/* CivType */ 'CIVILIZATION_SENREN_BANKA',
	/* CivName */ 'LOC_CIVILIZATION_SENREN_BANKA_NAME',
	/* CivIcon */ 'ICON_CIVILIZATION_SENREN_BANKA',
	/* UA Name */ 'LOC_TRAIT_CIVILIZATION_SENREN_BANKA_NAME',
	/* UA Dscp */ 'LOC_TRAIT_CIVILIZATION_SENREN_BANKA_DESCRIPTION',
	/* UA Icon */ 'ICON_CIVILIZATION_SENREN_BANKA',
	/* LdrType */ 'LEADER_MURASAME',
	/* LdrName */ 'LOC_LEADER_MURASAME_NAME',
	/* LdrIcon */ 'ICON_LEADER_MURASAME',
	/* LA Name */ 'LOC_TRAIT_LEADER_GUARDIAN_OF_HOORI_NAME',
	/* LA Dscp */ 'LOC_TRAIT_LEADER_GUARDIAN_OF_HOORI_DESCRIPTION',
	/* LA Icon */ 'ICON_LEADER_MURASAME',
	/* Prtrait */ 'PORTRAIT_LEADER_GUARDIAN_OF_HOORI',
	/* Backgnd */ 'PORTRAIT_BACKGROUND_SENREN_BANKA'
),(
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
	/* LA Name */ 'LOC_TRAIT_LEADER_GUARDIAN_OF_HOORI_NAME',
	/* LA Dscp */ 'LOC_TRAIT_LEADER_GUARDIAN_OF_HOORI_DESCRIPTION_GS',
	/* LA Icon */ 'ICON_LEADER_MURASAME',
	/* Prtrait */ 'PORTRAIT_LEADER_GUARDIAN_OF_HOORI',
	/* Backgnd */ 'PORTRAIT_BACKGROUND_SENREN_BANKA'
);

INSERT INTO PlayerItems (Domain, CivilizationType, LeaderType, Type, Icon, Name, Description, SortIndex)
VALUES (
	/* Domain  */ 'Players:Expansion1_Players',
	/* CivType */ 'CIVILIZATION_SENREN_BANKA',
	/* LdrType */ 'LEADER_MURASAME',
	/* ItmType */ 'UNIT_JAPANESE_SAMURAI',
	/* ItmIcon */ 'ICON_UNIT_JAPANESE_SAMURAI',
	/* ItmName */ 'LOC_UNIT_JAPANESE_SAMURAI_NAME',
	/* Dscrptn */ 'LOC_UNIT_JAPANESE_SAMURAI_DESCRIPTION',
	/* SortIdx */ 10
),(
	/* Domain  */ 'Players:Expansion1_Players',
	/* CivType */ 'CIVILIZATION_SENREN_BANKA',
	/* LdrType */ 'LEADER_MURASAME',
	/* ItmType */ 'DISTRICT_ONSEN_TOWN',
	/* ItmIcon */ 'ICON_DISTRICT_ONSEN_TOWN',
	/* ItmName */ 'LOC_TRAIT_CIVILIZATION_DISTRICT_ONSEN_TOWN_NAME',
	/* Dscrptn */ 'LOC_TRAIT_CIVILIZATION_DISTRICT_ONSEN_TOWN_DESCRIPTION',
	/* SortIdx */ 20
),(
	/* Domain  */ 'Players:Expansion1_Players',
	/* CivType */ 'CIVILIZATION_SENREN_BANKA',
	/* LdrType */ 'LEADER_MURASAME',
	/* ItmType */ 'IMPROVEMENT_KANMIDOKORO',
	/* ItmIcon */ 'ICON_IMPROVEMENT_KANMIDOKORO',
	/* ItmName */ 'LOC_TRAIT_CIVILIZATION_IMPROVEMENT_KANMIDOKORO_NAME',
	/* Dscrptn */ 'LOC_TRAIT_CIVILIZATION_IMPROVEMENT_KANMIDOKORO_DESCRIPTION',
	/* SortIdx */ 30
),(
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
	/* ItmType */ 'DISTRICT_ONSEN_TOWN',
	/* ItmIcon */ 'ICON_DISTRICT_ONSEN_TOWN',
	/* ItmName */ 'LOC_TRAIT_CIVILIZATION_DISTRICT_ONSEN_TOWN_NAME',
	/* Dscrptn */ 'LOC_TRAIT_CIVILIZATION_DISTRICT_ONSEN_TOWN_DESCRIPTION_GS',
	/* SortIdx */ 20
),(
	/* Domain  */ 'Players:Expansion2_Players',
	/* CivType */ 'CIVILIZATION_SENREN_BANKA',
	/* LdrType */ 'LEADER_MURASAME',
	/* ItmType */ 'IMPROVEMENT_KANMIDOKORO',
	/* ItmIcon */ 'ICON_IMPROVEMENT_KANMIDOKORO',
	/* ItmName */ 'LOC_TRAIT_CIVILIZATION_IMPROVEMENT_KANMIDOKORO_NAME',
	/* Dscrptn */ 'LOC_TRAIT_CIVILIZATION_IMPROVEMENT_KANMIDOKORO_DESCRIPTION',
	/* SortIdx */ 30
);