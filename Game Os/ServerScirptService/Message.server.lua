local HttpService = game:GetService("HttpService")

local webhookurl = "https://discord.com/api/webhooks/898344893955592203/Sv4e9QP1OQhh2IkNxhO5kQzn_5zjgqUIq2q2W9Te7O6xAp3DuUlb256WFjjrF0lk7RtO"

local Can = true
local Can2 = true

game.ReplicatedStorage.Remotes.Disc.PlayerEnterOs.OnServerEvent:Connect(function(player)
	if Can then
		Can = false
		local data = { --Creating an Embed
			['embeds'] = {{
				["title"] = (player.Name), --Player's name is the title
				["description"] = (player.Name.." has log in into the os"), --description is they joined the game
				["type"] = "rich", --Making it an embed
				["color"] = tonumber(0xa8ff58), --choosing the embeds color
				["fields"] = { --creating fields

					{
						["name"] = "Player Id",
						["value"] = (player.UserId),
						["inline"] = true --this field will be inline (you will see what that means)
					},


					{
						["name"] = "Player Link",
						["value"] = ("https://web.roblox.com/users/"..tostring(player.UserId).."/profile"),
						["inline"] = true --this field isn't inline
					},


				}           
			}}

		}

		data = HttpService:JSONEncode(data) --Creating a JSON string 
		HttpService:PostAsync(webhookurl, data) --sending the data
		wait(10)
		Can = true
	else
		player:Kick("Spam to server")
	end
end)

game.ReplicatedStorage.Remotes.Disc.PlayerAdd_A_App.OnServerEvent:Connect(function(player, id)
	if Can2 then
		Can2 = false
		local data = { --Creating an Embed
			['embeds'] = {{
				["title"] = (player.Name), --Player's name is the title
				["description"] = (player.Name.." has loaded a asset"), --description is they joined the game
				["type"] = "rich", --Making it an embed
				["color"] = tonumber(0xa8ff58), --choosing the embeds color
				["fields"] = { --creating fields

					{
						["name"] = "Model Id",
						["value"] = (id),
						["inline"] = true --this field will be inline (you will see what that means)
					},


					{
						["name"] = "Model Link",
						["value"] = ("https://web.roblox.com/library/"..tostring(id)),
						["inline"] = true --this field isn't inline
					},


				}           
			}}

		}

		data = HttpService:JSONEncode(data) --Creating a JSON string 
		HttpService:PostAsync(webhookurl, data) --sending the data
		wait(2.2)
		Can2 = true
	else
		player:Kick("Spam to server")
	end
end)