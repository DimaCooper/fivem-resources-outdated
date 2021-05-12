resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Take pictures or selfies with your cellphone!'
dependency 'vrp'
server_script "@vrp/lib/utils.lua"
client_script 'client.lua'
server_script 'vrp.lua'