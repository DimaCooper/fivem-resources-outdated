--ver 0.90
description "vRP ACustoms"

ui_page "html/menu.html"

dependency "vrp"

server_scripts{ 
	"@vrp/lib/utils.lua",
	"vrp.lua"
}

client_scripts {
	"@vrp/lib/utils.lua",
	"client.lua",
	"cfg.lua"
}

files {
	"html/menu.html",
	"html/menuHandler.js",
	"html/style/menu.css",
	"html/style/colourPicker.css",
}
