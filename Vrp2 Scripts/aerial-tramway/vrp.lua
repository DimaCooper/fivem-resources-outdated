local Proxy = module("vrp", "lib/Proxy")

local vRP = Proxy.getInterface("vRP")

async(function()
  vRP.loadScript("aerial-tramway", "cablecar_controller")
end)
