local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("serrulata-forgery:server:ForgeIDCard", function(citizenid, firstname, lastname, birthday, nationality)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.ForgeIDPrice then
        info = {}
        info.citizenid = citizenid
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = nationality

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.IDItem], 'add')
        Player.Functions.AddItem(Config.IDItem, 1, nil, info)

        Player.Functions.RemoveMoney("cash", Config.ForgeIDPrice)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)

RegisterServerEvent("serrulata-forgery:server:ForgeDrivers", function(firstname,lastname,birthday)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.ForgeDriversPrice then
        info = {}
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday
        info.type = "CLASS G DRIVER LICENSE"

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.DriversItem], 'add')
        Player.Functions.AddItem(Config.DriversItem, 1, nil, info)

        Player.Functions.RemoveMoney("cash", Config.ForgeDriversPrice)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)

RegisterServerEvent("serrulata-forgery:server:ForgeWeapon", function(firstname,lastname,birthday)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.ForgeWeaponsPrice then
        info = {}
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeaponsItem], 'add')
        Player.Functions.AddItem(Config.WeaponsItem, 1, nil, info)

        Player.Functions.RemoveMoney("cash", Config.ForgeWeaponsPrice)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)

RegisterServerEvent("serrulata-forgery:server:ForgeLawyerpass", function(passid,firstname,lastname, citizenid)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.ForgeLawyerpassPrice then
        info = {}
        info.id = passid
        info.firstname = firstname
        info.lastname = lastname
        info.citizenid = citizenid

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LawyerpassItem], 'add')
        Player.Functions.AddItem(Config.LawyerpassItem, 1, nil, info)

        Player.Functions.RemoveMoney("cash", Config.ForgeLawyerpassPrice)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)