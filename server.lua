TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

RegisterServerEvent("Identity:setIdentity")
AddEventHandler("Identity:setIdentity", function(data)
    local player = ESX.GetPlayerFromId(source)
    local requete = "UPDATE users SET firstname=@name, lastname=@otherName, height=@Height, dateofbirth=@DOB WHERE identifier=@id"
	MySQL.Async.execute(requete, {
        ["@id"] = player.identifier,
        ['@name'] = tostring(data.firstName),
        ["@otherName"] = tostring(data.SubName),
        ["@Height"] = tonumber(data.Size),
        ["@DOB"] = tostring(data.DateOfBirth)
    })
end)