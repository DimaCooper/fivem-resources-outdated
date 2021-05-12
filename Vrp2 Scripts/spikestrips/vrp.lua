local Proxy = module("vrp", "lib/Proxy")

local vRP = Proxy.getInterface("vRP")

async(function()
  vRP.loadScript("spikestrips", "server")
  vRP.loadScript("spikestrips", "config")
end)
