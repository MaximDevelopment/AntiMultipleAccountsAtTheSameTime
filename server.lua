
------- TABLE WAAR DE SPELER WORDT INGEZET WANNEER HIJ JOINED/ UITGEHAALD WANNEER HIJ LEAVED ------- 

SpelersIngame = {}

------- WANNEER DE SPELER JOINED WORDT HIJ IN DE TABLE GEZET ------- 

RegisterNetEvent('maxim:speler:gejoined')
AddEventHandler('maxim:speler:gejoined', function()
    table.insert(SpelersIngame, GetPlayerIdentifiers(source)[1])
end)

------- KIJKEN OF DE STEAMIDENTIFIER WAAR DE SPELER MEE JOINED AL INGAME IS ------- 

AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
    deferrals.defer('ALT Accounts checken..')
    Citizen.Wait(100)
    if json.encode(SpelersIngame) ~= '[]' then 
        for k, v in pairs(SpelersIngame) do
            if v == GetPlayerIdentifiers(source)[1] then 

                --  HIER KAN JE OOK EEN BAN OF LOG EVENT TRIGGEREN! 

                deferrals.done('🛡️ Anti ALT Account\n\nName: ' .. name)
            end
        end
    end
    deferrals.done()
end)

------- WANNEER DE SPELER LEAVED WORDT DE IDENTIFIER ERUIT GEHAALD ALS DIE ER OOK GOED IS INGEZET ------- 

AddEventHandler('playerDropped', function (reason)
    if json.encode(SpelersIngame) ~= '[]' then 
        for k, v in pairs(SpelersIngame) do 
            if v == GetPlayerIdentifiers(source)[1] then 
                table.remove(SpelersIngame, k)
            end
        end
    end
end)
  
