--[[

INTRO

	=

API

	Instance WaitForPath(Instance target,string path[,number maxWait])
	Returns the instance specified by the path, as long as it loads
	before maxWait has passed. If the path doesn't exist it'll just
	suspend forever lol
	
EXAMPLE

	local WaitForPath=require(game.ReplicatedStorage.WaitForPath)
	local plr=game.Players.LocalPlayer
	local interfaceContainer=WaitForPath(plr,"PlayerGui.Interface")
	local superNestedCloseButton=WaitForPath(interfaceContainer,"MainMenu.Panels.SuperCoolPanel.Options.Close")
	superNestedCloseButton.MouseButton1Click:Connect(function() print("haha, you can never close me! :P") end)

--]]
local BAD_ARG_ERROR="%s is not a valid %s"

local function WaitForPath(target,path,maxWait)
	do --error checking
		local tt=typeof(target)
		local tp=typeof(path)
		local tm=typeof(maxWait)
		if tt~="Instance" then error(BAD_ARG_ERROR:format("Argument 1","Instance")) end
		if tp~="string" then error(BAD_ARG_ERROR:format("Argument 2","string")) end
		if tm~="nil" and tm~="number" then error(BAD_ARG_ERROR:format("Argument 3","number")) end
	end
	local segments=string.split(path,".")
	local latest
	local start=tick()
	for index,segment in pairs(segments) do
		if maxWait then
			latest=target:WaitForChild(segment,(start+maxWait)-tick())
		else
			latest=target:WaitForChild(segment)
		end
		if latest then
			target=latest
		else
			return nil
		end
	end
	return latest
end

return WaitForPath