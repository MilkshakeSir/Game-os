local ContentProvider = game:GetService("ContentProvider")

local assets

for i,v in pairs(game.ReplicatedStorage.Apps:GetChildren()) do
	assets = {v}
end

ContentProvider:PreloadAsync(assets)

game.ReplicatedStorage.Apps.ChildAdded:Connect(function()
	for i,v in pairs(script.Parent:GetChildren()) do
		if v:IsA("TextButton") then
			v:Destroy()
		end
	end
	

	for i,v in pairs(game.ReplicatedStorage.Apps:GetChildren()) do
		local Model = require(game.ReplicatedStorage.Apps:FindFirstChild(v.Name))

		if Model.ToGame == true then
			print("Not going to show "..v.Name)
		else
			local c = script.Label:Clone()
			c.Name = v.Name
			c.Text = v.Name
			c.Parent = script.Parent
		end
	end
end)

for i,v in pairs(game.ReplicatedStorage.Apps:GetChildren()) do
	local Model = require(game.ReplicatedStorage.Apps:FindFirstChild(v.Name))

	if Model.ToGame == true then
		print("Not going to show "..v.Name)
	else
		local c = script.Label:Clone()
		c.Name = v.Name
		c.Text = v.Name
		c.Parent = script.Parent
	end
	
end