local Color = 255, 255, 255, 255
local status = "~g~Green Flag"
local tS = 0
local fullhudvisable = false
RegisterNetEvent("Flag:flagstatus")
AddEventHandler("Flag:flagstatus", function(newStatus)
    status = newStatus
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if status == "~g~Green Flag" then
            tS = tS + 1
            Citizen.Wait(1000)
        else
            tS = 0
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        if fullhudvisable == true then
            if status == "~g~Green Flag" then
                Text(Config.Color..""..status.."", 4, 0.40, Config.DisplayX, Config.DisplayY)
            else
                Text(Config.Color..""..status.."", 4, 0.40, Config.DisplayX, Config.DisplayY)
            end
        end
    end
end)

RegisterCommand("showflag", function()
    if fullhudvisable == false then
        fullhudvisable = true 
    elseif fullhudvisable == true then
        fullhudvisable = false
    end
end, false)

function SecondsToClock(seconds)
    local mins = string.format("%02.f", math.floor(seconds/60));
    local secs = string.format("%02.f", math.floor(seconds - mins *60));
    local timer = mins..":"..secs
    return timer
end


function Text(content, font, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextProportional(0)
    SetTextColour(255,255,255,255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

RegisterNetEvent("Priority:Notify")
AddEventHandler("Priority:Notify", function(msg)
    notify(msg)
end)

function notify(string)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringKeyboardDisplay(string)
    EndTextCommandThefeedPostTicker(true, true)
end