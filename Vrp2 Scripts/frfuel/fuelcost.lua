

--[[
function round(num, numDecimalPlaces)
local mult = 5^(numDecimalPlaces or 0)
return math.floor(num * mult * 0.5) / mult
end]]

RegisterServerEvent('frfuel:fuelAdded')
AddEventHandler('frfuel:fuelAdded', function(amount)



local user = vRP.users_by_source[source]


if user:tryFullPayment(0.8 * math.ceil(amount)) then

		   vRP.EXT.Base.remote._notify(user.source, "~o~[Заправка]~w~ Заправили " .. math.ceil(amount * 0.264172 * 3.78541) .. " л.")
		   vRP.EXT.Base.remote._notify(user.source,"~o~[Чек]~w~ Оплата " .. math.ceil(0.8 * math.ceil(amount)) .." ~g~$")
   end

end)


