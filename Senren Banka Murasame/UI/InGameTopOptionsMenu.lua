-- ===========================================================================
--	InGameTopOptionsMenu
-- ===========================================================================
include( "Civ6Common" );
include( "Colors") ;
include( "SupportFunctions" );
include( "InputSupport" );
include( "InstanceManager" );
include( "PopupDialog" );
include( "LocalPlayerActionSupport" );
include( "PopupPriorityLoader_", true );

-- ===========================================================================
--	GLOBALS
-- ===========================================================================
g_ModListingsManager = InstanceManager:new("ModInstance", "ModTitle", Controls.ModListingsStack);

-- ===========================================================================
--	MEMBERS
-- ===========================================================================
local m_kPopupDialog	: table;			-- Custom due to Utmost popup status
local ms_ExitToMain		: boolean = true;
local m_isSimpleMenu	: boolean = false;
local m_isLoadingDone   : boolean = false;
local m_isRetired		: boolean = false;
local m_isEndGameOpen	: boolean = false;
local m_isNeedRestoreOptions		: boolean = false;
local m_isNeedRestoreSaveGameMenu	: boolean = false;
local m_isNeedRestoreLoadGameMenu	: boolean = false;

-- State variable to track that the menu is in the process of being closed and 
-- prevent duplicate calls.
local m_isClosing		: boolean = false;

-- ===========================================================================
--	COSTANTS
-- ===========================================================================
local ICON_PREFIX:string = "ICON_";

-- ===========================================================================
--	FUNCTIONS
-- ===========================================================================
function PlaySoundMurasame(event:string)
	if (PlayerConfigurations[0]:GetLeaderTypeName() == 'LEADER_MURASAME') then
		UI.PlaySound(event);
	end
end

function OnReallyRetire()
	m_isRetired = true;
    UI.RequestAction(ActionTypes.ACTION_RETIRE);
	CloseImmediately();
	UI.PlaySound("Notification_Misc_Negative");
end

function OnRetireGame()
	PlaySoundMurasame("SRBK_MS_MENU_END");
	-- If we're in an extended game AND we're the winner.  Just re-open the end-game menu.
	-- Otherwise, prompt for retirement.
	local me = Game.GetLocalPlayer();
	if (me) then
		local localPlayer = Players[me];
		if (localPlayer) then
			if (Game.GetWinningTeam() == localPlayer:GetTeam()) then
				LuaEvents.ShowEndGame(me);	
			else
				if (not m_kPopupDialog:IsOpen()) then
					m_kPopupDialog:AddText( Locale.Lookup("LOC_GAME_MENU_RETIRE_WARNING"));
					m_kPopupDialog:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_YES_BUTTON_CAPTION"), OnReallyRetire, nil, nil, "PopupButtonInstanceRed" );
					m_kPopupDialog:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_NO_BUTTON_CAPTION"), nil );
					m_kPopupDialog:Open();
				end
			end
		end
	end
end

-- ===========================================================================
function OnReallyRestart()
	-- Start a fresh game using the existing game configuration.
	Network.RestartGame();
end

function OnRestartGame()
	if (not m_kPopupDialog:IsOpen()) then
		PlaySoundMurasame("SRBK_MS_MENU_RESET");
		m_kPopupDialog:AddText( Locale.Lookup("LOC_GAME_MENU_RESTART_WARNING"));
		m_kPopupDialog:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_YES_BUTTON_CAPTION"), OnReallyRestart, nil, nil, "PopupButtonInstanceRed" );
		m_kPopupDialog:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_NO_BUTTON_CAPTION"), nil );
		m_kPopupDialog:Open();
	end
end

-- ===========================================================================
function DoPBCDelete()
	Network.CloudKillGame();

	-- Show killing game popup
	m_kPopupDialog:Close(); -- clear out the popup incase it is already open.
	m_kPopupDialog:AddText( Locale.Lookup("LOC_GAME_MENU_DELETE_GAME_STARTED"));
	m_kPopupDialog:Open();
	-- Next step is in OnCloudGameKilled.
end

function OnPBCDeleteButton()
	if (not m_kPopupDialog:IsOpen()) then
		m_kPopupDialog:AddText( Locale.Lookup("LOC_GAME_MENU_PBC_DELETE_WARNING"));
		m_kPopupDialog:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_YES_BUTTON_CAPTION"), DoPBCDelete, nil, nil, "PopupButtonInstanceRed" );
		m_kPopupDialog:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_NO_BUTTON_CAPTION"), nil );
		m_kPopupDialog:Open();
	end
end

-- ===========================================================================
function DoPBCQuit()
	Network.CloudQuitGame();

	-- Show quitting game popup
	m_kPopupDialog:Close(); -- clear out the popup incase it is already open.
	m_kPopupDialog:AddText( Locale.Lookup("LOC_GAME_MENU_QUITING_GAME_STARTED"));
	m_kPopupDialog:Open();
	-- Next step is in OnCloudGameQuit.
end

function OnPBCQuitButton()
	if (not m_kPopupDialog:IsOpen()) then
		m_kPopupDialog:AddText( Locale.Lookup("LOC_GAME_MENU_PBC_QUIT_WARNING"));
		m_kPopupDialog:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_YES_BUTTON_CAPTION"), DoPBCQuit, nil, nil, "PopupButtonInstanceRed" );
		m_kPopupDialog:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_NO_BUTTON_CAPTION"), nil );
		m_kPopupDialog:Open();
	end
end

-- ===========================================================================
function OnExitGame()
	PlaySoundMurasame("SRBK_MS_MENU_GOODBYE");

	local pFriends = Network.GetFriends();
	if pFriends ~= nil then
        pFriends:ClearRichPresence();
    end

    Events.UserConfirmedClose();
end

-- ===========================================================================
function OnCancelExit()
	if m_isNeedRestoreOptions then Controls.Options:SetHide( false ); end
	if m_isNeedRestoreSaveGameMenu then Controls.SaveGameMenu:SetHide( false ); end
	if m_isNeedRestoreLoadGameMenu then Controls.LoadGameMenu:SetHide( false ); end
end

-- ===========================================================================
function OnExitGameAskAreYouSure()
	if (not m_kPopupDialog:IsOpen()) then
		PlaySoundMurasame("SRBK_MS_MENU_END");
		-- Menus that may be up; same prioritiy as in-game menu which is 
		-- problematic for raising a non-content, non-queue "popup" message
		m_isNeedRestoreOptions = UIManager:IsInPopupQueue(Controls.Options);
		m_isNeedRestoreSaveGameMenu = UIManager:IsInPopupQueue(Controls.SaveGameMenu);
		m_isNeedRestoreLoadGameMenu = UIManager:IsInPopupQueue(Controls.LoadGameMenu);
		Controls.Options:SetHide( true );
		Controls.SaveGameMenu:SetHide( true );
		Controls.LoadGameMenu:SetHide( true );

		m_kPopupDialog:AddText( Locale.Lookup("LOC_GAME_MENU_QUIT_WARNING"));		
		m_kPopupDialog:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_YES_BUTTON_CAPTION"), OnExitGame, nil, nil, "PopupButtonInstanceRed" );
		m_kPopupDialog:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_NO_BUTTON_CAPTION"), OnCancelExit );
		m_kPopupDialog:Open();
	end
end

-- ===========================================================================
function OnMainMenu()
	ms_ExitToMain = true;
	if (not m_kPopupDialog:IsOpen()) then
		PlaySoundMurasame("SRBK_MS_MENU_TITLE");
		m_kPopupDialog:AddText( Locale.Lookup("LOC_GAME_MENU_EXIT_WARNING"));
		m_kPopupDialog:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_YES_BUTTON_CAPTION"), OnYes, nil, nil, "PopupButtonInstanceRed" );
		m_kPopupDialog:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_NO_BUTTON_CAPTION"), OnNo );
		m_kPopupDialog:Open();
	end
end

-- ===========================================================================
function OnQuickSaveGame()
	if (CanLocalPlayerSaveGame()) then 
		PlaySoundMurasame("SRBK_MS_MENU_SAVE");
		local gameFile = {};
		gameFile.Name = "quicksave";
		gameFile.Location = SaveLocations.LOCAL_STORAGE;
		gameFile.Type= Network.GetGameConfigurationSaveType();
		gameFile.IsAutosave = false;
		gameFile.IsQuicksave = true;

		Network.SaveGame(gameFile);	
		UI.PlaySound("Confirm_Bed_Positive");
	end
end

-- ===========================================================================
function OnOptions()
	PlaySoundMurasame("SRBK_MS_MENU_SYSTEM");
	Controls.PauseWindow:SetHide(true);
	UIManager:QueuePopup(Controls.Options, PopupPriority.Current);
end

-- ===========================================================================
function OnLoadGame()
	if (CanLocalPlayerLoadGame()) then 
		PlaySoundMurasame("SRBK_MS_MENU_LOAD");
		Controls.PauseWindow:SetHide(true);
		LuaEvents.InGameTopOptionsMenu_SetLoadGameServerType(ServerType.SERVER_TYPE_NONE);
		UIManager:QueuePopup(Controls.LoadGameMenu, PopupPriority.Current);	
	end
end

-- ===========================================================================
function OnSaveGame()
	if (CanLocalPlayerSaveGame()) then 
		PlaySoundMurasame("SRBK_MS_MENU_SAVE");
		Controls.PauseWindow:SetHide(true);
		UIManager:QueuePopup(Controls.SaveGameMenu, PopupPriority.Current);	
	end
end

-- ===========================================================================
function CloseImmediately()	
	if UIManager:IsInPopupQueue( ContextPtr ) then
		LuaEvents.InGameTopOptionsMenu_Close();
		UIManager:DequeuePopup( ContextPtr );
		UI.SetSoundStateValue("Game_Views", "Normal_View");
	end	
	m_isClosing = false;	
end

-- ===========================================================================
function Close()
	if (m_isClosing) then
		print("Menu is already closing.");
		return;
	end
	
	m_isClosing = true;
	EffectsManager:ResumeAllEffects();	-- Resume any continous particle effects.

	if (Controls.AlphaIn:IsStopped()) then
		-- Animation is good for a nice clean animation out..
		Controls.AlphaIn:Reverse();
		Controls.SlideIn:Reverse();
		Controls.PauseWindowClose:SetToBeginning();
		Controls.PauseWindowClose:Play();
	else
		-- Animation is not in an expected state, just reset all...
		Controls.AlphaIn:SetToBeginning();
		Controls.SlideIn:SetToBeginning();
		Controls.PauseWindowClose:SetToBeginning();
		ShutdownAfterClose();
		UI.DataError("Forced closed() of the in game top options menu.  (Okay if someone was spamming ESC.)");
	end

	local playerChange =  ContextPtr:LookUpControl( "/InGame/PlayerChange" );
	if (not UIManager:IsInPopupQueue(playerChange)) then
		LuaEvents.InGameTopOptionsMenu_Close();
	end	

	-- Only pop the context if what we expect is the current context.
	if (Input.GetActiveContext() == InputContext.GameOptions) then
		Input.PopContext();
	else
		print("Expected a different input active context...");
	end
end

-- ===========================================================================
function ShutdownAfterClose()
	m_isClosing = false;
	UIManager:DequeuePopup( ContextPtr );
	UI.SetSoundStateValue("Game_Views", "Normal_View");
	UI.PlaySound("UI_Pause_Menu_On");
end

-- ===========================================================================
--	UI callback
-- ===========================================================================
function OnReturn()
	if (not ContextPtr:IsHidden() and m_isClosing ~= true) then
		PlaySoundMurasame("SRBK_MS_MENU_GAME");
		Close();
	end
end

-- ===========================================================================
--	LUA Event
--	Reduce the # of options in the menu (for tutorial purposes)
-- ===========================================================================
function OnSimpleInGameMenu( isSimpleMenu )
	-- For the demo, always keep it simple
	if UI.HasFeature("Demo") then
		isSimpleMenu = true;
	end

	if isSimpleMenu == nil then isSimpleMenu = true; end
	m_isSimpleMenu = isSimpleMenu;
end

-- ===========================================================================
function SetupButtons()
	local bIsObserver : boolean = false;
	local localPlayerID : number = Game.GetLocalPlayer();
	if (localPlayerID ~= PlayerTypes.NONE)then
		local localPlayerConfig = PlayerConfigurations[Game.GetLocalPlayer()];
		bIsObserver = not localPlayerConfig:IsAlive();
	end
	local bWorldBuilder : boolean = WorldBuilder and WorldBuilder:IsActive();
	local bIsAutomation : boolean = Automation.IsActive();
	local bIsMultiplayer: boolean = GameConfiguration.IsAnyMultiplayer();
	local bCanSave		: boolean = CanLocalPlayerSaveGame();
	local bCanLoad		: boolean = CanLocalPlayerLoadGame();
	local bCanRestart	: boolean = not GameConfiguration.IsAnyMultiplayer() 
					-- TTP 34989 - Only allow restarts in hotseat if this is not a loaded save.  
					-- The restart mechanic uses the game configuration prior to the very beginning of the game.
					-- This can be unexpected if the user changed the player types post launch. 
					or (GameConfiguration.IsHotseat() and not GameConfiguration.IsSavedGame());
					
	-- Restarting in worldbuilder can cause a bunch of problems, disabling for now.
	bCanRestart = bCanRestart and not bWorldBuilder;

	local bIsLocalPlayersTurn : boolean = IsLocalPlayerTurnActive();

	if (bWorldBuilder) then
		Controls.ReturnButton:LocalizeAndSetText("{LOC_GAME_MENU_RETURN_TO_WORLDBUILDER:upper}");
		Controls.SaveGameButton:LocalizeAndSetText("{LOC_SAVE_MAP_BUTTON:upper}");
	else
		Controls.ReturnButton:LocalizeAndSetText("{LOC_GAME_MENU_RETURN_TO_GAME:upper}");
		Controls.SaveGameButton:LocalizeAndSetText("{LOC_GAME_MENU_SAVE:upper}");
	end

	Controls.QuickSaveButton:SetDisabled( not bCanSave );
	Controls.SaveGameButton:SetDisabled( not bCanSave );
	Controls.LoadGameButton:SetDisabled( not bCanLoad );
	Controls.RetireButton:SetDisabled( not bIsLocalPlayersTurn );
	
	Controls.QuickSaveButton:SetHide(m_isSimpleMenu or bIsAutomation or bWorldBuilder);
	Controls.SaveGameButton:SetHide(m_isSimpleMenu or bIsAutomation);			
	Controls.LoadGameButton:SetHide(m_isSimpleMenu or bIsAutomation or bIsMultiplayer or bWorldBuilder);
	Controls.OptionsButton:SetHide(bIsAutomation or not CanLocalPlayerChangeOptions());	

	if (bIsObserver)then
		Controls.QuickSaveButton:SetToolTipString(Locale.Lookup("LOC_SAVE_OBSERVER_MODE_TT"));
		Controls.SaveGameButton:SetToolTipString(Locale.Lookup("LOC_SAVE_OBSERVER_MODE_TT"));
	end

	-- Eventually remove this check.  Retiring after winning is perfectly fine
	-- so long as we update the tooltip to no longer state the player will be defeated.
	local bAlreadyWonOrLost = false;
	local me = Game.GetLocalPlayer();
	if (me) then
		local localPlayer = Players[me];
		if (localPlayer) then
			local winningTeam : number = Game.GetWinningTeam();
			local localPlayerTeam : number = localPlayer:GetTeam();
			if (winningTeam == localPlayerTeam or (winningTeam ~= nil and winningTeam ~= localPlayerTeam)) then
				bAlreadyWonOrLost = true;
			end
		end
	end

	if (GameConfiguration.IsPlayByCloud()) then
		if (Network.IsGameHost()) then
			Controls.PBCDeleteButton:SetHide(false);
		else
			Controls.PBCDeleteButton:SetHide(true);
		end
		Controls.PBCQuitButton:SetHide(false);
	else
		Controls.PBCDeleteButton:SetHide(true);
		Controls.PBCQuitButton:SetHide(true);
	end

	Controls.RetireButton:SetHide(m_isSimpleMenu or bIsAutomation or bIsMultiplayer or bAlreadyWonOrLost or bWorldBuilder);
	Controls.RestartButton:SetHide( not bCanRestart );
	Controls.ExitGameButton:SetHide(false);	

	if (m_isSimpleMenu==false) then
		RefreshModsInUse();
	end
	RefreshIconData();
	Controls.MainStack:CalculateSize();
end

function RefreshIconData()
	-- Check for an invalid local player first!
	local eLocalPlayer :number = Game.GetLocalPlayer();
	if (eLocalPlayer < 0) then
		return;
	end

	m_pPlayer= Players[eLocalPlayer];
	m_primaryColor, m_secondaryColor  = UI.GetPlayerColors( m_pPlayer:GetID() );
	local darkerBackColor = UI.DarkenLightenColor(m_primaryColor,(-85),100);
	local brighterBackColor = UI.DarkenLightenColor(m_primaryColor,90,255);

	-- Icon colors
	Controls.CivBacking_Base:SetColor(m_primaryColor);
	Controls.CivBacking_Lighter:SetColor(brighterBackColor);
	Controls.CivBacking_Darker:SetColor(darkerBackColor);
	Controls.CivIcon:SetColor(m_secondaryColor);

	local pPlayerConfig:table = PlayerConfigurations[m_pPlayer:GetID()];

	local leaderTypeName:string = pPlayerConfig:GetLeaderTypeName();
	if leaderTypeName ~= nil then
		local leaderIconName = ICON_PREFIX..leaderTypeName;
		-- Set Leader Icon
		Controls.LeaderIcon:SetIcon(leaderIconName);
		local leaderTooltip = GameInfo.Leaders[leaderTypeName].Name;
		Controls.LeaderIcon:SetToolTipString(Locale.Lookup(leaderTooltip));
	else
		UI.DataError("Invalid type name returned by GetLeaderTypeName");
	end

	local civTypeName:string = pPlayerConfig:GetCivilizationTypeName();
	if civTypeName ~= nil then
		local civIconName = ICON_PREFIX..civTypeName;
		-- Set Civ Icon
		Controls.CivIcon:SetIcon(civIconName);
		civTooltip = GameInfo.Civilizations[civTypeName].Name;
		Controls.CivIcon:SetToolTipString(Locale.Lookup(civTooltip));
	else
		UI.DataError("Invalid type name returned by GetCivilizationTypeName");
	end

	-- Game difficulty
	local playerConfig:table = PlayerConfigurations[eLocalPlayer];
	local gameDifficultyTypeID = playerConfig:GetHandicapTypeID();
	local gameDifficultyType = GameInfo.Difficulties[gameDifficultyTypeID].DifficultyType;
	Controls.GameDifficulty:SetIcon(ICON_PREFIX..gameDifficultyType);
	local difficultyTooltip = Locale.Lookup("LOC_MULTIPLAYER_DIFFICULTY_HEADER")..":[NEWLINE]"..Locale.Lookup(GameInfo.Difficulties[gameDifficultyTypeID].Name);
	Controls.GameDifficulty:SetToolTipString(difficultyTooltip);

	local gameSpeedType = GameInfo.GameSpeeds[GameConfiguration.GetGameSpeedType()].GameSpeedType;
	Controls.GameSpeed:SetIcon(ICON_PREFIX..gameSpeedType);
	local speedTooltip = Locale.Lookup("LOC_AD_SETUP_GAME_SPEED")..":[NEWLINE]"..Locale.Lookup(GameInfo.GameSpeeds[GameConfiguration.GetGameSpeedType()].Name);
	Controls.GameSpeed:SetToolTipString(speedTooltip);
end

-- ===========================================================================
function OnYes()
   	UIManager:SetUICursor( 1 );
	UITutorialManager:EnableOverlay( false );	
	UITutorialManager:HideAll();

	-- make sure any reference map is cleared
	StrategicView_ClearReferenceMap();

	UIManager:Log("Shutting down via user exit on menu.");
	if (ms_ExitToMain) then
		Events.ExitToMainMenu();
	else
		UI.ExitGame();
	end
end

function OnNo() m_kPopupDialog:Close(); end

-- ===========================================================================
function KeyHandler( key:number )
	local bHandled:boolean = false;
	if key == Keys.VK_ESCAPE then		
		if m_kPopupDialog:IsOpen() then
			m_kPopupDialog:Close();
		else
			if (not ContextPtr:IsHidden() ) then
				Close();
			end
		end
		bHandled = true;
	end
	return bHandled;
end

-- ===========================================================================
--	If this is receiving input (e.g., is visible) then do not let any input
--	fall past it.  Forge will send input to popups and children first before
--	this context gets a crack at it.
-- ===========================================================================
function OnInput( pInputStruct:table )
	local uiMsg:number = pInputStruct:GetMessageType();
	local key:number = pInputStruct:GetKey();

	if uiMsg == KeyEvents.KeyUp then 
		return KeyHandler( pInputStruct:GetKey() ); 
	elseif uiMsg == KeyEvents.KeyDown and not (key == Keys.VK_ALT or key == Keys.VK_CONTROL or key == Keys.VK_SHIFT) then 
		-- Don't consume Alt, Control, or Shift so those can be used for keybindings
		return true;
	end
	return false;
end

-- ===========================================================================
function RefreshModsInUse()
	local mods : table = Modding.GetActiveMods();
	g_ModListingsManager:ResetInstances();

	local modNames : table = {};
	for i,v in ipairs(mods) do
		modNames[i] = Locale.Lookup(v.Name);
	end

	table.sort(modNames, function(a,b) return Locale.Compare(a,b) == -1 end);	

	if (GameConfiguration.GetEnabledGameModesMetaString ~= nil) then
		local enabledModesMetaData : string = GameConfiguration.GetEnabledGameModesMetaString();
		if (enabledModesMetaData ~= nil) then
			-- Use the modding system to break up the string
			local enabledGameModeNames : table = Modding.GetGameModesFromConfigurationString(enabledModesMetaData);
			table.sort(enabledGameModeNames, function(a,b) return Locale.Compare(a.Name,b.Name) == -1 end);
			for k,v in ipairs(enabledGameModeNames)do
				local instance : table = g_ModListingsManager:GetInstance();
		
				instance.ModTitle:SetText(v.Name);
			end
			local spacerInstance : table = g_ModListingsManager:GetInstance();
			spacerInstance.ModTitle:SetText(" ");
		end
	end
	
	for i,v in ipairs(modNames) do
		local instance : table = g_ModListingsManager:GetInstance();
		instance.ModTitle:SetText(v);	
	end
	
	Controls.ModListingsStack:CalculateSize();
	Controls.ModListings:CalculateSize();
	Controls.ModsInUse:SetHide( (#mods == 0) or m_isSimpleMenu );
	Controls.MainStack:CalculateSize();
end

-- ===========================================================================
function OnOpenInGameOptionsMenu()
	-- Don't show pause menu if the player has retired (forfeit) from the game - fixes TTP 20129
	if not m_isRetired then 
		UIManager:QueuePopup( ContextPtr, PopupPriority.InGameTopOptionsMenu, { AlwaysVisibleInQueue = true } );
	end
end

-- ===========================================================================
--	Raised (typically) from InGame since when this is hidden it will not
--	receive input from ForgeUI.
-- ===========================================================================
function OnShow()
	if m_isClosing then
		print("Show was requested on menu that is in the midst of closing.");
		return;
	end

	-- Stop any particle effects from drawing on top of the menu.
	EffectsManager:PauseAllEffects();	

	-- do not re-push the context if we're already in the GameOptions context
	-- (e.g. returning from a sub-screen)
	if Input.GetActiveContext() ~= InputContext.GameOptions then
		Input.PushActiveContext( InputContext.GameOptions );
	end

    LuaEvents.InGameTopOptionsMenu_Show();
	UI.PlaySound("UI_Pause_Menu_On");
	UI.SetSoundStateValue("Game_Views", "Paused");
	
	Controls.AlphaIn:SetToBeginning();
	Controls.AlphaIn:Play();
	Controls.SlideIn:SetToBeginning();
	Controls.SlideIn:Play();

	-- Reset interface mode... may want to re-evaluate this if there are
	-- common situation(s) where a player is in a difference interface mode
	-- and are bringing up this menu.	
	if WorldBuilder:IsActive() then
		UI.SetInterfaceMode( InterfaceModeTypes.WB_SELECT_PLOT );
	else
		UI.SetInterfaceMode( InterfaceModeTypes.SELECTION );
	end

	SetupButtons();
	-- Do not deselect all as on-rails scenarios (e.g., tutorials) may get out of sync.	
	Controls.PauseWindow:SetHide(false);

	if WorldBuilder and WorldBuilder:IsActive() then
		Controls.DetailsBox:SetHide(true);
	else
		Controls.DetailsBox:SetHide(false);
	end
end

-- ===========================================================================
function OnLoadGameViewStateDone()
	m_isLoadingDone = true;
end

-- ===========================================================================
function OnCloudGameQuit( matchID, success )
	if (success) then
		-- On success, indicate success and exit to main menu.
		m_kPopupDialog:Close();
		m_kPopupDialog:AddText( Locale.Lookup("LOC_GAME_MENU_QUITING_GAME_SUCCESS"));
		m_kPopupDialog:Open();

		ms_ExitToMain = true;
		OnYes();
	else
		--Show error prompt.
		m_kPopupDialog:Close();
		m_kPopupDialog:AddText( Locale.Lookup("LOC_GAME_MENU_QUITING_GAME_FAIL"));
		m_kPopupDialog:AddButton( Locale.Lookup("LOC_GAME_MENU_QUITING_GAME_FAIL_ACCEPT") );
		m_kPopupDialog:Open();
	end
end

-- ===========================================================================
function OnCloudGameKilled( matchID, success )
	if (success) then
		-- On success, indicate success and exit to main menu.
		m_kPopupDialog:Close();
		m_kPopupDialog:AddText( Locale.Lookup("LOC_GAME_MENU_DELETE_GAME_SUCCESS"));
		m_kPopupDialog:Open();

		ms_ExitToMain = true;
		OnYes();
	else
		--Show error prompt.
		m_kPopupDialog:Close();
		m_kPopupDialog:AddText( Locale.Lookup("LOC_GAME_MENU_DELETE_GAME_FAIL"));
		m_kPopupDialog:AddButton( Locale.Lookup("LOC_GAME_MENU_DELETE_GAME_FAIL_ACCEPT") );
		m_kPopupDialog:Open();
	end
end

-- ===========================================================================
-- Generic handler for event that should trigger a refresh of the Setup Buttons.
function EventRefreshButtons()
	if (not ContextPtr:IsHidden()) then
		SetupButtons();
	end
end

-- ===========================================================================
function OnRequestClose()
	-- End Game Screen handles this
	if m_isEndGameOpen then return end
	if m_isLoadingDone and (Benchmark.IsEnabled()==false) then
		-- Only handle the message if popup queuing is active (diplomacy is not up)
		if UIManager:IsPopupQueueDisabled()==false then
			if (ContextPtr:IsHidden() ) then
				UIManager:QueuePopup( ContextPtr, PopupPriority.Utmost, { AlwaysVisibleInQueue = true } );
			end
			OnExitGameAskAreYouSure();
		end
	else
		Events.UserConfirmedClose();
	end
end

-- ===========================================================================
--	Dervive off this in a MOD file for adding additional functionality
-- ===========================================================================
function LateInitialize() end

-- ===========================================================================
function OnInit( isReload:boolean )
	LateInitialize();
	if isReload then
		if not ContextPtr:IsHidden() then
			OnShow();
		end
	end
end

-- ===========================================================================
function Initialize()
	ContextPtr:SetInitHandler( OnInit );
	ContextPtr:SetInputHandler( OnInput, true );
	ContextPtr:SetShowHandler( OnShow );
	
	Controls.ExitGameButton:RegisterCallback( Mouse.eLClick, OnExitGameAskAreYouSure );
	Controls.ExitGameButton:RegisterCallback( Mouse.eMouseEnter, function() UI.PlaySound("Main_Menu_Mouse_Over"); end);
	Controls.LoadGameButton:RegisterCallback( Mouse.eLClick, OnLoadGame );
	Controls.LoadGameButton:RegisterCallback( Mouse.eMouseEnter, function() UI.PlaySound("Main_Menu_Mouse_Over"); end);
	Controls.MainMenuButton:RegisterCallback( Mouse.eLClick, OnMainMenu );
	Controls.MainMenuButton:RegisterCallback( Mouse.eMouseEnter, function() UI.PlaySound("Main_Menu_Mouse_Over"); end);
	Controls.OptionsButton:RegisterCallback( Mouse.eLClick, OnOptions );
	Controls.OptionsButton:RegisterCallback( Mouse.eMouseEnter, function() UI.PlaySound("Main_Menu_Mouse_Over"); end);
	Controls.QuickSaveButton:RegisterCallback( Mouse.eLClick, OnQuickSaveGame );
	Controls.QuickSaveButton:RegisterCallback( Mouse.eMouseEnter, function() UI.PlaySound("Main_Menu_Mouse_Over"); end);
	Controls.RetireButton:RegisterCallback( Mouse.eLClick, OnRetireGame );
	Controls.RetireButton:RegisterCallback( Mouse.eMouseEnter, function() UI.PlaySound("Main_Menu_Mouse_Over"); end);
	Controls.RestartButton:RegisterCallback( Mouse.eLClick, OnRestartGame );
	Controls.RestartButton:RegisterCallback( Mouse.eMouseEnter, function() UI.PlaySound("Main_Menu_Mouse_Over"); end);
	Controls.PBCDeleteButton:RegisterCallback( Mouse.eLClick, OnPBCDeleteButton );
	Controls.PBCDeleteButton:RegisterCallback( Mouse.eMouseEnter, function() UI.PlaySound("Main_Menu_Mouse_Over"); end);
	Controls.PBCQuitButton:RegisterCallback( Mouse.eLClick, OnPBCQuitButton );
	Controls.PBCQuitButton:RegisterCallback( Mouse.eMouseEnter, function() UI.PlaySound("Main_Menu_Mouse_Over"); end);
	Controls.ReturnButton:RegisterCallback( Mouse.eLClick, OnReturn );
	Controls.ReturnButton:RegisterCallback( Mouse.eMouseEnter, function() UI.PlaySound("Main_Menu_Mouse_Over"); end);
	Controls.SaveGameButton:RegisterCallback( Mouse.eLClick, OnSaveGame );
	Controls.SaveGameButton:RegisterCallback( Mouse.eMouseEnter, function() UI.PlaySound("Main_Menu_Mouse_Over"); end);
	Controls.PauseWindowClose:RegisterEndCallback( ShutdownAfterClose );

	LuaEvents.InGame_OpenInGameOptionsMenu.Add( OnOpenInGameOptionsMenu );
	LuaEvents.PlayerChange_OpenInGameOptionsMenu.Add( OnOpenInGameOptionsMenu );
	LuaEvents.PausePanel_OpenInGameOptionsMenu.Add( OnOpenInGameOptionsMenu );

	LuaEvents.TutorialUIRoot_SimpleInGameMenu.Add( OnSimpleInGameMenu );
	LuaEvents.DiplomacyActionView_HideIngameUI.Add( CloseImmediately );

	LuaEvents.EndGameMenu_Shown.Add( function() m_isEndGameOpen = true; end );
	LuaEvents.EndGameMenu_OneMoreTurn.Add( function() m_isEndGameOpen = false; end );
	LuaEvents.EndGameMenu_Closed.Add( function() m_isEndGameOpen = false; end);	

	Events.PlayerTurnActivated.Add( EventRefreshButtons );
	Events.PlayerTurnDeactivated.Add( EventRefreshButtons );
	Events.MultiplayerMatchHostMigrated.Add( EventRefreshButtons );
	Events.UserRequestClose.Add( OnRequestClose );
	Events.LoadGameViewStateDone.Add( OnLoadGameViewStateDone );
	Events.CloudGameKilled.Add(OnCloudGameKilled);
	Events.CloudGameQuit.Add(OnCloudGameQuit);

	local gameSeed : string = "";
	local mapSeed : string = "";

	-- Convert to string so formatting isn't performed by locale when added to tooltip:
	if (GameConfiguration.GetValue("GAME_SYNC_RANDOM_SEED") ~= nil)then
		gameSeed = tostring( GameConfiguration.GetValue("GAME_SYNC_RANDOM_SEED") );
	end
	if (MapConfiguration.GetValue("RANDOM_SEED") ~= nil)then
		mapSeed	= tostring( MapConfiguration.GetValue("RANDOM_SEED") );	
	end

	local version		:string = UI.GetAppVersion();
	local tooltipInfo	:string= --Locale.Lookup("LOC_PAUSEMENU_INFO_OVERVIEW_TOOLTIP");
		Locale.Lookup("LOC_PAUSEMENU_INFO_OVERVIEW_TOOLTIP") .. "[NEWLINE]" ..
		Locale.Lookup("LOC_PAUSEMENU_INFO_VERSION_TOOLTIP", version) .. "[NEWLINE]" ..		
		Locale.Lookup("LOC_PAUSEMENU_INFO_MAP_SEED", mapSeed) .. "[NEWLINE]" ..
		Locale.Lookup("LOC_PAUSEMENU_INFO_GAME_SEED", gameSeed);

	Controls.VersionLabel:SetText( version );
	Controls.VersionLabel:SetToolTipString( tooltipInfo );
	
	-- Custom popup setup	
	m_kPopupDialog = PopupDialog:new( "InGameTopOptionsMenu" );

	if UI.HasFeature("Demo") then
		m_isSimpleMenu = true;
	end
end
Initialize();