local module = {}
local Mps = game:GetService('MarketplaceService')

function module:Uac(AppName, Id, Maker, Icon)
	game.ReplicatedStorage.Sounds.Uac:Play()
	script.Parent.Taskbar.Visible = false
	script.Parent.Backgorund.Size = UDim2.new(1,1,1,1)
	script.Parent.Uac.Visible = true
	script.Parent.Uac.Frame.AppName.Text = AppName
	script.Parent.Uac.Frame.ImageLabel.Image = Icon
	script.Parent.StartFrame.Visible = false
	local RobloxGameName = Mps:GetProductInfo(Id)
	script.Parent.Uac.Frame.Frame.GameNamew.Text = "Do you want this app called: "..AppName.."  to teleport you too "..RobloxGameName.Name
	script.Parent.Uac.Frame.MadeBy.Text = "By "..Maker
	script.Parent.Uac.Id.Value = Id
end

function module:BlueScreen(player, errormsg)
	local BlueScreen = script.Parent.Parent:WaitForChild("BlueScreen")
	local Re = BlueScreen:WaitForChild("Requests")
	
	BlueScreen.Enabled = true
	Re.Value = Re.Value +1
	BlueScreen.Frame.Error_Code.Text = tostring(errormsg)
	
	local Str = "Hello %s Your pc had a problem trying to do something please wait your Computer is going to reset"
	
	if string.find(errormsg, "Apps") then
		print("Error app apps")
		BlueScreen.Frame.Error_Name.Text = string.format("Hello %s your computer was trying to add app from Apps", player.DisplayName)
	else
		BlueScreen.Frame.Error_Name.Text = string.format(Str, player.DisplayName)
	end	
	
	
	BlueScreen.Frame.Statues.Text = "Request: "..Re.Value			
end


return module
