htmlEntities = module("vrp", "lib/htmlEntities")

local lcfg = module("vrp", "cfg/base")
Luang = module("vrp", "lib/Luang")
Lang = Luang()


Lang:loadLocale(lcfg.lang, module("vrp", "cfg/lang/"..lcfg.lang) or {})

local AddonGarage = class("AddonGarage", vRP.Extension)

local Garage_WebHook = "INCERT_DISCORD_WEBHOOK" --discord webhook for monitoring selling to each other

	local date = os.date('*t') ---OS Date and Time for Discord Log
	
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local maindate = "" .. date.day .. "." .. date.month .. "." .. date.year .. " - " .. date.hour .. ":" .. date.min .. ":" .. date.sec .. ""



--Personal Garage 
-- menu: garage owned
local function menu_pgarage_owned(self)

  local function m_pget(menu, model)
    local user = menu.user

    local vehicles = user:getVehicles()
	if user:hasPermission("!in_vehicle") then
	user:closeMenus()
	user:openMenu("pgarage", menu.data)
	vRP.EXT.Base.remote._notify(user.source, "~r~Cant spawn vehicle when already inside another vehicle")
	else
    if vehicles[model] == 1 then -- in
      local vstate = user:getVehicleState(model)
      local state = {
        customization = vstate.customization,
        condition = vstate.condition,
        locked = vstate.locked
      }

      vehicles[model] = 0
      vRP.EXT.Garage.remote._spawnVehicle(user.source, model, state)
      vRP.EXT.Garage.remote._setOutVehicles(user.source, {[model] = {}})
      user:closeMenu(menu)
    elseif vehicles[model] == 0 then
      vRP.EXT.Base.remote._notify(user.source, "~r~Vehicle not here! ~w~It may be impounded, get a vehicle token from a staff member to retrieve a lost vehicle.")

      if user:request(lang.garage.owned.force_out.request({self.cfg.force_out_fee}), 15) then
        if user:hasPermission("!item.vehicletoken.>0") then 
		if user:tryPayment(self.cfg.force_out_fee) then 
		 user:tryTakeItem("vehicletoken", 1)
          local vstate = user:getVehicleState(model)
          local state = {
            customization = vstate.customization,
            condition = vstate.condition,
            locked = vstate.locked
          }

          vehicles[model] = 0 -- mark as out
          vRP.EXT.Garage.remote._spawnVehicle(user.source, model, state)
          vRP.EXT.Garage.remote._setOutVehicles(user.source, {[model] = {state, vstate.position, vstate.rotation}})
          user:closeMenus()
		      else
          vRP.EXT.Base.remote._notify(user.source, lang.money.not_enough())
			end
		      else
          vRP.EXT.Base.remote._notify(user.source, "~r~No vehicle token in inventory!")
		   end
		end
      end
    end
  end

  vRP.EXT.GUI:registerMenuBuilder("pgarage.owned", function(menu)
    menu.title = lang.garage.owned.title()
    menu.css.header_color = "rgba(255,125,0,0.75)"
    local user = menu.user

    for model in pairs(user:getVehicles()) do
      local veh = menu.data.vehicles[model]
      if veh then
        menu:addOption(veh[1], m_pget, veh[3], model)
      end
    end
  end)
  
local local_token= {
      ["vehicletoken"] = { name = "Vehicle Token", desc = "Used for retrieving vehicles from garages", choices = nil, weight = 0.00
    }		
} 
    for k,v in pairs(local_token) do
       vRP.EXT.Inventory:defineItem(k,v.name,v.desc,v.choices,v.weight)
    end  
  
end


--Personal Garage
-- menu: garage
local function menu_pgarage(self)

  local function m_powned(menu)
    local smenu = menu.user:openMenu("pgarage.owned", menu.data)

    menu:listen("remove", function(menu)
      menu.user:closeMenu(smenu)
    end)
  end

    local function m_store(menu)
    local user = menu.user

    local model = vRP.EXT.Garage.remote.getNearestOwnedVehicle(user.source, 15)
    if model then
      if menu.data.vehicles[model] then
        vRP.EXT.Garage.remote._removeOutVehicles(user.source, {[model] = true})

        if vRP.EXT.Garage.remote.despawnVehicle(user.source, model) then
          local vehicles = user:getVehicles()
          if vehicles[model] then 
            vehicles[model] = 1
          end

          vRP.EXT.Base.remote._notify(user.source, lang.garage.store.stored())
        end
      else
        vRP.EXT.Base.remote._notify(user.source, lang.garage.store.wrong_garage())
      end
    else
      vRP.EXT.Base.remote._notify(user.source, lang.garage.store.too_far())
    end

  end

  vRP.EXT.GUI:registerMenuBuilder("pgarage", function(menu)
    menu.title = lang.garage.title({menu.data.type})
    menu.css.header_color = "rgba(255,125,0,0.75)"

    menu:addOption(lang.garage.owned.title(), m_powned, lang.garage.owned.description())
    menu:addOption(lang.garage.store.title(), m_store, lang.garage.store.description())

  end)
  

end



--Personal Garage
-- menu: garage keys
local function menu_playerkeys(self)

local function ch_sell(menu, model)
    local user = menu.user

    local veh = menu.data.vehicles[model]
	local veh_name = veh[1]

    local nuser
    local nplayer = vRP.EXT.Base.remote.getNearestPlayer(user.source, 10)

    if nplayer then
        nuser = vRP.users_by_source[nplayer]

		local nvehicles = nuser:getVehicles()  
		if nvehicles[model] == 1 or nvehicles[model] == 0 then
        vRP.EXT.Base.remote._notify(user.source, "The buyer already owns this vehicle")
		vRP.EXT.Base.remote._notify(nuser.source, "You already own the vehicle")
        else
   		
            if not self.selling_users[user.source] then
                if nuser then
					self.selling_users[user.source] = true
                    local price = tonumber(user:prompt(lang.keys.sell.description(), ""))

                    if price and price > 0 then
                        vRP.EXT.Base.remote._notify(user.source, "The offer was sent to the nearest player")
                        user:closeMenus()
						local offer = "Accept offer to buy a "..veh_name.. " vehicle for $"..price.."?"
                        if nuser:request(offer, 30) then
						  local online = false
							for k,v in pairs(vRP.users) do  
							if tonumber(k) == tonumber(user.id) then
							online = true
								end
							end
                            if online then
							if vRP.EXT.Survival.remote.isInComa(nuser.source) then
							self.selling_users[user.source] = false
							vRP.EXT.Base.remote._notify(user.source, "~r~The buyer is dead")
                            vRP.EXT.Base.remote._notify(nuser.source, "~r~You are dead and cannot accept the offer")
							else
							if veh and nuser:tryFullPayment(price) then
							local uvehicles = user:getVehicles()

							if uvehicles[model] == 0 then
							if vRP.EXT.Garage.remote.despawnVehicle(user.source, model) then
							vRP.EXT.Garage.remote._removeOutVehicles(user.source, {[model] = true})
								end
							end
							    nvehicles[model] = 1
                                uvehicles[model] = nil
								vRP.EXT.Garage.remote._removeOutVehicles(user.source, {[model] = true})
                                user:giveWallet(price)
								local sold = "You sold your "..veh_name.." for ~r~$"..price
								local bought = "You bought a "..veh_name.." for ~g~$"..price
                                vRP.EXT.Base.remote._notify(user.source, sold)
                                vRP.EXT.Base.remote._notify(nuser.source, bought)
								self.selling_users[user.source] = false
								local dead = vRP.EXT.Survival.remote._isInComa(nuser.source)
								if not nuser:hasPermission("!in_vehicle") and not dead then
							    local vstate = user:getVehicleState(model)
							    local state = {
								customization = vstate.customization,
								condition = vstate.condition,
								locked = vstate.locked
							  }

							    nvehicles[model] = 0
							  --  vRP.EXT.Garage.remote._spawnVehicle(nuser.source, model, state)
							  --  vRP.EXT.Garage.remote._setOutVehicles(nuser.source, {[model] = {state, vstate.position, vstate.rotation}})
							    user:closeMenus()		

								else
								vRP.EXT.Base.remote._notify(nuser.source, "~r~You are currently in a vehicle or dead so we stored your new "..veh_name.." in a garage.")
									end

                                local message = "**User Event**\n**Type:** `PV Sold` \n**ID:** `" .. user.id .. " sold a vehicle to " .. nuser.id .. ". `\n**Price:** `" .. price .. "`\n**Model:** `" .. veh_name .. " ` ```ini\n" .. maindate .. "```"  
                                --PerformHttpRequest(Garage_WebHook, function(err, text, headers) end, 'POST', json.encode({username = name,content = message}), {['Content-Type'] = 'application/json'}) --uncomment to enable discord log and add webhook at top
								else
								self.selling_users[user.source] = false
                                vRP.EXT.Base.remote._notify(nuser.source, "~r~Not enough Money!")
								if user then
                                vRP.EXT.Base.remote._notify(user.source, "~r~He cannot afford that price!")
								end
								end
                            end
							else
							self.selling_users[user.source] = false
                            vRP.EXT.Base.remote._notify(nuser.source, "~r~The seller left before completing the offer.")
							end

                        else
							self.selling_users[user.source] = false
                            vRP.EXT.Base.remote._notify(user.source, "~r~The offer was declined.")
							vRP.EXT.Base.remote._notify(nuser.source, "~r~You declined the offer.")
                        end
                    else
						self.selling_users[user.source] = false
                        vRP.EXT.Base.remote._notify(user.source, "~r~You cant give it away for free.")
                    end
                end
            else
                vRP.EXT.Base.remote._notify(user.source, "~r~A offer is in progress.")
				end
            end
		
        else
        vRP.EXT.Base.remote._notify(user.source, "~r~No player near")
    end
end



vRP.EXT.GUI:registerMenuBuilder("playerkeys", function(menu)
    menu.title = "Ключи от транспорта"
    menu.css.header_color = "rgba(0,125,200,0.75)"
    local user = menu.user
    local uvehicles = user:getVehicles()

    for model,veh in pairs(menu.data.vehicles) do
      if model ~= "_config" and uvehicles[model] then
        menu:addOption(veh[1], ch_sell, "Продать транспорт ближайшему персонажу", model)
        end
    end
end)

end

function AddonGarage:closeMenu()
local user = vRP.users_by_source[source]

user:closeMenus()
end

function AddonGarage:__construct()
    vRP.Extension.__construct(self)

  self.selling_users = {}

  self.cfg = module("sell-vehicles", "cfg/personal_garages")

  menu_pgarage_owned(self)
  menu_pgarage(self)  
  menu_playerkeys(self)
 
 
-- Sell Car to Players	
local function m_sellcar(menu)
    local user = menu.user
    for k, v in pairs(self.cfg.pgarages) do
        local ptype, x, y, z = table.unpack(v)
        local group = self.cfg.garage_ptypes[ptype]

        if group then
            local gcfg = group._config
			local data = {type = ptype, vehicles = group}
			local menu = menu.user:openMenu("playerkeys", data)
			menu:listen("close", function(menu)
			menu.user:closeMenu(menu)
				end)
			end
		end
end

     vRP.EXT.GUI:registerMenuBuilder("Действия", function(menu)
     menu:addOption("Ключи от транспорта", m_sellcar)
	end) 

end		



AddonGarage.event = {}

		
function AddonGarage.event:playerSpawn(user, first_spawn)
    if first_spawn then
        if user and user:isReady() then
	for k,v in pairs(self.cfg.pgarages) do
      local ptype,x,y,z = table.unpack(v)

      local group = self.cfg.garage_ptypes[ptype]
      if group then
        local gcfg = group._config


        local menu
        local function enter(user)
          if user:hasPermissions(gcfg.permissions or {}) then
            menu = user:openMenu("pgarage", {type = ptype, vehicles = group})
          end
        end
		
        -- leave
        local function leave(user)
          if menu then
            user:closeMenus()
          end
        end

        local ment = clone(gcfg.map_entity)
        ment[2].title = lang.garage.title({ptype})
        ment[2].pos = {x,y,z-1}
        vRP.EXT.Map.remote._addEntity(user.source,ment[1], ment[2])

        user:setArea("vRP:pgarage:"..k,x,y,z,2,5.5,enter,leave)
		  end
		if self.selling_users[user.source] then --did they leave right when completing a transaction and is still active in the sell vehicle section
		self.selling_users[user.source]	= false	
			end  
		end
      end
    end
  end


vRP:registerExtension(AddonGarage)	
