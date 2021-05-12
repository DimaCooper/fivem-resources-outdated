local Proxy = module("vrp", "lib/Proxy")

local vRP = Proxy.getInterface("vRP")

async(function()
  vRP.loadScript("DinoWeather", "sv_dinoweather")
  vRP.loadScript("DinoWeather", "sh_config")
end)
