local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("erp-forgery:server:ForgeID")
AddEventHandler("erp-forgery:server:ForgeID", function(citizenid, firstname, lastname, birthday, nationality)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.ForgeIDCost then
        info = {}
        info.citizenid = citizenid
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = nationality

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ss.IDItem], 'add')
        Player.Functions.AddItem(ss.IDItem, 1, nil, info)

        Player.Functions.RemoveMoney("cash", Config.ForgeIDCost)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)

RegisterServerEvent("erp-forgery:server:ForgeDrivers")
AddEventHandler("erp-forgery:server:ForgeDrivers", function(firstname,lastname,birthday)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.DriverCost then
        info = {}
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday
        info.type = "CLASS G DRIVER LICENSE"

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ss.DriversItem], 'add')
        Player.Functions.AddItem(ss.DriversItem, 1, nil, info)

        Player.Functions.RemoveMoney("cash", Config.DriverCost)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)

RegisterServerEvent("erp-forgery:server:ForgeWeapon")
AddEventHandler("erp-forgery:server:ForgeWeapon", function(firstname,lastname,birthday)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.WeaponCost then
        info = {}
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ss.WeaponsItem], 'add')
        Player.Functions.AddItem(ss.WeaponsItem, 1, nil, info)

        Player.Functions.RemoveMoney("cash", Config.WeaponCost)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)

RegisterServerEvent("erp-forgery:server:ForgeLawyerpass")
AddEventHandler("erp-forgery:server:ForgeLawyerpass", function(passid,firstname,lastname, citizenid)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.WeaponCost then
        info = {}
        info.id = passid
        info.firstname = firstname
        info.lastname = lastname
        info.citizenid = citizenid

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ss.LawyerpassItem], 'add')
        Player.Functions.AddItem(ss.LawyerpassItem, 1, nil, info)

        Player.Functions.RemoveMoney("cash", Config.WeaponCost)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)