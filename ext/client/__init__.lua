-- Settings
onlyAlphaNum = true -- Only AlphaNumeric character is allowed
maxLenAllowed = 60 -- Maximum character lenght allowed

-- Global object
squadObject = nil
squadObjectDefault = nil

-- Initialize the WebUI Interface, and hide it
Events:Subscribe('Extension:Loaded', function()
    WebUI:Init()
	WebUI:Hide()
end)

-- Hook, got the squadObject and UI system
Hooks:Install('UI:PushScreen', 999, function(hook, screen, graphPriority, parentGraph)
	screen = UIGraphAsset(screen)

	if screen.name:starts('UI/Flow/Screen/SquadScreen') then
		local currentPlayer = PlayerManager:GetLocalPlayer()

		-- Show the UI if Squad Leader
		if currentPlayer then
			if currentPlayer.isSquadLeader then
				WebUI:Show()
			end
		end

		-- Found and Store an instance of the UISquadCompData
		if squadObject == nil then
			squadObject = UISquadCompData(ResourceManager:SearchForDataContainer('UI/UIComponents/UISquadComp'))

			if squadObject then
				squadObject:MakeWritable()
				
				-- Create a default value
				squadObjectDefault = UISquadCompData(squadObject:Clone())

				-- Now the squadObject is available, request the squad list to the server
				NetEvents:Send("SquadRenamer:RequestSquadList")
			end
		end
	else
		-- Hide the UI
		WebUI:Hide()
	end
end)

-- Event: Apply is called
Events:Subscribe('SquadRenamer:UIApplySquad', function(name)
	if onlyAlphaNum then
		if (name:match("[^%w%s]")) then
			print('Non alphanumeric character is not allowed.')
			return nil
		end
	end

	if string.len(name) > maxLenAllowed then
		print('Squad name is too long (Max: ' .. maxLenAllowed .. ').')
		return nil
	end

	print("Name: " .. name)
	NetEvents:Send("SquadRenamer:RequestSquadRename", name)
end)


-- Event: Update the squad name when team is change
Events:Subscribe('Player:TeamChange', function(player, team, squad)
	resetSquadName()
	NetEvents:Send("SquadRenamer:RequestSquadList")
end)

-- NetEvents: Reset squad to default
NetEvents:Subscribe('SquadRenamer:DefaultSquadList', function()
	resetSquadName()
end)

-- NetEvents: Revevie the squad list and update everything
NetEvents:Subscribe('SquadRenamer:UpdateSquadList', function(squadList)
	if squadList then
		for _, squad in pairs(squadList) do
			updateSquadName(squad['squad'], squad['team'], squad['name'])
		end

		print('Squad list was updated.')
	end
end)

-- Console: Rename command for debug
Console:Register('rename', 'Rename the current squad.', function(args)
 	if #args == 1 then
 		local name = tostring(args[1])

 		if onlyAlphaNum then
 			if (name:match("[^%w%s]")) then
 				print('Non alphanumeric character is not allowed.')
 				return nil
 			end
 		end

 		if string.len(name) > maxLenAllowed then
 			print('Squad name is too long (Max: ' .. maxLenAllowed .. ').')
 			return nil
 		end

		NetEvents:Send("SquadRenamer:RequestSquadRename", name)
 	else
 		print('rename [name]')
 	end

	return nil
end)

-- Function for reset the squad name
function resetSquadName()
	if squadObject and squadObjectDefault then
		squadObject.squad1 = squadObjectDefault.squad1
		squadObject.squad2 = squadObjectDefault.squad2
		squadObject.squad3 = squadObjectDefault.squad3
		squadObject.squad4 = squadObjectDefault.squad4
		squadObject.squad5 = squadObjectDefault.squad5
		squadObject.squad6 = squadObjectDefault.squad6
		squadObject.squad7 = squadObjectDefault.squad7
		squadObject.squad8 = squadObjectDefault.squad8
		squadObject.squad9 = squadObjectDefault.squad9
		squadObject.squad10 = squadObjectDefault.squad10
		squadObject.squad11 = squadObjectDefault.squad11
		squadObject.squad12 = squadObjectDefault.squad12
		squadObject.squad13 = squadObjectDefault.squad13
		squadObject.squad14 = squadObjectDefault.squad14
		squadObject.squad15 = squadObjectDefault.squad15
		squadObject.squad16 = squadObjectDefault.squad16
		squadObject.squad17 = squadObjectDefault.squad17
		squadObject.squad18 = squadObjectDefault.squad18
		squadObject.squad19 = squadObjectDefault.squad19
		squadObject.squad20 = squadObjectDefault.squad20
		squadObject.squad21 = squadObjectDefault.squad21
		squadObject.squad22 = squadObjectDefault.squad22
		squadObject.squad23 = squadObjectDefault.squad23
		squadObject.squad24 = squadObjectDefault.squad24
		squadObject.squad25 = squadObjectDefault.squad25
		squadObject.squad26 = squadObjectDefault.squad26
		squadObject.squad27 = squadObjectDefault.squad27
		squadObject.squad28 = squadObjectDefault.squad28
		squadObject.squad29 = squadObjectDefault.squad29
		squadObject.squad30 = squadObjectDefault.squad30
		squadObject.squad31 = squadObjectDefault.squad31
		squadObject.squad32 = squadObjectDefault.squad32
	end
end

-- Function for update the Squad object
function updateSquadName(squad_nbr, teamId, final_name)
	local currentPlayer = PlayerManager:GetLocalPlayer()

	if currentPlayer and squadObject then
		if currentPlayer.teamId == teamId then
			if squad_nbr == 1 then
				squadObject.squad1 = final_name
			elseif squad_nbr == 2 then
				squadObject.squad2 = final_name
			elseif squad_nbr == 3 then
				squadObject.squad3 = final_name
			elseif squad_nbr == 4 then
				squadObject.squad4 = final_name
			elseif squad_nbr == 5 then
				squadObject.squad5 = final_name
			elseif squad_nbr == 6 then
				squadObject.squad6 = final_name
			elseif squad_nbr == 7 then
				squadObject.squad7 = final_name
			elseif squad_nbr == 8 then
				squadObject.squad8 = final_name
			elseif squad_nbr == 9 then
				squadObject.squad9 = final_name
			elseif squad_nbr == 10 then
				squadObject.squad10 = final_name
			elseif squad_nbr == 11 then
				squadObject.squad11 = final_name
			elseif squad_nbr == 12 then
				squadObject.squad12 = final_name
			elseif squad_nbr == 13 then
				squadObject.squad13 = final_name
			elseif squad_nbr == 14 then
				squadObject.squad14 = final_name
			elseif squad_nbr == 15 then
				squadObject.squad15 = final_name
			elseif squad_nbr == 16 then
				squadObject.squad16 = final_name
			elseif squad_nbr == 17 then
				squadObject.squad17 = final_name
			elseif squad_nbr == 18 then
				squadObject.squad18 = final_name
			elseif squad_nbr == 19 then
				squadObject.squad19 = final_name
			elseif squad_nbr == 20 then
				squadObject.squad20 = final_name
			elseif squad_nbr == 21 then
				squadObject.squad21 = final_name
			elseif squad_nbr == 22 then
				squadObject.squad22 = final_name
			elseif squad_nbr == 23 then
				squadObject.squad23 = final_name
			elseif squad_nbr == 24 then
				squadObject.squad24 = final_name
			elseif squad_nbr == 25 then
				squadObject.squad25 = final_name
			elseif squad_nbr == 26 then
				squadObject.squad26 = final_name
			elseif squad_nbr == 27 then
				squadObject.squad27 = final_name
			elseif squad_nbr == 28 then
				squadObject.squad28 = final_name
			elseif squad_nbr == 29 then
				squadObject.squad29 = final_name
			elseif squad_nbr == 30 then
				squadObject.squad30 = final_name
			elseif squad_nbr == 31 then
				squadObject.squad31 = final_name
			elseif squad_nbr == 32 then
				squadObject.squad32 = final_name
			else
				print('SquadID(' .. tostring(squad_nbr) .. '): unknown squad id')
				return nil
			end
		else
			print('Not same team')
		end

		print('SquadID(' .. tostring(squad_nbr) .. ') set to ' .. final_name)
	end

	return nil
end