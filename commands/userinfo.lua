client:on('messageCreate', function(message)
    -- Ignore messages from bots
    if message.author.bot then return end

    -- Userinfo command
    if message.content:match('^!userinfo') then
        local user = message.mentionedUsers:first() or message.author -- Use mentioned user or author
        local member = message.guild:getMember(user.id)

        local roles = {}
        if member then
            for _, role in ipairs(member.roles) do
                table.insert(roles, role.name)
            end
        end

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
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ") -- optional
        }

        message:reply {embed = embed}
    end
end)
