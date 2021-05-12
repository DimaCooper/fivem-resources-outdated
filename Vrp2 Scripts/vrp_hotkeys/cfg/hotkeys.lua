--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

-- YOU ARE ON A CLIENT SCRIPT ( Just reminding you ;) )
-- Keys IDs can be found at https://wiki.fivem.net/wiki/Controls
cfg = {}
-- Hotkeys Configuration: cfg.hotkeys = {[Key] = {group = 1, pressed = function() end, released = function() end},}
cfg.hotkeys = {
  [57] = {
    -- f10 toggle Kneel
    group = 1, 
    pressed = function() 
      if not IsPauseMenuActive() and not IsPedInAnyVehicle(GetPlayerPed(-1), true) then -- Comment to allow use in vehicle
        local player = GetPlayerPed( -1 )
        if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
            loadAnimDict( "random@arrests" )
            loadAnimDict( "random@arrests@busted" )
            if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 
                TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
                Wait (3000)
                TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
            else
                TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
                Wait (4000)
                TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
                Wait (500)
                TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
                Wait (1000)
                TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
            end     
        end
      end -- Comment to allow use in vehicle
    end,
    released = function()
	  -- Do nothing on release because it's toggle.
    end,
  },
  
  
  
 
  [29] = {
    -- B toggle Point
    group = 0, 
	pressed = function() 
      if not IsPauseMenuActive() and not IsPedInAnyVehicle(GetPlayerPed(-1), true) then  -- Comment to allow use in vehicle
		RequestAnimDict("anim@mp_point")
		while not HasAnimDictLoaded("anim@mp_point") do
          Wait(0)
		end
        pointing = not pointing 
		if pointing then 
		  SetPedCurrentWeaponVisible(GetPlayerPed(-1), 0, 1, 1, 1)
		  SetPedConfigFlag(GetPlayerPed(-1), 36, 1)
		  Citizen.InvokeNative(0x2D537BA194896636, GetPlayerPed(-1), "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
		  RemoveAnimDict("anim@mp_point")
        else
		  Citizen.InvokeNative(0xD01015C7316AE176, GetPlayerPed(-1), "Stop")
		  if not IsPedInjured(GetPlayerPed(-1)) then
		    ClearPedSecondaryTask(GetPlayerPed(-1))
		  end
		  if not IsPedInAnyVehicle(GetPlayerPed(-1), 1) then
		    SetPedCurrentWeaponVisible(GetPlayerPed(-1), 1, 1, 1, 1)
		  end
		  SetPedConfigFlag(GetPlayerPed(-1), 36, 0)
		  ClearPedSecondaryTask(PlayerPedId())
        end 
	  end -- Comment to allow use in vehicle
	end,
	released = function()
	  -- Do nothing on release because it's toggle.
	end,
  },

  [303] = {
    -- U toggle Vehicle Engine
    group = 1, 
	pressed = function() 
      if not IsPauseMenuActive() and IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		engine = not engine
		SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), engine, false, false)
	  end
	end,
	released = function()
	  -- Do nothing on release because it's toggle.
	end,
  },
  [71] = {
    -- W starts Vehicle Engine
    group = 1, 
	pressed = function() 
      if not IsPauseMenuActive() and IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		engine = true
		SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), engine, false, false)
	  end
	end,
	released = function()
	  -- Do nothing on release because it's toggle.
	end,
  },
 
}

return cfg