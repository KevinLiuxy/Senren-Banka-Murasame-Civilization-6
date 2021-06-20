-- Copyright 2017-2019, Firaxis Games
include( "InGameTopOptionsMenu" );

-- ===========================================================================
--	OVERRIDES
-- ===========================================================================
BASE_LateInitialize = LateInitialize;

-- ===========================================================================
function OnExpansionIntro()
	PlaySoundMurasame("SRBK_MS_MENU_EXTRA");
	Controls.PauseWindow:SetHide(true);
	LuaEvents.InGameTopOptionsMenu_ShowExpansionIntro();
end

-- ===========================================================================
--	OVERRIDE
-- ===========================================================================
function LateInitialize()	
	BASE_LateInitialize();

	local isWorldBuilder :boolean = WorldBuilder and WorldBuilder:IsActive();
	if (isWorldBuilder) then
		Controls.ExpansionNewFeatures:SetHide(true);
	else
		Controls.ExpansionNewFeatures:SetHide(false);
		Controls.ExpansionNewFeatures:RegisterCallback( Mouse.eLClick, OnExpansionIntro );
		Controls.ExpansionNewFeatures:RegisterCallback( Mouse.eMouseEnter, function() UI.PlaySound("Main_Menu_Mouse_Over"); end);
	end
end