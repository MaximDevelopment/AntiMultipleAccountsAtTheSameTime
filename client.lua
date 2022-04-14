local ingezet = false 

Citizen.CreateThread(function()
    while ingezet == false do
        Citizen.Wait(250)
        TriggerServerEvent('maxim:speler:gejoined')
        ingezet = true
        return
    end
end)
