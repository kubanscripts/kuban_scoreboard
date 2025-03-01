-- ██╗  ██╗██╗   ██╗██████╗  █████╗ ███╗   ██╗███████╗ ██████╗██████╗ ██╗██████╗ ████████╗███████╗
-- ██║ ██╔╝██║   ██║██╔══██╗██╔══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
-- █████╔╝ ██║   ██║██████╔╝███████║██╔██╗ ██║███████╗██║     ██████╔╝██║██████╔╝   ██║   ███████╗
-- ██╔═██╗ ██║   ██║██╔══██╗██╔══██║██║╚██╗██║╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   ╚════██║
-- ██║  ██╗╚██████╔╝██████╔╝██║  ██║██║ ╚████║███████║╚██████╗██║  ██║██║██║        ██║   ███████║
-- ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ╚══════╝                                                                                            
-- https://discord.gg/UzVbtKEzgN 

fx_version 'cerulean'

game 'gta5'

lua54 'yes'

author 'KubanScripts'

description 'A Simple Scoreboard for QBCore/QBox'

version '1.0'

client_script 'client.lua'

server_scripts {
    'version.lua',
    'server.lua',
}
ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/images/*.png'
}
