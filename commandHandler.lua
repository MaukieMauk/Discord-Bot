local discordia = require("discordia")
local config = require("./config")

local CommandHandler = {}
CommandHandler.commands = {}

-- Register a command
function CommandHandler.register(cmd)
  CommandHandler.commands[cmd.name] = cmd

  -- aliases
  if cmd.aliases then
    for _, alias in ipairs(cmd.aliases) do
      CommandHandler.commands[alias] = cmd
    end
  end
end

-- PREFIX COMMAND HANDLER
function CommandHandler.handleMessage(message)
  if message.author.bot then return end

  local prefix = config.prefix
  if message.content:sub(1, #prefix) ~= prefix then return end

  local args = {}
  for word in message.content:sub(#prefix + 1):gmatch("%S+") do
    table.insert(args, word)
  end

  local cmdName = table.remove(args, 1)
  local command = CommandHandler.commands[cmdName]
  if not command or not command.execute then return end

  command.execute(message, args)
end

-- SLASH COMMAND HANDLER
function CommandHandler.handleInteraction(interaction)
  if interaction.type ~= "applicationCommand" then return end

  local command = CommandHandler.commands[interaction.data.name]
  if not command or not command.executeSlash then return end

  command.executeSlash(interaction)
end

-- Register slash commands with Discord
function CommandHandler.registerSlashCommands(client)
  local slashCommands = {}

  for _, cmd in pairs(CommandHandler.commands) do
    if cmd.slash then
      table.insert(slashCommands, {
        name = cmd.name,
        description = cmd.description or "No description",
        options = cmd.options or {}
      })
    end
  end

  client._api:bulkOverwriteGlobalApplicationCommands(
    client.user.id,
    slashCommands
  )
end

return CommandHandler
