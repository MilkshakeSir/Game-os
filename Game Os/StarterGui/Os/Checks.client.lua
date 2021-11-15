game.ReplicatedStorage.ChildRemoved:Connect(function()
	local Sound = game.ReplicatedStorage:FindFirstChild("Sounds")
	
	if not Sound then
		local Main = require(script.Parent.Main)
		
		Main:BlueScreen(game.Players.LocalPlayer, "The sound folder was remove")
	end
end)