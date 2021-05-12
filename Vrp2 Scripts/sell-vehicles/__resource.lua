resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "Sell vehicles to other players and add personal garages with store and owned options"

dependency "vrp"

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server_vrp.lua"
}

