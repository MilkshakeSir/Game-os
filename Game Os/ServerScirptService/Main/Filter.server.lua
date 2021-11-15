local rep = game.ReplicatedStorage
local TextSerice = game:GetService("TextService")

wait(3)
rep.Filter.OnServerInvoke = function(player, texttochange)
	local filtertext = TextSerice:FilterStringAsync(texttochange, player.UserId)
	return filtertext:GetNonChatStringForBroadcastAsync()
end