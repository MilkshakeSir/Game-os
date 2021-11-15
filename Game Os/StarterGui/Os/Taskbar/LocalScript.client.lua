script.Parent.Start.MouseButton1Click:Connect(function()
	if script.Parent.Parent.StartFrame.Visible == false then
		script.Parent.Parent.StartFrame.Visible = true
	else
		script.Parent.Parent.StartFrame.Visible = false
	end
end)