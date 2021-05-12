resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

dependency "vrp"

files { 
    "config.ini",
    "Newtonsoft.Json.dll",
    "GasStations.json"
}
client_script "frfuel.net.dll"
--client_script "config.lua"

server_script "@vrp/lib/utils.lua"
server_script "vrp.lua"
