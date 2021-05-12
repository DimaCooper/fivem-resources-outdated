--[[
ROBBERY FORMAT:
	["id"] = { 
	  name = "Name",
	  pos = {x, y, z}, 
	  dist = radius, rob = seconds,	wait = seconds,	cops = minimum, stars = wanted, min = min_reward, max = max_reward
	},
	- id: unique id of the robbery used to identify it in the code
	- name: name of the robbery that will go on chat
	- pos: x, y, z - the pos of the robbery
	- dist: how far you can get from the robbery
	- rob: time in seconds to rob
	- wait: time in seconds to wait before it can be robbed again
	- cops: minimum amount of cops online necessary to rob
	- stars: stars aquired for robbing
	- min: minimum amount it can give as a reward
	- max: maximum amount it can give as a reward
]]
cfg = {}
cfg.lang = "en" -- set your lang (file must exist on cfg/lang)
cfg.key = 45 -- INPUT_RELOAD
cfg.cops = "police.pc"	 -- permission given to cops

cfg.bankrobbery = { -- list of robberies
	["fleeca2"] = { 
	 _config = {x = -2957.66, y = 481.45, z = 15.69, map_entity = {"PoI", {blip_id = 431, blip_color = 1}}},
	  name = "Fleeca Bank (Highway)", 
	  pos = {-2957.6674804688, 481.45776367188, 15.697026252747}, 
	  dist = 15.0, rob = 360, wait = 3000, cops = 4, min = 100000, max = 200000 --100-200
	},
	["blainecounty"] = { 
 	_config = {x = -107.06, y = 6474.80, z = 31.62, map_entity = {"PoI", {blip_id = 431, blip_color = 1}}},
	  name = "Blaine County Savings", 
	  pos = {-107.06505584717, 6474.8012695313, 31.62670135498}, 
	  dist = 15.0, rob = 360, wait = 3000, cops = 4, min = 100000, max = 200000
	},
	["fleeca3"] = { 
 	_config = {x = -1212.25, y = -336.12, z = 36.79, map_entity = {"PoI", {blip_id = 431, blip_color = 1}}},
	  name = "Fleeca Bank (Rockford Hills)", 
	  pos = {-1212.2568359375, -336.128295898438, 36.7907638549805}, 
	  dist = 15.0, rob = 360, wait = 3000, cops = 4, min = 100000, max = 200000
	},
	["fleeca6"] = { 
 	_config = {x = 1176.86, y = 2711.91, z = 38.09, map_entity = {"PoI", {blip_id = 431, blip_color = 1}}},
	  name = "Fleeca Bank (Desert)", 
	  pos = {1176.86865234375, 2711.91357421875, 38.097785949707}, 
	  dist = 15.0, rob = 360, wait = 3000, cops = 4, min = 100000, max = 200000
	},
	["pacific"] = { 
 	_config = {x = 255.00, y = 225.85, z = 101.00, map_entity = {"PoI", {blip_id = 431, blip_color = 1}}},
	  name = "Pacific Standards (Downtown Vinewood)", 
	  pos = {255.001098632813, 225.855895996094, 101.005694274902}, 
	  dist = 30.0, rob = 480, wait = 9000, cops = 8, min = 300000, max = 600000
	},
	---shops
	["paleto_twentyfourseven"] = { 
	_config = {x = 1734.48 , y = 6420.38, z = 34.53, map_entity = {"PoI", {}}},
	  name = "Twenty Four Seven. (Paleto Bay)",
	  pos = {1734.48046875, 6420.38134765625, 34.5372314453125}, 
	  dist = 15.0, rob = 240,	wait = 2500,cops = 2,  min = 3500, max = 8000
	},
	["sandyshores_twentyfoursever"] = { 
	_config = {x = 1960.75, y = 3749.26, z = 31.34, map_entity = {"PoI", {}}},
	  name = "Twenty Four Seven. (Sandy Shores)", 
	  pos = {1960.7580566406, 3749.26367187, 31.3437423706055},
	  dist = 15.0, rob = 240, wait = 2500, cops = 2,  min = 3500, max = 8000
	},
	["bar_one"] = { 
	_config = {x = 1986.12, y = 3053.87, z = 47.21, map_entity = {"PoI", {}}},
	  name = "Yellow Jack. (Sandy Shores)",
	  pos = {1986.1240234375, 3053.8747558594, 47.215171813965}, 
	  dist = 15.0, rob = 240, wait = 2500, cops = 2,  min = 13500, max = 25000
	},
	["littleseoul_twentyfourseven"] = { 
	_config = {x = -709.17, y = -904.21, z = 19.21, map_entity = {"PoI", {}}},
	  name = "Twenty Four Seven. (Little Seoul)",
	  pos = {-709.17022705078, -904.21722412109, 19.215591430664},
	  dist = 15.0, rob = 240, wait = 2500, cops = 2,  min = 10000, max = 15000
	},
	["southlossantos_gasstop"] = { 
	_config = {x = 28.75, y = -1339.82, z = 29.49, map_entity = {"PoI", {}}},
	  name = "Limited LTD Gas Stop. (South Los Santos)",
	  pos = {28.7538948059082, -1339.8212890625, 29.4970436096191}, 
	  dist = 15.0, rob = 240, wait = 2500, cops = 2,  min = 10000, max = 15000
	},
	["southlossantos_twentyfourseven"] = { 
	_config = {x = -43.15, y = -1748.75, z = 29.42, map_entity = {"PoI", {}}},
	  name = "Twenty Four Seven. (South Los Santos)",
	  pos = {-43.1531448364258, -1748.75244140625, 29.4209976196289},
	  dist = 15.0, rob = 240, wait = 2500, cops = 2,  min = 10000, max = 15000
	},
	["vinewood_twentyfourseven"] = { 
	_config = {x = 378.03, y = 332.94, z = 103.56, map_entity = {"PoI", {}}},
	  name = "Twenty Four Seven. (Vinewood)",
	  pos = {378.030487060547, 332.944427490234, 103.566375732422},
	  dist = 15.0, rob = 240, wait = 2500, cops = 2,  min = 10000, max = 15000
	},
	["eastlossantos_robsliquor"] = { 
	_config = {x = 1126.68, y = -980.39, z = 45.41, map_entity = {"PoI", {}}},
	  name = "Rob's Liquor. (East Los Santos)",
	  pos = {1126.68029785156, -980.39501953125, 45.4157257080078}, 
	  dist = 15.0, rob = 240, wait = 2500, cops = 2,  min = 10000, max = 15000
	},
	["sandyshores_twentyfourseven"] = { 
	_config = {x = 2673.32, y = 3286.41, z = 55.24, map_entity = {"PoI", {}}},
	  name = "Twenty Four Seven. (Sandy Shores)", 
	  pos = {2673.32006835938, 3286.4150390625, 55.241138458252}, 
  	  dist = 15.0, rob = 240, wait = 2500, cops = 2,  min = 10000, max = 15000
	},
	["grapeseed_gasstop"] = { 
	_config = {x = 1707.52, y = 4920.05, z = 42.06, map_entity = {"PoI", {}}},
	  pos = {1707.52648925781, 4920.05126953125, 42.0636787414551}, 
	  name = "Limited LTD Gas Stop. (Grapeseed)",
	  dist = 15.0, rob = 240, wait = 2500, cops = 2,  min = 10000, max = 15000
	},
	["morningwood_robsliquor"] = { 
	_config = {x = -1479.22, y = -375.09, z = 39.16, map_entity = {"PoI", {}}},
	  name = "Rob's Liquor. (Morning Wood)", 
	  pos = {-1479.22424316406, -375.097686767578, 39.1632804870605}, 
	  dist = 15.0, rob = 240, wait = 2500, cops = 2,  min = 10000, max = 15000
	},
	["chumash_robsliquor"] = { 
	_config = {x = -2959.37, y = 387.55, z = 14.04, map_entity = {"PoI", {}}},
	  name = "Rob's Liquor. (Chumash)", 
	  pos = {-2959.37524414063, 387.556365966797, 14.043158531189}, 
	  dist = 15.0, rob = 240, wait = 2500, cops = 4,  min = 10000, max = 15000
	},
	["delperro_robsliquor"] = { 
	_config = {x = -1220.14, y = -915.71, z = 11.32, map_entity = {"PoI", {}}},
	  name = "Rob's Liquor. (Del Perro)", 
	  pos = {-1220.14123535156, -915.712158203125, 11.3261671066284}, 
	  dist = 15.0, rob = 240, wait = 2500, cops = 4,  min = 10000, max = 15000
	},
	["eastlossantos_gasstop"] = { 
	_config = {x = 1160.06, y = -314.06, z = 69.20, map_entity = {"PoI", {}}},
	  name = "Limited LTD Gas Stop. (East Los Santos)", 
	  pos = {1160.06237792969, -314.061828613281, 69.2050628662109},
	  dist = 15.0, rob = 240, wait = 2500, cops = 4,  min = 10000, max = 15000
	},
	["tongva_gasstop"] = { 
	_config = {x = -1829.00, y = 798.90, z = 138.18, map_entity = {"PoI", {}}},
	  name = "Limited LTD Gas Stop. (Tongva Valley)", 
	  pos = {-1829.00427246094, 798.903076171875, 138.186706542969}, 
	  dist = 15.0, rob = 240, wait = 2500, cops = 4,  min = 10000, max = 25000
	},
	["tataviam_twentyfourseven"] = { 
	_config = {x = 2549.40, y = 385.04, z = 108.62, map_entity = {"PoI", {}}},
	  name = "Twenty Four Seven. (Tataviam Mountains)", 
	  pos = {2549.400390625, 385.048309326172, 108.622955322266}, 
	  dist = 15.0, rob = 240, wait = 2500, cops = 4,  min = 10000, max = 15000
	},
	["rockford_jewlery"] = { 
	_config = {x = -621.98, y = -230.80, z = 38.05, map_entity = {"PoI", {blip_id = 431, blip_color = 1}}},
	  name = " Vangelico Jewelry name. (Rockford Hills)", 
	  pos = {-621.989135742188, -230.804443359375, 38.0570297241211},
	  dist = 15.0, rob = 360, wait = 4000, cops = 4,  min = 35000, max = 85000
	},
}


return cfg

