local MarketplaceService = game:GetService('MarketplaceService')

MarketplaceService.ProcessReceipt = function(receiptInfo)
	local player = game:GetService("Players"):GetPlayerByUserId(receiptInfo.PlayerId)

	if not player then -- Seems like we can't find the player... already left?
		print("Player may left so we can do it")
	end
	
	print(player, "Donation:" .. receiptInfo.CurrencySpent, receiptInfo.CurrencySpent)

	wait(2)
	game.ReplicatedStorage.Remotes.Nof:FireClient(player, "Dontation", "Thank you for donating "..receiptInfo.CurrencySpent, "rbxassetid://7072723932")
	return Enum.ProductPurchaseDecision.PurchaseGranted
end