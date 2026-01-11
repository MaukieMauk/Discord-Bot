local discordia = require('discordia')
local client = discordia.Client()

client:on('messageCreate', function(message)
    if message.author.bot then return end

    if message.content:match('^!userinfo') then
        -- Get mentioned user or fallback to author
        local user
        for _, u in pairs(message.mentionedUsers) do
            user = u
            break
        end
        user = user or message.author

        local member = message.guild:getMember(user.id)

        -- Collect roles
        local roles = {}
        if member then
            for _, role in pairs(member.roles) do
                table.insert(roles, role.name)
            end
        end

        -- Create embed
        local embed = {
            title = user.username .. "'s Info",
            color = 0x00ff00,
            fields = {
                {name = "Username", value = user.username, inline = true},
                {name = "Discriminator", value = "#" .. user.discriminator, inline = true},
                {name = "ID", value = user.id, inline = false},
                {name = "Joined Server", value = member and tostring(member.joinedAt) or "N/A", inline = true},
                {name = "Roles", value = #roles > 0 and table.concat(roles, ", ") or "None", inline = false},
                {name = "Bot?", value = tostring(user.bot), inline = true}
            },
            timestamp = os.time()
        }

        message:reply {embed = embed}
    end
end)