


RegisterServerEvent("vrp_acustoms:checkCustPermisson")
AddEventHandler("vrp_acustoms:checkCustPermisson", function()
	local source = source
  local blockEnter = false
  local user = vRP.users_by_source[source]

  if user and user:hasPermission("tune.tune") then
    TriggerClientEvent("vrp_acustoms:blockEnter", user.source, blockEnter)
  else
    local blockEnter = true
     vRP.EXT.Base.remote._notify(user.source, "You are not an employee of LS Customs!")
    TriggerClientEvent("vrp_acustoms:blockEnter", user.source, blockEnter)
  end
end)

RegisterServerEvent("vrp_acustoms:payGarage")
AddEventHandler("vrp_acustoms:payGarage", function(totalPrice)
  local source = source
  local user = vRP.users_by_source[source]
  local x,y,z = vRP.EXT.Base.remote.getPosition(user.source)
	if user:tryPayment(totalPrice) then
	local audio = "https://vocaroo.com/media_command.php?media=s0jpEYX1kKFH&command=download_mp3"
		--vRP.EXT.Audio.remote._playAudioSource(-1, audio, 0.3, x,y,z, 15)	
		TriggerClientEvent("vrp_acustoms:installMods", source)
		vRP.EXT.Base.remote._notify(user.source, "Your vehicle is being prepared...")
		--vRP.EXT.Addons.remote._freezePedVehicle(user.source, true)
		--vRP.EXT.Addons.remote.lockPedVehicle(user.source, 4)
		SetTimeout(2000,function() 
		--vRP.EXT.Addons.remote._freezePedVehicle(user.source, false)
		--vRP.EXT.Addons.remote.lockPedVehicle(user.source, 0)
		vRP.EXT.Base.remote._notify(user.source, "Vehicle Ready - Paid ~g~$"..totalPrice)
	    vRP:save(user.id)
		end)
	else
		vRP.EXT.Base.remote._notify(user.source, "Not enough Money")
	end
end)


RegisterServerEvent("vrp_acustoms:setState") --Ppl can view mods and vrp2 will save them while viewing, they can logout then keep the mods...
AddEventHandler("vrp_acustoms:setState", function(flag)--stop vehicle state while viewing mods, start vehicle state after paying
  local user = vRP.users_by_source[source]
  vRP.EXT.Garage.remote._setStateReady(user.source, flag)
  end)
  
  
 
  