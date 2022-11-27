local QBCore = exports['qb-core']:GetCoreObject()

-- local firstname = nil
-- local lastname = nil
-- local birthday = nil
-- local gender = nil
-- local nationality = nil
-- local info = {}

-- RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
-- AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
--     isLoggedIn = true
--     PlayerData = QBCore.Functions.GetPlayerData()
-- end)



--               -- // OX_Target Zones // --                    -- 

CreateThread(function()
    exports.ox_target:addSphereZone({
        coords = ss.EnterCoords,
        radius = 1,
        debug = drawZones,
        options = {
            {
                type = "client",
                event = "ss-forgery:client:enter",
                icon = "fa fa-circle",
                label = "Enter",
                canInteract = function(entity, distance, coords, name)
                    return distance < 1
                end
            },
        }
    })
    exports.ox_target:addSphereZone({
        coords = ss.LeaveCoords,
        radius = 1,
        debug = drawZones,
        options = {
            {
                type = "client",
                event = "ss-forgery:client:leave",
                icon = "fa fa-circle",
                label = "Leave",
                canInteract = function(entity, distance, coords, name)
                    return distance < 1
                end
            },
        }
    })
    exports.ox_target:addSphereZone({
        coords = ss.MenuLocation,
        radius = 1,
        debug = drawZones,
        options = {
            {
                type = "client",
                event = "ss-forgery:client:ForgeIDMenu",
                icon = "fa fa-circle",
                label = "Forge ID Menu",
                canInteract = function(entity, distance, coords, name)
                    return distance < 1
                end
            },
        }
    })
end)


lib.registerContext({
    id = 'forge_menu',
    title = 'Forge Menu',
    options = {
        {
            title = 'Forge ID',
            description = 'Manufacture forged identity',
            arrow = true,
            event = 'ss-forgery:client:ForgeID',
            metadata = {
                {label = 'Cost', value = '$' ..ss.ForgeIDPrice},
            }
        },
        {
            title = 'Forge Drivers Licence',
            description = 'Manufacture forged Drivers Licence',
            arrow = true,
            event = 'ss-forgery:client:ForgeDrivers',
            metadata = {
                {label = 'Cost', value = '$' ..ss.ForgeDriversPrice},
            }
        },
        {
            title = 'Forge Weapons Licence',
            description = 'Manufacture forged Weapons Licence',
            arrow = true,
            event = 'ss-forgery:client:ForgeWeapon',
            metadata = {
                {label = 'Cost', value = '$' ..ss.ForgeWeaponsPrice},
            }
        },
        {
            title = 'Forge Lawyerpass',
            description = 'Manufacture forged Lawyerpass',
            arrow = true,
            event = 'ss-forgery:client:ForgeLawyerpass',
            metadata = {
                {label = 'Cost', value = '$' ..ss.ForgeLawyerpassPrice},
            }
        },
        {
            title = 'Forge Business Licence',
            description = 'Manufacture forged Business Licence',
            arrow = true,
            onSelect = function(args)
                if ss.UseHunting == true then
                    TriggerEvent('ss-forgery:client:ForgeBusiness')
                else 
                    lib.notify({
                        title = 'ERROR!',
                        description = 'Business Licence Unavailable',
                        type = 'error'
                    })
                end
            end,
            metadata = {
                {label = 'Cost', value = '$' ..ss.ForgeLawyerpassPrice},

            }
        },
        {
            title = 'Forge Hunting Licence',
            description = 'Manufacture forged Hunting Licence',
            arrow = true,
            onSelect = function(args)
                if ss.UseHunting == true then
                    TriggerEvent('ss-forgery:client:ForgeHunting')
                else 
                    lib.notify({
                        title = 'ERROR!',
                        description = 'Hunting Licence Unavailable',
                        type = 'error'
                    })
                end
            end,
            metadata = {
                {label = 'Cost', value = '$' ..ss.ForgeLawyerpassPrice},

            }
        },
        {
            title = 'Forge Fishing Licence',
            description = 'Manufacture forged Fishing Licence',
            arrow = true,
            onSelect = function(args)
                if ss.UseHunting == true then
                    TriggerEvent('ss-forgery:client:ForgeFishing')
                else 
                    lib.notify({
                        title = 'ERROR!',
                        description = 'Fishing Licence Unavailable',
                        type = 'error'
                    })
                end
            end,
            metadata = {
                {label = 'Cost', value = '$' ..ss.ForgeLawyerpassPrice},

            }
        },
    },
})

--               -- // Debug // --                    -- 
if ss.DebugCommand then
    RegisterCommand('testforge', function()
        local input = lib.inputDialog('Forge my ID', {
            'Citizen ID',
            'First Name',
            'Last Name',
            'Date of Birth (YYYY-MM-DD)',
            'Nationality',
        })
        if not input then return end
        local CitizenID = tonumber(input[1])
        local FirstName = input[2]
        local LastName = input[3]
        local DateofBirth = input[4]
        local Nationality = input[5]
        
        print(CitizenID, FirstName, LastName, DateofBirth, Nationality)
    end)
    print('debug true')
else
    print('debug false')
end

--               -- // Functions // --               -- 

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

local function enterdoor()
    ClearPedSecondaryTask(PlayerPedId())
    loadAnimDict( "anim@heists@keycard@" ) 
    TaskPlayAnim( PlayerPedId(), "anim@heists@keycard@", "exit", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Citizen.Wait(850)
    ClearPedTasks(PlayerPedId())
end

--               -- // Register Events // --               -- 

RegisterNetEvent('ss-forgery:client:enter', function(source)
    local Ped = PlayerPedId()
    local PlayerCoords = GetEntityCoords(Ped)
    if not IsPedInAnyVehicle(Ped, false) then
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.1)
        enterdoor()
        DoScreenFadeOut(1000)
        Wait(1500)
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
        SetEntityCoords(Ped, 1173.54, -3196.63, -39.01, 100.64)
        DoScreenFadeIn(1000)
    else
        QBCore.Functions.Notify("You cannot enter while in a vehicle.")
    end
end)

RegisterNetEvent('ss-forgery:client:leave', function(source)
    local Ped = PlayerPedId()
    local PlayerCoords = GetEntityCoords(Ped)
    if not IsPedInAnyVehicle(Ped, false) then
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.1)
        enterdoor()
        DoScreenFadeOut(1000)
        Wait(1500)
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
        SetEntityCoords(Ped, -333.5, 6228.77, 31.67, 315)
        DoScreenFadeIn(1000)

    else
        QBCore.Functions.Notify("You cannot leave while in a vehicle.")
    end
end)

RegisterNetEvent('ss-forgery:client:ForgeIDMenu', function()
    lib.showContext('forge_menu')
end)

RegisterNetEvent('ss-forgery:client:ForgeID', function(source)
    local input = lib.inputDialog('Forge ID', {
        'Citizen ID',
        'First Name',
        'Last Name',
        'Date of Birth (YYYY-MM-DD)',
        'Nationality',
    })
    if not input then return end
    local citizenid = tonumber(input[1])
    local firstname = input[2]
    local lastname = input[3]
    local birthday = input[4]
    local nationality = input[5]            
    QBCore.Functions.Progressbar("forge_docs", "Forging ID...", (ss.CraftingTime*1000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, 
    {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 49,
    }, {}, function()
        
    end, function()
        TriggerServerEvent("ss-forgery:server:ForgeID",citizenid, firstname, lastname, birthday, nationality)
    end)
end)

RegisterNetEvent('ss-forgery:client:ForgeDrivers', function(source)
    local input = lib.inputDialog('Forge Drivers License', {
        'First Name',
        'Last Name',
        'Date of Birth (YYYY-MM-DD)',
    })
    
    if not input then return end
    local firstname = tonumber(input[1])
    local lastname = input[2]
    local birthday = input[3]
    QBCore.Functions.Progressbar("forge_docs", "Forging License...", (ss.CraftingTime*1000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, 
    {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 49,
    }, {}, function()
        
    end, function()
        TriggerServerEvent("ss-forgery:server:ForgeDrivers", firstname, lastname, birthday)
    end)
end)

RegisterNetEvent('ss-forgery:client:ForgeWeapon', function(source)
    local input = lib.inputDialog('Forge Weapons License', {
        'First Name',
        'Last Name',
        'Date of Birth (YYYY-MM-DD)',
        'Nationality',
    })
    
    if not input then return end
    local firstname = tonumber(input[1])
    local lastname = input[2]
    local birthday = input[3]            
    QBCore.Functions.Progressbar("forge_docs", "Forging License...", (ss.CraftingTime*1000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, 
    {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 49,
    }, {}, function()
        
    end, function()
        TriggerServerEvent("ss-forgery:server:ForgeWeapon", firstname, lastname, birthday)
    end)
end, false)

RegisterNetEvent('ss-forgery:client:ForgeLawyerpass', function(source)
    local input = lib.inputDialog('Forge Lawyerpass', {
        'Citizen ID',
        'First Name',
        'Last Name',
    })
    
    if not input then return end
    local passid = tostring(QBCore.Shared.RandomInt(8)):upper()
    local citizenid = tonumber(input[1])
    local firstname = input[2]
    local lastname = input[3]
    QBCore.Functions.Progressbar("forge_docs", "Forging License...", (ss.CraftingTime*1000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, 
    {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 49,
    }, {}, function()
        
    end, function()
        TriggerServerEvent("ss-forgery:server:ForgeLawyerpass", passid, citizenid, firstname, lastname)
    end)
end)

RegisterNetEvent('ss-forgery:client:ForgeBusinessPass', function(source)
    local input = lib.inputDialog('Forge Business Pass', {
        'Citizen ID',
        'First Name',
        'Last Name',
    })
    
    if not input then return end
    local passid = tostring(QBCore.Shared.RandomInt(8)):upper()
    local citizenid = tonumber(input[1])
    local firstname = input[2]
    local lastname = input[3]
    QBCore.Functions.Progressbar("forge_docs", "Forging License...", (ss.CraftingTime*1000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, 
    {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 49,
    }, {}, function()
        
    end, function()
        TriggerServerEvent("ss-forgery:server:ForgeBusinessPass", passid, citizenid, firstname, lastname)
    end)
end)

RegisterNetEvent('ss-forgery:client:ForgeHunting', function(source)
    local input = lib.inputDialog('Forge Hunting Licence', {
        'Citizen ID',
        'First Name',
        'Last Name',
    })
    
    if not input then return end
    local citizenid = tonumber(input[1])
    local firstname = input[2]
    local lastname = input[3]
    QBCore.Functions.Progressbar("forge_docs", "Forging License...", (ss.CraftingTime*1000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, 
    {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 49,
    }, {}, function()
        
    end, function()
        TriggerServerEvent("ss-forgery:server:ForgeHunting", citizenid, firstname, lastname)
    end)
end)

RegisterNetEvent('ss-forgery:client:ForgeFishing', function(source)
    local input = lib.inputDialog('Forge Fishing Licence', {
        'Citizen ID',
        'First Name',
        'Last Name',
    })
    
    if not input then return end
    local citizenid = tonumber(input[1])
    local firstname = input[2]
    local lastname = input[3]
    QBCore.Functions.Progressbar("forge_docs", "Forging License...", (ss.CraftingTime*1000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, 
    {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 49,
    }, {}, function()
        
    end, function()
        TriggerServerEvent("ss-forgery:server:ForgeFishing", citizenid, firstname, lastname)
    end)
end)