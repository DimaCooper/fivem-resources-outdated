htmlEntities = module("vrp", "lib/htmlEntities")


local lcfg = module("vrp", "cfg/base")
Luang = module("vrp", "lib/Luang")
Lang = Luang()


Lang:loadLocale(lcfg.lang, module("vrp", "cfg/lang/"..lcfg.lang) or {})

Lang:loadLocale(lcfg.lang, module("AddonsV", "lang/"..lcfg.lang) or {})
lang = Lang.lang[lcfg.lang]



local AddonsV = class("AddonsV", vRP.Extension)


--Mobile Police Computer
local function menu_computer(self)

  local function m_msearchreg(menu)
    local user = menu.user

    local reg = user:prompt(lang.police.pc.searchreg.prompt(),"")
    local cid = vRP.EXT.Identity:getByRegistration(reg)

    if cid then
      local identity = vRP.EXT.Identity:getIdentity(cid)
      if identity then

        local smenu = user:openMenu("identity", {cid = cid})
        menu:listen("remove", function(menu) menu.user:closeMenu(smenu) end)

      else
        vRP.EXT.Base.remote._notify(user.source,lang.common.not_found())
      end
    else
      vRP.EXT.Base.remote._notify(user.source,lang.common.not_found())
    end
  end


  local function m_records(menu)
    local user = menu.user

    local reg = user:prompt(lang.police.pc.searchreg.prompt(),"")
    local tuser
    local cid = vRP.EXT.Identity:getByRegistration(reg)


    if cid then tuser = vRP.users_by_cid[cid] end

    if tuser then
    -- check vehicle

      local smenu = user:openMenu("police_pc.records", {tuser = tuser})
      menu:listen("remove", function(menu) menu.user:closeMenu(smenu) end)
    else
      vRP.EXT.Base.remote._notify(user.source,lang.common.not_found())
    end
  end



  vRP.EXT.GUI:registerMenuBuilder("computer", function(menu)
    local user = menu.user
    menu.title = "Полицейский комп."
    menu.css.header_color = "rgba(0,125,255,0.75)"

      menu:addOption(lang.police.veh_searchreg.title(), m_msearchreg, lang.police.veh_searchreg.description())
      menu:addOption(lang.police.veh_records.title(), m_records, lang.police.veh_records.description())
  end)

end




local function menu_vehicledoors(self)
local function ch_lfdoor(menu)
    local user = menu.user
    local vehicle = vRP.EXT.Garage.remote.getNearestOwnedVehicle(user.source, 4)

    if vehicle then
        self.remote._vehicleDoors(user.source, 0)
    else
        vRP.EXT.Base.remote._notify(user.source, "Слишком далеко.")
    end
end

local function ch_rfdoor(menu)
    local user = menu.user
    local vehicle = vRP.EXT.Garage.remote.getNearestOwnedVehicle(user.source, 4)

    if vehicle then
        self.remote._vehicleDoors(user.source, 1)
    else
        vRP.EXT.Base.remote._notify(user.source, "Слишком далеко.")
    end
end

local function ch_lrdoor(menu)
    local user = menu.user
    local vehicle = vRP.EXT.Garage.remote.getNearestOwnedVehicle(user.source, 4)

    if vehicle then
        self.remote._vehicleDoors(user.source, 2)
    else
        vRP.EXT.Base.remote._notify(user.source, "Слишком далеко.")
    end
end

local function ch_rrdoor(menu)
    local user = menu.user
    local vehicle = vRP.EXT.Garage.remote.getNearestOwnedVehicle(user.source, 4)

    if vehicle then
        self.remote._vehicleDoors(user.source, 3)
    else
        vRP.EXT.Base.remote._notify(user.source, "Слишком далеко.")
    end
end

local function ch_hood(menu)
    local user = menu.user
    local vehicle = vRP.EXT.Garage.remote.getNearestOwnedVehicle(user.source, 4)

    if vehicle then
        self.remote._vehicleDoors(user.source, 4)
    else
        vRP.EXT.Base.remote._notify(user.source, "Слишком далеко.")
    end
end

local function ch_trunk(menu)
    local user = menu.user
    local vehicle = vRP.EXT.Garage.remote.getNearestOwnedVehicle(user.source, 4)

    if vehicle then
        self.remote._vehicleDoors(user.source, 5)
    else
        vRP.EXT.Base.remote._notify(user.source, "Слишком далеко.")
    end
end

local function m_fwindows(menu)
    local user = menu.user
    local vehicle = vRP.EXT.Garage.remote.getNearestOwnedVehicle(user.source, 4)

    if vehicle then
        self.remote._frontvehicleWindows(user.source, 0)
    else
        vRP.EXT.Base.remote._notify(user.source, "Слишком далеко.")
    end
end

local function m_bwindows(menu)
    local user = menu.user
    local vehicle = vRP.EXT.Garage.remote.getNearestOwnedVehicle(user.source, 4)

    if vehicle then
        self.remote._backvehicleWindows(user.source, 0)
    else
        vRP.EXT.Base.remote._notify(user.source, "Слишком далеко.")
    end
end

vRP.EXT.GUI:registerMenuBuilder("vehicledoors", function(menu)
        menu.title = "Двери и стекла"
        menu:addOption("Левая П", ch_lfdoor)
        menu:addOption("Правая П", ch_rfdoor)
        menu:addOption("Левая З", ch_lrdoor)
        menu:addOption("Правая З", ch_rrdoor)		
        menu:addOption("Капот", ch_hood)
        menu:addOption("Багажник", ch_trunk)	
        menu:addOption("Стекла П", m_fwindows)	
        menu:addOption("Стекла З", m_bwindows)			
		
end)

end

  -- police computer while near PV
  local function m_computer(menu)
    local user = menu.user
    -- check vehicle
    local model = vRP.EXT.Garage.remote.getNearestOwnedVehicle(user.source, 7)
    if model then

    local menu = user:openMenu("computer")

      local running = true
      menu:listen("remove", function(menu)
        running = false
      end)

      -- task: close menu if not next to the vehicle
      Citizen.CreateThread(function()
        while running do
          Citizen.Wait(8000)
          local check_model = vRP.EXT.Garage.remote.getNearestOwnedVehicle(user.source, 7)
          if model ~= check_model then
            user:closeMenu(menu)
          end
        end
      end)
    else
      vRP.EXT.Base.remote._notify(user.source, lang.police.connection())
    end
  end

    vRP.EXT.GUI:registerMenuBuilder("police", function(menu)
      menu:addOption(lang.police.veh_searchtitle.title(), m_computer)
  end)






globalbox = false
localbox = false


    local function m_localboom(menu)
        local user = menu.user

	if user:hasPermission("!item.bbox.>0") or user:hasPermission(lang.perms.nobbox()) then	
		
        if not globalbox then
            localbox = true
            self.remote.startBoomBox(user.source)
        else
            vRP.EXT.Base.remote._notify(user.source, lang.bbox.gloplay())
        end	
       else
            vRP.EXT.Base.remote._notify(user.source, lang.bbox.inventory())			
    end
  end	

    local function m_globalboom(menu)
        local user = menu.user

        if user:hasPermission(lang.perms.bbox()) then		
		
	if user:hasPermission("!item.bbox.>0") or user:hasPermission(lang.perms.nobbox()) then			
            if not localbox then
                globalbox = true
                self.remote.startBoomBox(user.source)
				else
            vRP.EXT.Base.remote._notify(user.source, lang.bbox.localplay())
            end
			  else
            vRP.EXT.Base.remote._notify(user.source, lang.bbox.inventory())
        end
        else
            vRP.EXT.Base.remote._notify(user.source, lang.bbox.no())		
    end
  end



  local function ch_do_bbox(args,menu)
        menu:addOption(lang.bbox.playlo(), m_localboom)
        menu:addOption(lang.bbox.playglo(), m_globalboom)
  end  
  



	
function AddonsV:__construct()
    vRP.Extension.__construct(self)
  
    menu_vehicledoors(self)	
    menu_computer(self)

	
--- toggle blips
local function m_delveh(menu)
    local user = menu.user
	self.remote._deleteVehicleInFrontOrInside(user.source, 5.0)
end

-- spawn vehicle
local function m_spawnveh(menu)
    local user = menu.user
	local model = user:prompt("Vehicle Spawn", "")
	  if model ~= nil and model ~= "" then 
	    self.remote._spawnVehicle(user.source,model)
	  else
		vRP.EXT.Base.remote._notify(user.source,"Invalid")
	  end
end

local function m_tp(menu)
    local user = menu.user
	self.remote._tpToWaypoint(user.source)
end


vRP.EXT.GUI:registerMenuBuilder("admin", function(menu)
    local user = menu.user
if user:hasPermission("player.givemoney") then
       
		menu:addOption("Spawn Vehicle", m_spawnveh)
		menu:addOption("Delete Vehicle", m_delveh)		
		
		
		end
end)

	

--Vehicle Doors
    local function m_doors(menu)
	    local user = menu.user
            user:openMenu("vehicledoors")
        end

    vRP.EXT.GUI:registerMenuBuilder("vehicle", function(menu)
	    local user = menu.user
        menu:addOption("Двери и стекла", m_doors)
    end)

end

	
-- EVENT
AddonsV.event = {}



	
-- TUNNEL
AddonsV.tunnel = {}


function AddonsV.tunnel:setAudio()
    local audio = lang.bbox.audio()
    local user = vRP.users_by_source[source]

    if user then
	if globalbox then
        vRP.EXT.Audio.remote._setAudioSource(-1, user.id, audio, 0.3, 0, 0, 0, 30, user.source)
        vRP.EXT.Base.remote._notify(user.source, lang.bbox.playinglo())
    else
        vRP.EXT.Audio.remote._setAudioSource(user.source, user.id, audio, 0.3, 0, 0, 0, 30, user.source)
        vRP.EXT.Base.remote._notify(user.source, lang.bbox.playinlo())
		end
    end
end

function AddonsV.tunnel:stopAudio()
    local user = vRP.users_by_source[source]

    if user then
	if globalbox then
        globalbox = false
        vRP.EXT.Audio.remote._removeAudioSource(-1, user.id)
    else
        localbox = false
        vRP.EXT.Audio.remote._removeAudioSource(user.source, user.id)
		end
    end
end


vRP:registerExtension(AddonsV)