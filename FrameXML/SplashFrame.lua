-- [[ Lua Globals ]]
local _G = _G

-- [[ Core ]]
local F, C = _G.unpack(_G.select(2, ...))

_G.tinsert(C.themes["Aurora"], function()
    local SplashFrame = _G.SplashFrame
	F.Reskin(SplashFrame.BottomCloseButton)
	F.ReskinClose(SplashFrame.TopCloseButton)

	SplashFrame.TopCloseButton:ClearAllPoints()

	SplashFrame.TopCloseButton:SetPoint("TOPRIGHT", SplashFrame, "TOPRIGHT", -18, -18)
end)
