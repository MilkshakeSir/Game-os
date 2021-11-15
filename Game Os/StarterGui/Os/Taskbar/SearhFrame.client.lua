local Bar = script.Parent.Apps
local Items = script.Parent.Parent.SearchFrame
local TweenService = game:GetService("TweenService")

local TweenData = TweenInfo.new(
	.5,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.In
)

local Open = TweenService:Create(Items, TweenData, {BackgroundTransparency = 0})
local Close = TweenService:Create(Items, TweenData, {BackgroundTransparency = 1})

local On = false

script.Parent.Apps.MouseButton1Click:Connect(function()
	if On == false then
		Items.Visible = true
		On =  true
	else
		On = false
		Items.Visible = false
	end
end)
