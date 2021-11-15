game.ReplicatedStorage.Remotes.Main.Background.OnClientEvent:Connect(function(id)
	script.Parent.Backgorund.Image = id
	script.Parent.LockScreen.Image = id
end)