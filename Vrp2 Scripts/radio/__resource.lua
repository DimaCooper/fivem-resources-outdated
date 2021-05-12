resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_01_CLASS_ROCK" { url = "http://stream.radioreklama.bg:80/radio1rock.ogg", volume = 0.25 }
supersede_radio "RADIO_03_HIPHOP_NEW" { url = "http://stream.radioreklama.bg/radio1.ogg", volume = 0.25 }
supersede_radio "RADIO_02_POP" { url = "http://46.254.17.38:8000/basic-radio.ogg", volume = 0.35 }

files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}
