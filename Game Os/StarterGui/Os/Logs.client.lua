game:GetService("LogService").MessageOut:Connect(function(Message, Types)
	if Types == Enum.MessageType.MessageOutput then
		local c = script.Value:Clone()
		c.Name = "Print"
		c.Value = tostring(Message)
		c.Parent = game.ReplicatedStorage.Logs
	elseif Types == Enum.MessageType.MessageWarning then
		local c = script.Value:Clone()
		c.Name = "Warn"
		c.Value = tostring(Message)
		c.Parent = game.ReplicatedStorage.Logs
	elseif Types == Enum.MessageType.MessageError then
		local c = script.Value:Clone()
		c.Name = "Error"
		c.Value = tostring(Message)
		c.Parent = game.ReplicatedStorage.Logs
	end
end)