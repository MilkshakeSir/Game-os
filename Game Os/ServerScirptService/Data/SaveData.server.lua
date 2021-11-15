local ds = game:GetService("DataStoreService")

local datestore = ds:GetDataStore("Save1")
local RunService = game:GetService("RunService")


game.Players.PlayerAdded:Connect(function(player)
	local Stats = Instance.new("Folder")
	Stats.Name = "Settings"
	Stats.Parent = player
	
	local PingNumber = Instance.new("IntValue")
	PingNumber.Name = "PingNumber"
	PingNumber.Parent = player
	
	local Background = Instance.new("StringValue")
	Background.Name = "Background"
	Background.Parent = Stats
	
	local Password = Instance.new("StringValue")
	Password.Name = "Password"
	Password.Parent = Stats

	local data
	local password
	local success, errormsg = pcall(function()
		data = datestore:GetAsync(player.UserId.."-Background")
		password = datestore:GetAsync(player.UserId.."-Password")
	end)
	
	if RunService:IsStudio() then
		game.ReplicatedStorage.InStudio.Value = true
	end
	
	game.ReplicatedStorage.Remotes.Main.ChangeBack.OnServerEvent:Connect(function(player, id)
		if string.match(id, "rbxassetid://") then
			Background.Value = id
			print("Save item")
		else
			Background.Value = "rbxassetid://"..id
			print("Save Item")
		end
	end)
	
	if success then
		Background.Value = data
		--print("Server: "..data)
		game.ReplicatedStorage.Remotes.Main.Background:FireClient(player, data)
	else
		warn(errormsg)
		print("There was a error getting data")
	end
end)




game.Players.PlayerRemoving:Connect(function(player)
	local success, errormsg = pcall(function()
		print("Save Image: "..player.Settings.Background.Value)
		datestore:SetAsync(player.UserId.."-Background",player.Settings.Background.Value)
		datestore:SetAsync(player.UserId.."-Password",player.Settings.Password.Value)
	end)
	if success then
		print("Data was save")
	else
		print("There was a error when saving data")
		warn(errormsg)
	end
end)

game:BindToClose(function()
	if RunService:IsStudio() then -- (only needed inside Studio)
		wait(3) -- this will force the "SetAsync" above to complete 
	end
end)