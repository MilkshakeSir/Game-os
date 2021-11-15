local Count = script.Parent.Count
local Uis = game:GetService("UserInputService")

local On_BIOS = script.Parent.InBIOS

Uis.InputBegan:Connect(function(input, event)
	if input.KeyCode == Enum.KeyCode.Delete then
		if On_BIOS.Value == true then
			Count.Value = Count.Value +1
			script.Parent.Count.Changed:Connect(function()
				if Count.Value == 5 then
					Count.Value = 0
					On_BIOS.Value = false
					script.Parent.BIOSFrame.Visible = true
				end
			end)
		else
			print("Can't enter BIOS")
		end
	end
end)