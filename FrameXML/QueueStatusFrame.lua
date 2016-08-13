-- [[ Lua Globals ]]
local _G = _G
local tinsert, pairs = _G.tinsert, _G.pairs

-- [[ WoW API ]]
local hooksecurefunc = _G.hooksecurefunc

-- [[ Core ]]
local F, C = _G.unpack(_G.select(2, ...))

_G.tinsert(C.themes["Aurora"], function()
	for i = 1, 9 do
		_G.select(i, _G.QueueStatusFrame:GetRegions()):Hide()
	end

	F.CreateBD(_G.QueueStatusFrame)

	hooksecurefunc("QueueStatusFrame_GetEntry", function(self, entryIndex)
		local entry = self.StatusEntries[entryIndex]

		if not entry.styled then
			for _, roleButton in pairs({entry.HealersFound, entry.TanksFound, entry.DamagersFound}) do
				roleButton.Texture:SetTexture(C.media.roleIcons)
				roleButton.Cover:SetTexture(C.media.roleIcons)

				local left = roleButton:CreateTexture(nil, "OVERLAY")
				left:SetWidth(1)
				left:SetTexture(C.media.backdrop)
				left:SetVertexColor(0, 0, 0)
				left:SetPoint("TOPLEFT", 5, -3)
				left:SetPoint("BOTTOMLEFT", 5, 6)

				local right = roleButton:CreateTexture(nil, "OVERLAY")
				right:SetWidth(1)
				right:SetTexture(C.media.backdrop)
				right:SetVertexColor(0, 0, 0)
				right:SetPoint("TOPRIGHT", -4, -3)
				right:SetPoint("BOTTOMRIGHT", -4, 6)

				local top = roleButton:CreateTexture(nil, "OVERLAY")
				top:SetHeight(1)
				top:SetTexture(C.media.backdrop)
				top:SetVertexColor(0, 0, 0)
				top:SetPoint("TOPLEFT", 5, -3)
				top:SetPoint("TOPRIGHT", -4, -3)

				local bottom = roleButton:CreateTexture(nil, "OVERLAY")
				bottom:SetHeight(1)
				bottom:SetTexture(C.media.backdrop)
				bottom:SetVertexColor(0, 0, 0)
				bottom:SetPoint("BOTTOMLEFT", 5, 6)
				bottom:SetPoint("BOTTOMRIGHT", -4, 6)
			end

			for i = 1, _G.LFD_NUM_ROLES do
				local roleIcon = entry["RoleIcon"..i]

				roleIcon:SetTexture(C.media.roleIcons)

				entry["RoleIconBorders"..i] = {}
				local borders = entry["RoleIconBorders"..i]

				local left = entry:CreateTexture(nil, "OVERLAY")
				left:SetWidth(1)
				left:SetTexture(C.media.backdrop)
				left:SetVertexColor(0, 0, 0)
				left:SetPoint("TOPLEFT", roleIcon, 2, -2)
				left:SetPoint("BOTTOMLEFT", roleIcon, 2, 3)
				tinsert(borders, left)

				local right = entry:CreateTexture(nil, "OVERLAY")
				right:SetWidth(1)
				right:SetTexture(C.media.backdrop)
				right:SetVertexColor(0, 0, 0)
				right:SetPoint("TOPRIGHT", roleIcon, -2, -2)
				right:SetPoint("BOTTOMRIGHT", roleIcon, -2, 3)
				tinsert(borders, right)

				local top = entry:CreateTexture(nil, "OVERLAY")
				top:SetHeight(1)
				top:SetTexture(C.media.backdrop)
				top:SetVertexColor(0, 0, 0)
				top:SetPoint("TOPLEFT", roleIcon, 2, -2)
				top:SetPoint("TOPRIGHT", roleIcon, -2, -2)
				tinsert(borders, top)

				local bottom = entry:CreateTexture(nil, "OVERLAY")
				bottom:SetHeight(1)
				bottom:SetTexture(C.media.backdrop)
				bottom:SetVertexColor(0, 0, 0)
				bottom:SetPoint("BOTTOMLEFT", roleIcon, 2, 3)
				bottom:SetPoint("BOTTOMRIGHT", roleIcon, -2, 3)
				tinsert(borders, bottom)
			end

			entry.styled = true
		end
	end)

	hooksecurefunc("QueueStatusEntry_SetMinimalDisplay", function(entry)
		for i = 1, _G.LFD_NUM_ROLES do
			for _, border in pairs(entry["RoleIconBorders"..i]) do
				border:Hide()
			end
		end
	end)

	hooksecurefunc("QueueStatusEntry_SetFullDisplay", function(entry)
		for i = 1, _G.LFD_NUM_ROLES do
			local shown = entry["RoleIcon"..i]:IsShown()

			for _, border in pairs(entry["RoleIconBorders"..i]) do
				border:SetShown(shown)
			end
		end
	end)
end)
