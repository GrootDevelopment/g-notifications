-- 🔎 Need top-tier FiveM scripts?
-- 🛒 Browse our collection: https://groot-development.tebex.io/
-- 💬 Join Discord: https://discord.gg/Nm5FSxK2gv


fx_version "cerulean"
lua54 "yes"
game "gta5"

name "g-notifications"
version "1.0.0"
description "Fivem Notification System"
author "G3DEV - justgroot"

shared_scripts{
	"@ox_lib/init.lua",
	"locales/locale.lua",
	"locales/translations/*.lua",
	"src/shared/*.lua",
}

ui_page 'web/build/index.html' 
-- ui_page 'http://localhost:5173/'
files {
   'web/build/index.html',
   'web/build/**/*',
	'web/build/audio/*.ogg',
}


client_scripts {
   'src/client/*.lua',
}

 