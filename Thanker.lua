local summoner

local Button = CreateFrame("Button", "ThankButton", UIParent, "UIPanelButtonTemplate")
Button:SetMovable(true)
Button:EnableMouse(true)
Button:SetText("Thank")
Button:SetWidth(50)
Button:SetHeight(25)
Button:RegisterForDrag("LeftButton")
Button:SetScript("OnDragStart", Button.StartMoving)
Button:SetScript("OnDragStop", Button.StopMovingOrSizing)
Button:SetPoint("CENTER")
Button:Hide()

Button:RegisterForClicks("AnyUp")
Button:SetScript("OnClick", function()
	if summoner ~= nil then
		DoEmote("thank", UnitName(summoner))
	end
	Button:Hide()
end )

local frame = CreateFrame("FRAME", "ThankerEventHandler");
frame:RegisterEvent("CONFIRM_SUMMON");
local function eventHandler(self, event, ...)
	Button:Show()
	summoner = GetSummonConfirmSummoner()
	print(summoner);
end
frame:SetScript("OnEvent", eventHandler);

summoner = GetSummonConfirmSummoner()
