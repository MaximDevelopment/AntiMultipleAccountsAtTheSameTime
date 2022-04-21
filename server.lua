------ KIJKEN OF DE STEAMIDENTIFIER WAAR DE SPELER MEE JOINED AL INGAME IS ------- 

AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
    deferrals.defer('ALT Accounts checken..')
    Citizen.Wait(100)
    if json.encode(GetPlayers()) ~= '[]' then 
        for k, v in pairs(GetPlayers()) do
            if GetPlayerIdentifiers(v)[1] == GetPlayerIdentifiers(source)[1] then 
                deferrals.done('🛡️ Anti ALT Account\n\nName: ' .. name)
            end
        end
    end
    deferrals.done()
end)
