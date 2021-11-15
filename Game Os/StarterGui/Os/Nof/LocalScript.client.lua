game.ReplicatedStorage.Remotes.Nof.OnClientEvent:Connect(function(NofName, NofMsg, NofImage)
	print(NofName, NofMsg, NofImage)
	local TweenSerivce = game:GetService("TweenService")
	local Goal = {Position = UDim2.new(0.354, 0,0.338, 0)}
	
	local TweenSettings = TweenInfo.new(.50, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
	
	
	local Frame = script.Frame:Clone()
	Frame.Title.TextLabel.Text = NofName
	Frame.AppName.Text = NofMsg
	Frame.ImageLabel.Image = NofImage
	Frame.Parent = script.Parent.Parent.Nof
	
	local Tween = TweenSerivce:Create(Frame, TweenSettings, Goal)
	Tween:Play()
end)