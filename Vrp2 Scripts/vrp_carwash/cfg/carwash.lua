cfg = {}

cfg.carwash = {
--locations
["1"] = {
      _config = {x = 167.10, y = -1719.47, z = 29.29, map_entity = {"PoI", {blip_id = 100, blip_color = 18,marker_id = 1, scale = {2.0,2.0,1.0},color={5, 229, 246,125} }}}, 
},

["2"] = {
      _config = {x = 26.59, y = -1392.02, z = 29.36, map_entity = {"PoI", {blip_id = 100, blip_color = 18,marker_id = 1, scale = {2.0,2.0,1.0},color={5, 229, 246,125} }}},
},
["3"] = {
      _config = {x = -74.56, y = 6427.87, z = 31.44, map_entity = {"PoI", {blip_id = 100, blip_color = 18,marker_id = 1, scale = {2.0,2.0,1.0},color={5, 229, 246,125} }}},
},

["4"] = {
      _config = {x = -699.63, y = -932.70, z = 19.01, map_entity = {"PoI", {blip_id = 100, blip_color = 18,marker_id = 1, scale = {2.0,2.0,1.0},color={5, 229, 246,125} }}},

  }
}

--price per dirt level >15
cfg.price = 2

--language
cfg.lang = {
  title = "Автомойка",
  cleaned = "~r~Транспорт чистый...",
  goodbye = "~g~Спасибо за визит!",
  no_veh = "~r~Вы не в транспортею"
}

return cfg
