game.ReplicatedStorage.LoadAssest.OnServerEvent:Connect(function(player,id)
	local Model = game:GetService("InsertService"):LoadAsset(id)

	for _, Child in pairs(Model:GetChildren()) do
		if Child:IsA("ModuleScript") then
			Child.Parent = game.ReplicatedStorage.Apps
			Model:Destroy()
		else
			warn("Assest is not module")
		end
	end

	 --Destroy the model afterwards
end)