fx_version "adamant"
game "gta5"

ui_page "UI/index.html"

files {
    "UI/index.html",
    "UI/assets/css/Login-Form-Clean.css",
    "UI/assets/bootstrap/css/bootstrap.min.css",
    "UI/assets/bootstrap/js/bootstrap.min.js",
    "UI/main.js"
}

client_script "client.lua"

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server.lua"
}