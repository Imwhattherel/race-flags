local cooldown = 0
local inprogress = false
local activeUser = nil
local resetpcd = false
local inprogressStatus = nil
local RedStatus = nil
local red = false
local YellowStatus = nil
local yellow = false
local BlackStatus = nil
local black = false
local CheckeredStatus = nil
local checkered = false
local WhiteStatus = nil
local white = false
local GWCStatus = nil
local gwc = false



RegisterCommand("green", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, Config.AcePerm) then
        if red or yellow or white or checkered or black or gwc then
            red = false
            yellow = false
           activeUser = nil
            YellowStatus = nil
            RedStatus = nil
            checkered = false
            CheckeredStatus = nil
            black = false
            BlackStatus = nil
            white = false
            WhiteStatus = nil
            GWCStatus = nil
            gwc = false
            newStatus = "~g~Green Flag"
            TriggerClientEvent("Flag:flagstatus", -1, newStatus)
            TriggerClientEvent('Priority:Notify', -1, '~g~Green Flag')
            if Config.JD_logs then
                exports.JD_logs:discord('`'..GetPlayerName(source)..' green flag`', source, 0, Config.JD_logsColor, Config.JD_logsChannel)
            end
        else
            TriggerClientEvent('Priority:Notify', source, '~g~Green Flag')
        end
    else
        TriggerClientEvent('Priority:Notify', source, '~r~Alert:~w~\nYou don\'t have permission to use this command.')
    end
end)

RegisterCommand("red", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, Config.AcePerm) then
        if not red then
            red = true
            yellow = false
            black = false
            checkered = false
            white = false
            gwc = false
            activeUser = source
             red = "~r~Red Flag"
             RedStatus = red
            TriggerClientEvent("Flag:flagstatus", -1, red)
            TriggerClientEvent('Priority:Notify', -1, '~r~Red Flag')
            if Config.JD_logs then
                exports.JD_logs:discord('`'..GetPlayerName(source)..' red flag`', source, 0, Config.JD_logsColor, Config.JD_logsChannel)
            end
        else
            TriggerClientEvent('Priority:Notify', source, '~r~Red Flag')
        end
    else
        TriggerClientEvent('Priority:Notify', source, '~r~Alert:~w~\nYou don\'t have permission to use this command.')
    end
end)


RegisterCommand("yellow", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, Config.AcePerm) then
        if not yellow then
            red = false
            yellow = true
            black = false
            checkered = false
            white = false
            gwc = false
            activeUser = source
             yellow = "~y~Yellow Flag"
             YellowStatus = yellow
            TriggerClientEvent("Flag:flagstatus", -1, yellow)
            TriggerClientEvent('Priority:Notify', -1, '~y~Yellow Flag')
            if Config.JD_logs then
                exports.JD_logs:discord('`'..GetPlayerName(source)..' yellow flag`', source, 0, Config.JD_logsColor, Config.JD_logsChannel)
            end
        else
            TriggerClientEvent('Priority:Notify', source, '~y~Yellow Flag')
        end
    else
        TriggerClientEvent('Priority:Notify', source, '~r~Alert:~w~\nYou don\'t have permission to use this command.')
    end
end)


RegisterCommand("checkered", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, Config.AcePerm) then
        if not checkered then
            red = false
            yellow = false
            black = false
            checkered = true
            white = false
            gwc = false
            activeUser = source
            checkered = "~w~Checkered ~c~Flag"
             CheckeredkStatus = checkered
            TriggerClientEvent("Flag:flagstatus", -1, checkered)
            TriggerClientEvent('Priority:Notify', -1, '~w~Checkered ~c~Flag')
            if Config.JD_logs then
                exports.JD_logs:discord('`'..GetPlayerName(source)..' checkered flag`', source, 0, Config.JD_logsColor, Config.JD_logsChannel)
            end
        else
            TriggerClientEvent('Priority:Notify', source, '~w~Checkered ~c~Flag')
        end
    else
        TriggerClientEvent('Priority:Notify', source, '~r~Alert:~w~\nYou don\'t have permission to use this command.')
    end
end)
RegisterCommand("white", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, Config.AcePerm) then
        if not white then
            red = false
            yellow = false
            black = false
            checkered = false
            white = true
            gwc = false
            activeUser = source
            white = "~w~White Flag"
            WhiteStatus = white
            TriggerClientEvent("Flag:flagstatus", -1, white)
            TriggerClientEvent('Priority:Notify', -1, '~w~White Flag')
            if Config.JD_logs then
                exports.JD_logs:discord('`'..GetPlayerName(source)..'white flag`', source, 0, Config.JD_logsColor, Config.JD_logsChannel)
            end
        else
            TriggerClientEvent('Priority:Notify', source, '~w~White Flag')
        end
    else
        TriggerClientEvent('Priority:Notify', source, '~r~Alert:~w~\nYou don\'t have permission to use this command.')
    end
end)

RegisterCommand("black", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, Config.AcePerm) then
        if not black then
            red = false
            yellow = false
            black = true
            checkered = false
            white = false
            gwc = false
            activeUser = source
            black = "~c~Black Flag"
            BlackStatus = black
            TriggerClientEvent("Flag:flagstatus", -1, black)
            TriggerClientEvent('Priority:Notify', -1, '~c~Black Flag')
            if Config.JD_logs then
                exports.JD_logs:discord('`'..GetPlayerName(source)..'black flag`', source, 0, Config.JD_logsColor, Config.JD_logsChannel)
            end
        else
            TriggerClientEvent('Priority:Notify', source, '~c~Black Flag')
        end
    else
        TriggerClientEvent('Priority:Notify', source, '~r~Alert:~w~\nYou don\'t have permission to use this command.')
    end
end)

RegisterCommand("gwc", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, Config.AcePerm) then
        if not gwc then
            red = false
            yellow = false
            black = false
            checkered = false
            white = false
            gwc = true
            activeUser = source
            gwc = "~g~Green ~w~White ~c~Checkered"
            GWCStatus = gwc
            TriggerClientEvent("Flag:flagstatus", -1, gwc)
            TriggerClientEvent('Priority:Notify', -1, '~g~Green ~w~White ~c~Checkered')
            if Config.JD_logs then
                exports.JD_logs:discord('`'..GetPlayerName(source)..'gwc flag`', source, 0, Config.JD_logsColor, Config.JD_logsChannel)
            end
        else
            TriggerClientEvent('Priority:Notify', source, '~g~Green ~w~White ~c~Checkered')
        end
    else
        TriggerClientEvent('Priority:Notify', source, '~r~Alert:~w~\nYou don\'t have permission to use this command.')
    end
end)

