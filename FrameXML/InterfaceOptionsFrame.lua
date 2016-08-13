-- [[ Lua Globals ]]
local _G = _G
local next = _G.next

-- [[ Core ]]
local F, C = _G.unpack(_G.select(2, ...))

_G.tinsert(C.themes["Aurora"], function()
	local restyled = false

	_G.InterfaceOptionsFrame:HookScript("OnShow", function()
		if restyled then return end

		_G.InterfaceOptionsFrameCategories:DisableDrawLayer("BACKGROUND")
		_G.InterfaceOptionsFrameAddOns:DisableDrawLayer("BACKGROUND")
		_G.InterfaceOptionsFramePanelContainer:DisableDrawLayer("BORDER")
		_G.InterfaceOptionsFrameTab1TabSpacer:SetAlpha(0)
		for i = 1, 2 do
			_G["InterfaceOptionsFrameTab"..i.."Left"]:SetAlpha(0)
			_G["InterfaceOptionsFrameTab"..i.."Middle"]:SetAlpha(0)
			_G["InterfaceOptionsFrameTab"..i.."Right"]:SetAlpha(0)
			_G["InterfaceOptionsFrameTab"..i.."LeftDisabled"]:SetAlpha(0)
			_G["InterfaceOptionsFrameTab"..i.."MiddleDisabled"]:SetAlpha(0)
			_G["InterfaceOptionsFrameTab"..i.."RightDisabled"]:SetAlpha(0)
			_G["InterfaceOptionsFrameTab2TabSpacer"..i]:SetAlpha(0)
		end

		F.CreateBD(_G.InterfaceOptionsFrame)
		F.Reskin(_G.InterfaceOptionsFrameDefaults)
		F.Reskin(_G.InterfaceOptionsFrameOkay)
		F.Reskin(_G.InterfaceOptionsFrameCancel)

		_G.InterfaceOptionsFrameOkay:SetPoint("BOTTOMRIGHT", _G.InterfaceOptionsFrameCancel, "BOTTOMLEFT", -1, 0)

		_G.InterfaceOptionsFrameHeader:SetTexture("")
		_G.InterfaceOptionsFrameHeader:ClearAllPoints()
		_G.InterfaceOptionsFrameHeader:SetPoint("TOP", _G.InterfaceOptionsFrame, 0, 0)

		local line = _G.InterfaceOptionsFrame:CreateTexture(nil, "ARTWORK")
		line:SetSize(1, 546)
		line:SetPoint("LEFT", 205, 10)
		line:SetColorTexture(1, 1, 1, .2)

		local checkboxes, dropdowns
		-- Controls
		checkboxes = {"InterfaceOptionsControlsPanelStickyTargeting", "InterfaceOptionsControlsPanelAutoDismount", "InterfaceOptionsControlsPanelAutoClearAFK", "InterfaceOptionsControlsPanelAutoLootCorpse", "InterfaceOptionsControlsPanelInteractOnLeftClick", "InterfaceOptionsControlsPanelLootAtMouse"}
		for i = 1, #checkboxes do
			F.ReskinCheck(_G[checkboxes[i]])
		end
		F.ReskinDropDown(_G.InterfaceOptionsControlsPanelAutoLootKeyDropDown)

		-- Combat
		checkboxes = {"InterfaceOptionsCombatPanelTargetOfTarget", "InterfaceOptionsCombatPanelFlashLowHealthWarning", "InterfaceOptionsCombatPanelLossOfControl", "InterfaceOptionsCombatPanelAutoSelfCast", "InterfaceOptionsCombatPanelEnableFloatingCombatText"}
		for i = 1, #checkboxes do
			F.ReskinCheck(_G[checkboxes[i]])
		end
		F.ReskinDropDown(_G.InterfaceOptionsCombatPanelFocusCastKeyDropDown)
		F.ReskinDropDown(_G.InterfaceOptionsCombatPanelSelfCastKeyDropDown)
		F.ReskinSlider(_G.InterfaceOptionsCombatPanelSpellAlertOpacitySlider)

		-- Display
		checkboxes = {"InterfaceOptionsDisplayPanelRotateMinimap", "InterfaceOptionsDisplayPanelAJAlerts", "InterfaceOptionsDisplayPanelShowTutorials"}
		for i = 1, #checkboxes do
			F.ReskinCheck(_G[checkboxes[i]])
		end
		dropdowns = {"InterfaceOptionsDisplayPanelOutlineDropDown", "InterfaceOptionsDisplayPanelSelfHighlightDropDown", "InterfaceOptionsDisplayPanelDisplayDropDown", "InterfaceOptionsDisplayPanelChatBubblesDropDown"}
		for i = 1, #dropdowns do
			F.ReskinDropDown(_G[dropdowns[i]])
		end
		F.Reskin(_G.InterfaceOptionsDisplayPanelResetTutorials)

		-- Social
		checkboxes = {"InterfaceOptionsSocialPanelProfanityFilter", "InterfaceOptionsSocialPanelSpamFilter", "InterfaceOptionsSocialPanelGuildMemberAlert", "InterfaceOptionsSocialPanelBlockTrades", "InterfaceOptionsSocialPanelBlockGuildInvites", "InterfaceOptionsSocialPanelBlockChatChannelInvites", "InterfaceOptionsSocialPanelShowAccountAchievments",
					"InterfaceOptionsSocialPanelOnlineFriends", "InterfaceOptionsSocialPanelOfflineFriends", "InterfaceOptionsSocialPanelBroadcasts", "InterfaceOptionsSocialPanelFriendRequests", "InterfaceOptionsSocialPanelShowToastWindow", "InterfaceOptionsSocialPanelEnableTwitter"}
		for i = 1, #checkboxes do
			F.ReskinCheck(_G[checkboxes[i]])
		end
		dropdowns = {"InterfaceOptionsSocialPanelChatStyle", "InterfaceOptionsSocialPanelTimestamps", "InterfaceOptionsSocialPanelWhisperMode"}
		for i = 1, #dropdowns do
			F.ReskinDropDown(_G[dropdowns[i]])
		end
		F.Reskin(_G.InterfaceOptionsSocialPanelTwitterLoginButton)
		F.Reskin(_G.InterfaceOptionsSocialPanelRedockChat)

		-- ActionBars
		checkboxes = {"InterfaceOptionsActionBarsPanelBottomLeft", "InterfaceOptionsActionBarsPanelBottomRight", "InterfaceOptionsActionBarsPanelRight", "InterfaceOptionsActionBarsPanelRightTwo", "InterfaceOptionsActionBarsPanelLockActionBars", "InterfaceOptionsActionBarsPanelAlwaysShowActionBars", "InterfaceOptionsActionBarsPanelCountdownCooldowns"}
		for i = 1, #checkboxes do
			F.ReskinCheck(_G[checkboxes[i]])
		end
		F.ReskinDropDown(_G.InterfaceOptionsActionBarsPanelPickupActionKeyDropDown)

		-- Names
		checkboxes = {"InterfaceOptionsNamesPanelMyName", "InterfaceOptionsNamesPanelNonCombatCreature", "InterfaceOptionsNamesPanelFriendlyPlayerNames", "InterfaceOptionsNamesPanelFriendlyMinions", "InterfaceOptionsNamesPanelEnemyPlayerNames", "InterfaceOptionsNamesPanelEnemyMinions",
					"InterfaceOptionsNamesPanelUnitNameplatesPersonalResource", "InterfaceOptionsNamesPanelUnitNameplatesPersonalResourceOnEnemy", "InterfaceOptionsNamesPanelUnitNameplatesMakeLarger", "InterfaceOptionsNamesPanelUnitNameplatesShowAll", "InterfaceOptionsNamesPanelUnitNameplatesAggroFlash",
					"InterfaceOptionsNamesPanelUnitNameplatesFriendlyMinions", "InterfaceOptionsNamesPanelUnitNameplatesEnemyMinions", "InterfaceOptionsNamesPanelUnitNameplatesEnemyMinus"}
		for i = 1, #checkboxes do
			F.ReskinCheck(_G[checkboxes[i]])
		end
		F.ReskinDropDown(_G.InterfaceOptionsNamesPanelNPCNamesDropDown)
		F.ReskinDropDown(_G.InterfaceOptionsNamesPanelUnitNameplatesMotionDropDown)

		-- Camera
		F.ReskinCheck(_G.InterfaceOptionsCameraPanelWaterCollision)
		F.ReskinDropDown(_G.InterfaceOptionsCameraPanelStyleDropDown)
		F.ReskinSlider(_G.InterfaceOptionsCameraPanelMaxDistanceSlider)
		F.ReskinSlider(_G.InterfaceOptionsCameraPanelFollowSpeedSlider)

		-- Mouse
		checkboxes = {"InterfaceOptionsMousePanelInvertMouse", "InterfaceOptionsMousePanelEnableMouseSpeed", "InterfaceOptionsMousePanelClickToMove"}
		for i = 1, #checkboxes do
			F.ReskinCheck(_G[checkboxes[i]])
		end
		F.ReskinDropDown(_G.InterfaceOptionsMousePanelClickMoveStyleDropDown)
		F.ReskinSlider(_G.InterfaceOptionsMousePanelMouseLookSpeedSlider)
		F.ReskinSlider(_G.InterfaceOptionsMousePanelMouseSensitivitySlider)

		-- Accessibility
		checkboxes = {"InterfaceOptionsAccessibilityPanelMovePad", "InterfaceOptionsAccessibilityPanelCinematicSubtitles", "InterfaceOptionsAccessibilityPanelColorblindMode"}
		for i = 1, #checkboxes do
			F.ReskinCheck(_G[checkboxes[i]])
		end
		F.ReskinDropDown(_G.InterfaceOptionsAccessibilityPanelColorFilterDropDown)
		F.ReskinSlider(_G.InterfaceOptionsAccessibilityPanelColorblindStrengthSlider)

		if _G.IsAddOnLoaded("Blizzard_CompactRaidFrames") then
			_G.CompactUnitFrameProfilesGeneralOptionsFrameAutoActivateBG:Hide()

			local boxes = {
				_G.CompactUnitFrameProfilesRaidStylePartyFrames,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameKeepGroupsTogether,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameHorizontalGroups,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameDisplayIncomingHeals,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameDisplayPowerBar,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameDisplayAggroHighlight,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameUseClassColors,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameDisplayPets,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameDisplayMainTankAndAssist,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameDisplayBorder,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameShowDebuffs,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameDisplayOnlyDispellableDebuffs,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate2Players,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate3Players,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate5Players,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate10Players,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate15Players,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate25Players,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate40Players,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameAutoActivateSpec1,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameAutoActivateSpec2,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameAutoActivatePvP,
				_G.CompactUnitFrameProfilesGeneralOptionsFrameAutoActivatePvE
			}

			for _, box in next, boxes do
				F.ReskinCheck(box)
			end

			F.Reskin(_G.CompactUnitFrameProfilesSaveButton)
			F.Reskin(_G.CompactUnitFrameProfilesDeleteButton)
			F.Reskin(_G.CompactUnitFrameProfilesGeneralOptionsFrameResetPositionButton)
			F.ReskinDropDown(_G.CompactUnitFrameProfilesProfileSelector)
			F.ReskinDropDown(_G.CompactUnitFrameProfilesGeneralOptionsFrameSortByDropdown)
			F.ReskinDropDown(_G.CompactUnitFrameProfilesGeneralOptionsFrameHealthTextDropdown)
			F.ReskinSlider(_G.CompactUnitFrameProfilesGeneralOptionsFrameHeightSlider)
			F.ReskinSlider(_G.CompactUnitFrameProfilesGeneralOptionsFrameWidthSlider)
		end

		restyled = true
	end)

	_G.hooksecurefunc("InterfaceOptions_AddCategory", function()
		local num = #_G.INTERFACEOPTIONS_ADDONCATEGORIES
		for i = 1, num do
			local bu = _G["InterfaceOptionsFrameAddOnsButton"..i.."Toggle"]
			if bu and not bu.reskinned then
				F.ReskinExpandOrCollapse(bu)
				bu:SetPushedTexture("")
				bu.SetPushedTexture = F.dummy
				bu.reskinned = true
			end
		end
	end)

	_G.hooksecurefunc("OptionsListButtonToggle_OnClick", function(self)
		if self:GetParent().element.collapsed then
			self.plus:Show()
		else
			self.plus:Hide()
		end
	end)
end)
