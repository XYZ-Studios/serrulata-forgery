local QBCore = exports['qb-core']:GetCoreObject()


--               -- // Server Events // --                    -- 
RegisterServerEvent("ss-forgery:server:ForgeID", function(citizenid, firstname, lastname, birthday, nationality)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= ss.ForgeIDPrice then
        info = {}
        info.citizenid = citizenid
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = nationality

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ss.IDItem], 'add')
        Player.Functions.AddItem(ss.IDItem, 1, nil, info)

        Player.Functions.RemoveMoney("cash", ss.ForgeIDPrice)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)

RegisterServerEvent("ss-forgery:server:ForgeDrivers", function(firstname,lastname,birthday)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= ss.ForgeDriversPrice then
        info = {}
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday
        info.type = "CLASS G DRIVER LICENSE"

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ss.DriversItem], 'add')
        Player.Functions.AddItem(ss.DriversItem, 1, nil, info)

        Player.Functions.RemoveMoney("cash", ss.ForgeDriversPrice)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)

RegisterServerEvent("ss-forgery:server:ForgeWeapon", function(firstname,lastname,birthday)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= ss.ForgeWeaponsPrice then
        info = {}
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ss.WeaponsItem], 'add')
        Player.Functions.AddItem(ss.WeaponsItem, 1, nil, info)

        Player.Functions.RemoveMoney("cash", ss.ForgeWeaponsPrice)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)

RegisterServerEvent("ss-forgery:server:ForgeLawyerpass", function(passid,firstname,lastname, citizenid)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= ss.ForgeLawyerpassPrice then
        info = {}
        info.id = passid
        info.firstname = firstname
        info.lastname = lastname
        info.citizenid = citizenid

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ss.LawyerpassItem], 'add')
        Player.Functions.AddItem(ss.LawyerpassItem, 1, nil, info)

        Player.Functions.RemoveMoney("cash", ss.ForgeLawyerpassPrice)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)

RegisterServerEvent("ss-forgery:server:ForgeBuinessPass", function(passid,firstname,lastname, citizenid)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= ss.Forgebuinesspass then
        info = {}
        info.id = passid
        info.firstname = firstname
        info.lastname = lastname
        info.citizenid = citizenid

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ss.BusinessItem], 'add')
        Player.Functions.AddItem(ss.BusinessItem, 1, nil, info)

        Player.Functions.RemoveMoney("cash", ss.Forgebuinesspass)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)

RegisterServerEvent("ss-forgery:server:ForgeHunting", function(firstname,lastname, citizenid)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= ss.ForgeHunting then
        info = {}
        info.id = passid
        info.firstname = firstname
        info.lastname = lastname
        info.citizenid = citizenid

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ss.HuntingItem], 'add')
        Player.Functions.AddItem(ss.HuntingItem, 1, nil, info)

        Player.Functions.RemoveMoney("cash", ss.ForgeHuntingPrice)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)

RegisterServerEvent("ss-forgery:server:ForgeFishing", function(firstname,lastname, citizenid)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= ss.ForgeFishing then
        info = {}
        info.id = passid
        info.firstname = firstname
        info.lastname = lastname
        info.citizenid = citizenid

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ss.FishingItem], 'add')
        Player.Functions.AddItem(ss.FishingItem, 1, nil, info)

        Player.Functions.RemoveMoney("cash", ss.ForgeFishingPrice)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)