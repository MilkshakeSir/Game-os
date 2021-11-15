
script.Parent.RealData_Button.MouseButton1Click:Connect(function()
	script.Parent.Visible = false
	script.Parent.Parent.Parent.BIOS.InBIOS.Value = true
end)



while true do
	local Time = os.time()

	local TimeReal = "%I:%M:%S"
	local Data = "%m/%d/%Y"
	wait(.5)
	script.Parent.RealData.Text = "System Data: "..os.date(Data, Time)
	script.Parent.RealTIme.Text = "System Time: "..os.date(TimeReal, Time)
end