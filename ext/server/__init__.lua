-- Settings
resetNameAtEnd = true -- Reset Squad Name each game (Default: True)

-- Global variable (Current squad list)
squadList = {}

-- Event : When level is destoyed, reset the squad name by default
Events:Subscribe('Level:Destroy', function()
	if resetNameAtEnd then
		squadList = {}

		-- Send reset request to all player
		NetEvents:Broadcast('SPScoreBoard:DefaultSquadList')
	end
end)

-- NetEvent : Recevie change request and broadcast it if condition is ok
NetEvents:Subscribe('SquadRenamer:RequestSquadRename', function(player, name)
	if player then
		print('Player: ' .. player.name)
	end

	if name then
		print('Name: ' .. name)
	end

	-- Check if the player is leader first
	if player.isSquadLeader then
		local isSquadExist = false
		-- Check if custom name already exist
		for _, squad in pairs(squadList) do
			if squad["squad"] == player.squadId and squad["team"] == player.teamId then
				squad["name"] = name
				isSquadExist = true
			end
		end

		-- If not exist, add it in the table
		if not isSquadExist then
			table.insert(squadList, { ["squad"] = player.squadId, ["team"] = player.teamId, ["name"] = name })
		end
	end

	-- Send the new table to all players !
	NetEvents:Broadcast('SquadRenamer:UpdateSquadList', squadList)
	print('Squad'.. tostring(player.squadId) ..' was renamed '.. name .. ' by ' ..player.name)
end)

-- NetEvent : Recevie a request for re-send the current squad list
NetEvents:Subscribe('SquadRenamer:RequestSquadList', function(player, name)
	print('Squad list requested by ' .. player.name)
	NetEvents:SendTo('SquadRenamer:UpdateSquadList', player, squadList)
end)