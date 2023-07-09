local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('badge:open')
AddEventHandler('badge:open', function(ID, targetID, type)
	local Player = QBCore.Functions.GetPlayer(ID)

	local data = {
		name = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname,
		dob = Player.PlayerData.charinfo.dob
	}

	TriggerClientEvent('badge:open', targetID, data)
	TriggerClientEvent( 'badge:shot', targetID, source )
end)

QBCore.Functions.CreateUseableItem('specialbadge', function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player.PlayerData.job.name == "police" then
		if Player.PlayerData.job.onduty then
			TriggerClientEvent('badge:openPD', source, true)
		else
			TriggerClientEvent('QBCore:Notify', source, "You must be on Duty!", "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, "For Police Officers Only", "error")
	end

end)
