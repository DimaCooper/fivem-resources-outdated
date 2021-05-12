htmlEntities = module("vrp", "lib/htmlEntities")

local lcfg = module("vrp", "cfg/base")
Luang = module("vrp", "lib/Luang")
Lang = Luang()

Lang:loadLocale(lcfg.lang, module("vrp", "cfg/lang/"..lcfg.lang) or {})

Lang:loadLocale(lcfg.lang, module("addons_vrp2", "lang/"..lcfg.lang) or {})
lang = Lang.lang[lcfg.lang]



local Addons = class("Addons", vRP.Extension)

local globalbox = false
local localbox = false

local function menu_boombox(self)
    local function m_localboom(menu)
        local user = menu.user

	if user:hasPermission("!item."..lang.item.bbox()..".>0") or user:hasPermission(lang.perms.nobbox()) then	
		
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
		
	if user:hasPermission("!item."..lang.item.bbox()..".>0") or user:hasPermission(lang.perms.nobbox()) then			
            if not localbox then
                globalbox = true
                self.remote.startBoomBox(user.source)
            else
            vRP.EXT.Base.remote._notify(user.source, lang.bbox.localplay())
            end
        end
        else
            vRP.EXT.Base.remote._notify(user.source, lang.bbox.no())		
    end
  end


    vRP.EXT.GUI:registerMenuBuilder("boombox", function(menu)
        local user = menu.user
        menu.title = lang.bbox.title()
        menu.css.header_color = "rgba(0,125,255,0.75)"
        menu:addOption(lang.bbox.playlo(), m_localboom)
        menu:addOption(lang.bbox.playglo(), m_globalboom)
    end)
end


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
    menu.title = "Police Computer"
    menu.css.header_color = "rgba(0,125,255,0.75)"

      menu:addOption(lang.police.veh_searchreg.title(), m_msearchreg, lang.police.veh_searchreg.description())
      menu:addOption(lang.police.veh_records.title(), m_records, lang.police.veh_records.description())
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
  

function Addons:__construct()
    vRP.Extension.__construct(self)

self.spikes = {}
	
	  self.cfg = module("vrp", "cfg/garages")

	  
 
    menu_computer(self)
   

	

vRP.EXT.GUI:registerMenuBuilder("player", function(menu)
	local user = vRP.users_by_source[source]
        menu:addOption(lang.lockpick.menu(), m_lockpickveh, lang.lockpick.menu2())
end)


end


-- EVENT
Addons.event = {}





-- LOG FUNCTION
function Addons.logInfoToFile(file,info)
  file = io.open(file, "a")
  if file then
    file:write(os.date("%c").." => "..info.."\n")
  end
  file:close()
end
	
-- TUNNEL
Addons.tunnel = {}





vRP:registerExtension(Addons)	
