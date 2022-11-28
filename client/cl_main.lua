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


CreateThread(function()
    exports['qb-target']:AddBoxZone("ForgeryEnter", vector3(-333.5, 6228.77, 31.67), 0.2, 1.0, {
        name="ForgeryEnter",
        heading=315,
        debugPoly=false,
        minZ=24.07,
        maxZ=33.07,
      },{
        options = {
                {
                  type = "client",
                  event = "serrulata-forgery:client:enter",
                  icon = "fa fa-circle",
                  label = "Enter",
                },
             },
        distance = 2.5
        })

        exports['qb-target']:AddBoxZone("ForgeryLeave", vector3(1174.0, -3196.63, -39.01), 0.2, 1.0, {
            name="ForgeryLeave",
            heading=89,
            debugPoly=false,
        },{
            options = {
                    {
                    type = "client",
                    event = "serrulata-forgery:client:leave",
                    icon = "fa fa-circle",
                    label = "Leave",
                    },
             },
        distance = 2.5
        })

        exports['qb-target']:AddBoxZone("ForgeIDMenu", vector3(1169.52, -3196.85, -39.01), 0.4, 0.5, {
            name="ForgeIDMenu",
            heading=290,
            debugPoly=false,
        },{
            options = {
                    {
                    type = "client",
                    event = "serrulata-forgery:client:ForgeIDMenu",
                    icon = "fa fa-circle",
                    label = "Forge ID Menu",
                    },
             },
        distance = 2.5
        })
end)

RegisterNetEvent('serrulata-forgery:client:ForgeIDMenu', function() 
    exports['qb-menu']:openMenu({
        {
            header = "Forge ID",
            isMenuHeader = true
        },
        {
            header = "Forge ID",
            txt = ' $50000 to manufacture forged identity',
            params = {
                event = "serrulata-forgery:client:ForgeIDCard",
            }
        },
        {
            header = "Forge Drivers Licence",
            txt = ' $50000 to manufacture forged identity',
            params = {
                event = "serrulata-forgery:client:ForgeDrivers",
            }
        },
        {
            header = "Forge Weapons Licence",
            txt = ' $50000 to manufacture forged identity',
            params = {
                event = "serrulata-forgery:client:ForgeWeapon",
            }
        },
        {
            header = "Forge Lawyerpass",
            txt = ' $50000 to manufacture forged identity',
            params = {
                event = "serrulata-forgery:client:ForgeLawyerpass",
            }
        },
    })

end)

RegisterNetEvent('serrulata-forgery:client:enter', function(source)
    local Ped = PlayerPedId()
    local PlayerCoords = GetEntityCoords(Ped)
    if not IsPedInAnyVehicle(Ped, false) then
        DoScreenFadeOut(1000)
        Wait(1500)
        SetEntityCoords(Ped, 1173.54, -3196.63, -39.01, 100.64)
        DoScreenFadeIn(1000)
    else
        QBCore.Functions.Notify("You cannot enter while in a vehicle.")
    end
end)

RegisterNetEvent('serrulata-forgery:client:leave', function(source)
    local Ped = PlayerPedId()
    local PlayerCoords = GetEntityCoords(Ped)
    if not IsPedInAnyVehicle(Ped, false) then
        DoScreenFadeOut(1000)
        Wait(1500)
        SetEntityCoords(Ped, -333.5, 6228.77, 31.67, 315)
        DoScreenFadeIn(1000)

    else
        QBCore.Functions.Notify("You cannot leave while in a vehicle.")
    end
end)

RegisterNetEvent('serrulata-forgery:client:ForgeIDCard', function(source)
    local dialog = exports['qb-input']:ShowInput({
        header = "Forge an ID",
        info = "",
        submitText = "Forge ID",
        inputs = {
            {
                text = "Citizen ID",
                name = "citizenid",
                type = "text",
                isRequired = true
            },
            {
                text = "First Name",
                name = "firstname",
                type = "text",
                isRequired = true
            },
            {
                text = "Last Name",
                name = "lastname",
                type = "text",
                isRequired = true
            },
            {
                text = "Date of Birth (YYYY-MM-DD)",
                name = "birthday",
                type = "text",
                isRequired = true
            },
            {
                text = "Nationality",
                name = "nationality",
                type = "text",
                isRequired = true
            }
        },
    })

    if dialog ~= nil then
        for k,v in pairs(dialog) do
            local citizenid = (dialog['citizenid'])
            local firstname = (dialog['firstname'])
            local lastname = (dialog['lastname'])
            local birthday = (dialog['birthday'])
            local nationality = (dialog['nationality']) 

            QBCore.Functions.Progressbar('forge_docs', 'Forging License...', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'anim@gangops@facility@servers@',
                anim = 'hotwire',
                flags = 16,
            }, {}, {}, function() -- Play When Done
                TriggerServerEvent("serrulata-forgery:server:ForgeIDCard",citizenid, firstname, lastname, birthday, nationality)
            end, function() -- Play When Cancel
                --Stuff goes here
            end)
        end
    end
end, false)

RegisterNetEvent('serrulata-forgery:client:ForgeDrivers', function(source)
    local dialog = exports['qb-input']:ShowInput({
        header = "Forge a Drivers License",
        info = "",
        submitText = "Forge License",
        inputs = {
            {
                text = "First Name",
                name = "firstname",
                type = "text",
                isRequired = true
            },
            {
                text = "Last Name",
                name = "lastname",
                type = "text",
                isRequired = true
            },
            {
                text = "Date of Birth (YYYY-MM-DD)",
                name = "birthday",
                type = "text",
                isRequired = true
            },
            {
                text = "Nationality",
                name = "nationality",
                type = "text",
                isRequired = true
            }
        },
    })

    if dialog ~= nil then
        for k,v in pairs(dialog) do
            local citizenid = tostring(QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(5)):upper()
            local firstname = (dialog['firstname'])
            local lastname = (dialog['lastname'])
            local birthday = (dialog['birthday'])
            
        QBCore.Functions.Progressbar('forge_docs', 'Forging License...', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'anim@gangops@facility@servers@',
            anim = 'hotwire',
            flags = 16,
        }, {}, {}, function() -- Play When Done
            TriggerServerEvent("serrulata-forgery:server:ForgeDrivers", firstname, lastname, birthday)
        end, function() -- Play When Cancel
            --Stuff goes here
        end)
        end
    end
end, false)

RegisterNetEvent('serrulata-forgery:client:ForgeWeapon', function(source)
    local dialog = exports['qb-input']:ShowInput({
        header = "Forge a Weapons License",
        submitText = "Forge License",
        info = "",
        inputs = {
            {
                text = "First Name",
                name = "firstname",
                type = "text",
                isRequired = true
            },
            {
                text = "Last Name",
                name = "lastname",
                type = "text",
                isRequired = true
            },
            {
                text = "Date of Birth (YYYY-MM-DD)",
                name = "birthday",
                type = "text",
                isRequired = true
            },
        },
    })

    if dialog ~= nil then
        for k,v in pairs(dialog) do
            local citizenid = tostring(QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(5)):upper()
            local firstname = (dialog['firstname'])
            local lastname = (dialog['lastname'])
            local birthday = (dialog['birthday'])
            

        QBCore.Functions.Progressbar('forge_docs', 'Forging License...', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'anim@gangops@facility@servers@',
            anim = 'hotwire',
            flags = 16,
        }, {}, {}, function() -- Play When Done
            TriggerServerEvent("serrulata-forgery:server:ForgeWeapon", firstname, lastname, birthday)
        end, function() -- Play When Cancel
            --Stuff goes here
        end)
        end
    end
end, false)

RegisterNetEvent('serrulata-forgery:client:ForgeLawyerpass', function(source)
    local dialog = exports['qb-input']:ShowInput({
        header = "Forge a Lawyerpass",
        submitText = "Forge License",
        info = "",
        inputs = {
            {
                text = "Citizen ID",
                name = "citizenid",
                type = "text",
                isRequired = true
            },
            {
                text = "First Name",
                name = "firstname",
                type = "text",
                isRequired = true
            },
            {
                text = "Last Name",
                name = "lastname",
                type = "text",
                isRequired = true
            },
        },
    })

    if dialog ~= nil then
        for k,v in pairs(dialog) do
            local passid = tostring(QBCore.Shared.RandomInt(8)):upper()
            local firstname = (dialog['firstname'])
            local lastname = (dialog['lastname'])
            local citizenid = (dialog['citizenid'])
        
        QBCore.Functions.Progressbar('forge_docs', 'Forging License...', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'anim@gangops@facility@servers@',
            anim = 'hotwire',
            flags = 16,
        }, {}, {}, function() -- Play When Done
            TriggerServerEvent("serrulata-forgery:server:ForgeLawyerpass", passid, firstname, lastname, citizenid)
        end, function() -- Play When Cancel
            --Stuff goes here
        end)
        end
    end
end, false)