fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

author 'Gale#4864'
version '1.0.0'

client_scripts {
	'config.lua',
	'client/*.lua',
}
server_script 'server/*.lua'
shared_scripts {
    'config.lua',
	'@ox_lib/init.lua'
}
