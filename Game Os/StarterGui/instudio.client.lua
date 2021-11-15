local ContentProvider = game:GetService("ContentProvider")

local Assest = {game.ReplicatedStorage.InStudio}

ContentProvider:PreloadAsync(Assest)

wait(2)
if game.ReplicatedStorage.InStudio.Value == true then
	script.Parent.BIOS.Enabled = false
	script.Parent.Os.Enabled = true
else
	script.Parent.BIOS.Enabled = true
	script.Parent.Os.Enabled = false
end