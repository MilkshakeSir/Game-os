local RE = game.ReplicatedStorage.RemoteFunction -- Event
local player = game.Players.LocalPlayer -- Player


local function getPing()
	local starttick = tick() -- Get current tick
	local servertick = RE:InvokeServer(player) -- Invoke the server and wait till it gets a reponse. This is how the ping is retrieved
	local endtick = nil -- Define endtick, but set it to nil
	while true do
		wait()
		if servertick == true then -- If it recieves a response then
			endtick = tick() 
			break
		end
	end
	return math.floor((endtick - starttick) * 1000) -- Subtract the time from when it got the response to when it invoked the server
	-- and multiply it by 1000 while using math.floor to make the number whole
end

local ping = getPing()

while wait(2) do
	local ping = getPing()
	player.PingNumber.Value = ping
end