
 
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			if IsControlJustReleased(1, 182) then
				TriggerServerEvent('LockToggle:Lock')

        end
    end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			if IsControlJustReleased(1, 303) then
				TriggerServerEvent('EngToggle:Engin')

        end
    end
end)


