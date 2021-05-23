fx_version 'adamant'

game 'gta5'

author "Kibra Developments"

description "EXMode Cocaine Job"

client_script {
    'client/client.lua',
    'config.lua'
}
server_script {
    '@mysql-async/lib/MySQL.lua',
    'server/server.lua',
    'config.lua'
}