local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
    print('Bot logged in as ' .. client.user.username)
end)

client:on('messageCreate', function(message)
    if message.content == '!ping' then
        message:reply('Pong!')
    end
end)

client:run('MTQ1OTI1MDc4NDY3NDkwNjI2OA.GlfNRh.WPJLa9BBonNtBvDsmay5rPEtg253bAnmAy8dnU')
