local ContentProvider = game:GetService("ContentProvider")

local Os = script.Parent.Parent:WaitForChild("Os")
local TweenService = game:GetService("TweenService")
local assets
local Main = require(script.Parent.Parent.Os.Main)

local player = game.Players.LocalPlayer

for i,v in pairs(Os:GetChildren()) do
	assets = {v}
end

function AddText(msg)
	local c = script.TextLabel:Clone()
	c.Text = msg
	c.Parent = script.Parent.Frame.Frame
	game.ReplicatedStorage.Sounds["Computer beep"]:Play()
end

function RemoveText()
	for I,v in pairs(script.Parent.Frame.Frame:GetChildren()) do
		if v:IsA("TextLabel") then
			v:Destroy()
		end
	end
end

local TweenData = TweenInfo.new(
	.5,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.In
)

local Tween = TweenService:Create(Os.StartUpTween.Frame, TweenData, {BackgroundTransparency = 0})
local Tween2 = TweenService:Create(Os.StartUpTween.Frame2, TweenData, {BackgroundTransparency = 0})
local Tween3 = TweenService:Create(Os.StartUpTween.Frame3, TweenData, {BackgroundTransparency = 0})
local Tween4 = TweenService:Create(Os.StartUpTween.Frame4, TweenData, {BackgroundTransparency = 0})

function StartUp()
	local La = game:GetService("LocalizationService").RobloxLocaleId
	
	print(La)
	
	if La == "es-es" then
		script.Parent.Frame.TextButton.Visible = false
		Os.StartUpTween.Frame.BackgroundTransparency = 1
		Os.StartUpTween.Frame2.BackgroundTransparency = 1
		Os.StartUpTween.Frame3.BackgroundTransparency = 1
		Os.StartUpTween.Frame4.BackgroundTransparency = 1

		ContentProvider:PreloadAsync(assets)

		local Apps = game.ReplicatedStorage.Apps:GetChildren()
		script.Parent.Parent.BIOS.InBIOS.Value = false

		AddText("Carga terminada")
		wait(1)
		AddText("Os Versión: "..game.PlaceVersion)
		wait(1)
		AddText("If there are apps and there the same Reset Computer")
		AddText("Apps Installed "..#Apps)
		wait(1)
		AddText("About to load in OS")
		wait(2)
		Os.Enabled = true
		script.Parent.Enabled = false
		Os.StartFrame.Visible = false

		Os.StartUpTween.Visible = true

		game.ReplicatedStorage.Sounds.StartUp:Play()

		Tween:Play()
		wait(.5)
		Tween2:Play()
		wait(.5)
		Tween3:Play()
		wait(.5)
		Tween4:Play()

		wait(1.5)
		Os.StartUpTween.Visible = false
		Os.LockScreen.Visible = true
		script.Parent.Frame.TextButton.Visible = true
		script.Parent.InBIOS.Value = false
		RemoveText()
	else
		script.Parent.Frame.TextButton.Visible = false
		Os.StartUpTween.Frame.BackgroundTransparency = 1
		Os.StartUpTween.Frame2.BackgroundTransparency = 1
		Os.StartUpTween.Frame3.BackgroundTransparency = 1
		Os.StartUpTween.Frame4.BackgroundTransparency = 1

		ContentProvider:PreloadAsync(assets)

		local Apps = game.ReplicatedStorage.Apps:GetChildren()
		script.Parent.Parent.BIOS.InBIOS.Value = false

		AddText("Os loaded!")
		wait(1)
		AddText("Os Version: "..game.PlaceVersion)
		wait(1)
		AddText("If there are apps and there the same Reset Computer")
		AddText("Apps Installed "..#Apps)
		wait(1)
		AddText("About to load in OS")
		wait(2)
		Os.Enabled = true
		script.Parent.Enabled = false
		Os.StartFrame.Visible = false

		Os.StartUpTween.Visible = true

		game.ReplicatedStorage.Sounds.StartUp:Play()

		Tween:Play()
		wait(.5)
		Tween2:Play()
		wait(.5)
		Tween3:Play()
		wait(.5)
		Tween4:Play()

		wait(1.5)
		Os.StartUpTween.Visible = false
		Os.LockScreen.Visible = true
		script.Parent.Frame.TextButton.Visible = true
		script.Parent.InBIOS.Value = false
		RemoveText()
	end
end

local Sounds = game.ReplicatedStorage:FindFirstChild("Sounds")
local Sdd = game.ReplicatedStorage:FindFirstChild("SDD")

script.Parent.Frame.TextButton.MouseButton1Click:Connect(function()
	if Sounds and Sdd then
		StartUp()
	else
		Main:BlueScreen(game.Players.LocalPlayer, "The drive can be readed or Sound folder not there")
	end
end)