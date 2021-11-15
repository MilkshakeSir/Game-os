local ContentProvider = game:GetService("ContentProvider")

local assets = {game.ReplicatedStorage.Apps}

local Module = require(script.Parent.Main)

local succees, errormsg = pcall(function()
	for i,v in pairs(game.ReplicatedStorage.Apps:GetChildren()) do
		local App = require(game.ReplicatedStorage.Apps:FindFirstChild(v.Name))


		local Icon = script.ImageButton:Clone()
		
		local La = game:GetService("LocalizationService").RobloxLocaleId
		
		local Much = 0
		
		if App.Show == true then
			if La == "es-es" then
				Much = Much +1
				print(App.SpanishAppName)
				Icon.Name = App.AppName
				Icon.Image = App.Icon
				Icon.TextLabel.Text = tostring(App.SpanishAppName)
				Icon.GameId.Value = App.GameId
				Icon.Game.Value = App.ToGame
				Icon.Maker.Value = App.Maker
				Icon.Parent = script.Parent.Backgorund
			else
				Icon.Name = App.AppName
				Icon.Image = App.Icon
				Icon.TextLabel.Text = App.AppName
				Icon.GameId.Value = App.GameId
				Icon.Game.Value = App.ToGame
				Icon.Maker.Value = App.Maker
				Icon.Parent = script.Parent.Backgorund
			end
		else
			
		end
	end
end)

if not succees then
	Module:BlueScreen(game.Players.LocalPlayer, errormsg)
end

local succees2, errormsg2 = pcall(function()
	game.ReplicatedStorage.Apps.ChildAdded:Connect(function()
		for i2,v2 in pairs(script.Parent.Backgorund:GetChildren()) do
			if v2:IsA("ImageButton") then
				v2:Destroy()
			end
		end
		
		for i,v in pairs(game.ReplicatedStorage.Apps:GetChildren()) do
			local App = require(game.ReplicatedStorage.Apps:FindFirstChild(v.Name))


			local Icon = script.ImageButton:Clone()

			local La = game:GetService("LocalizationService").RobloxLocaleId

			local Much = 0

			if App.Show == true then
				if La == "es-es" then
					Much = Much +1
					Icon.Name = tostring(App.SpanishAppName)
					Icon.Image = App.Icon
					Icon.TextLabel.Text = tostring(App.SpanishAppName)
					Icon.GameId.Value = App.GameId
					Icon.Game.Value = App.ToGame
					Icon.Maker.Value = App.Maker
					Icon.Parent = script.Parent.Backgorund
				else
					Icon.Name = App.AppName
					Icon.Image = App.Icon
					Icon.TextLabel.Text = App.AppName
					Icon.GameId.Value = App.GameId
					Icon.Game.Value = App.ToGame
					Icon.Maker.Value = App.Maker
					Icon.Parent = script.Parent.Backgorund
				end
			else

			end
		end
	end)
end)

if not succees2 then
	Module:BlueScreen(game.Players.LocalPlayer, errormsg2)
end

