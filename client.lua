CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(0)
    end
end)

local Identity = {
    newEnterInRegister = false,
    showUI = function(show)
        if show then
            SendNUIMessage({type = "showUI"})
            SetNuiFocus(show, show)
            TriggerScreenblurFadeIn(100)
            DisplayRadar(false)
        else
            SendNUIMessage({type = "hideUI"})
            SetNuiFocus(show, show)
            TriggerScreenblurFadeOut(100)
            DisplayRadar(true)
        end
    end,
    _TriggerServEvnt = TriggerServerEvent
}

RegisterCommand("register", function() 
    if Identity.newEnterInRegister == false then
        Identity.showUI(true)
        Identity.newEnterInRegister = true;
    else
        print("^1You are already in the identity^0")
    end
end)

RegisterNetEvent("DKM::RegisterIdentiyUI")
AddEventHandler("DKM::RegisterIdentiyUI", function()
    if Identity.newEnterInRegister == false then
        Identity.showUI(true)
        Identity.newEnterInRegister = true;
    else
        print("^1You are already in the identity^0")
    end
end)

RegisterNUICallback("getInfos", function(data, cb)
    if data.firstName == "" then
        ESX.ShowNotification("~o~<C>Information</C>\n~r~Votre Prénom n'est pas rempli")
    elseif data.SubName == "" then
        ESX.ShowNotification("~o~<C>Information</C>\n~r~Votre Nom n'est pas rempli")
    elseif data.Size == "" then
        ESX.ShowNotification("~o~<C>Information</C>\n~r~Votre Taille n'est pas rempli")
    elseif data.DateOfBirth == "" then
        ESX.ShowNotification("~o~<C>Information</C>\n~r~Votre Date de naissance n'est pas rempli")
    else
        Identity.showUI(false)
        Identity.newEnterInRegister = false;
        Identity._TriggerServEvnt("Identity:setIdentity", {
            firstName = data.firstName, 
            SubName = data.SubName, 
            Size = data.Size, 
            DateOfBirth = data.DateOfBirth:gsub("%-", "/")
        })
        ESX.ShowNotification("~g~<C>Succès</C>\n~s~Votre Identité a bien été enrengistrer")
    end
end)