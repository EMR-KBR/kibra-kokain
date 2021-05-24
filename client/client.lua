ESX                           = nil  
local PlayerData              = {}  

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
      Citizen.Wait(10)
    end
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer    
end)

-- Satıcı Kordinat
local saticikordinat = {
    {751.791, 6458.68, 30.5270,"Kokain Saticisi",66.53,0xC99F21C4,"a_m_y_business_01"},
}

--Toplama
Citizen.CreateThread(function()
    while true do
        local sleep = 7
        local ped = PlayerPedId()
        local playercoords = GetEntityCoords(ped)
        local dst = GetDistanceBetweenCoords(playercoords, Config.KokainTopla.x, Config.KokainTopla.y, Config.KokainTopla.z, true)
        if dst < 1 then
            sleep = 7
            DrawMarker(20, Config.KokainTopla.x, Config.KokainTopla.y, Config.KokainTopla.z + 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 100, false, true, 1, nil, nil, false)
            ESX.ShowHelpNotification('~INPUT_CONTEXT~ basarak Kokain Topla')
            if IsControlJustReleased(0, 38) then 
                exports['mythic_progbar']:Progress({
                    name = "kokaintopla",
                    duration = 5000,
                    label = 'Kokain Toplanıyor...',
                    useWhileDead = true,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    animation = {
                        animDict = "missheistdockssetup1clipboard@idle_a",
                        anim = "idle_a",
                    },
                    prop = {
                        model = "prop_paper_bag_small",
                    }
                }, function(cancelled)
                    if not cancelled then
                        -- Do Something If Action Wasn't Cancelled
                    else
                        -- Do Something If Action Was Cancelled
                    end
                end)
                Citizen.Wait(5000)
                TriggerServerEvent('kibra-kokain:kokainTopla')
            end
            end
        Citizen.Wait(sleep)
    end
end)

-- Ayrıştırma
Citizen.CreateThread(function()
    while true do
        local sleep = 7
        local ped = PlayerPedId()
        local playercoords = GetEntityCoords(ped)
        local dst1 = GetDistanceBetweenCoords(playercoords, Config.KokainAyristir.x, Config.KokainAyristir.y, Config.KokainAyristir.z, true)
        if dst1 < 1 then
            sleep = 7
            DrawMarker(20, Config.KokainAyristir.x, Config.KokainAyristir.y, Config.KokainAyristir.z + 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 100, false, true, 1, nil, nil, false)
            ESX.ShowHelpNotification('~INPUT_CONTEXT~ basarak Kokain Ayrıştır')
            if IsControlJustReleased(0, 38) then 
                exports['mythic_progbar']:Progress({
                    name = "kokainayristir",
                    duration = 5000,
                    label = 'Kokain Ayrıştırılıyor...',
                    useWhileDead = true,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    animation = {
                        animDict = "missheistdockssetup1clipboard@idle_a",
                        anim = "idle_a",
                    },
                    prop = {
                        model = "prop_paper_bag_small",
                    }
                }, function(cancelled)
                    if not cancelled then
                        -- Do Something If Action Wasn't Cancelled
                    else
                        -- Do Something If Action Was Cancelled
                    end
                end)
                Citizen.Wait(5000)
                TriggerServerEvent('kibra-kokain:kokainAyristir')
            end
            end
        Citizen.Wait(sleep)
    end
end)

-- Kurutma
Citizen.CreateThread(function()
    while true do
        local sleep = 7
        local ped = PlayerPedId()
        local playercoords = GetEntityCoords(ped)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.KokainKurutma.x, Config.KokainKurutma.y, Config.KokainKurutma.z, true)
        if dst2 < 1 then
            sleep = 7
            DrawMarker(20, Config.KokainKurutma.x, Config.KokainKurutma.y, Config.KokainKurutma.z + 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 100, false, true, 1, nil, nil, false)
            ESX.ShowHelpNotification('~INPUT_CONTEXT~ basarak Kokain Kurut')
            if IsControlJustReleased(0, 38) then 
                exports['mythic_progbar']:Progress({
                    name = "kokainkurut",
                    duration = 5000,
                    label = 'Kokain Kurutuluyor...',
                    useWhileDead = true,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    animation = {
                        animDict = "missheistdockssetup1clipboard@idle_a",
                        anim = "idle_a",
                    },
                    prop = {
                        model = "prop_paper_bag_small",
                    }
                }, function(cancelled)
                    if not cancelled then
                        -- Do Something If Action Wasn't Cancelled
                    else
                        -- Do Something If Action Was Cancelled
                    end
                end)
                Citizen.Wait(5000)
                TriggerServerEvent('kibra-kokain:kokainKurut')
            end
            end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 7
        local ped = PlayerPedId()
        local playercoords = GetEntityCoords(ped)
        local dst3 = GetDistanceBetweenCoords(playercoords, Config.KokainPaketleme.x, Config.KokainPaketleme.y, Config.KokainPaketleme.z, true)
        if dst3 < 1 then
            sleep = 7
            DrawMarker(20, Config.KokainPaketleme.x, Config.KokainPaketleme.y, Config.KokainPaketleme.z + 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 100, false, true, 1, nil, nil, false)
            ESX.ShowHelpNotification('~INPUT_CONTEXT~ Kokain Paketle')
            if IsControlJustReleased(0, 38) then 
                exports['mythic_progbar']:Progress({
                    name = "kokainkurut",
                    duration = 15000,
                    label = 'Kokain Paketleniyor...',
                    useWhileDead = true,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    animation = {
                        animDict = "missheistdockssetup1clipboard@idle_a",
                        anim = "idle_a",
                    },
                    prop = {
                        model = "prop_paper_bag_small",
                    }
                }, function(cancelled)
                    if not cancelled then
                        -- Do Something If Action Wasn't Cancelled
                    else
                        -- Do Something If Action Was Cancelled
                    end
                end)
                Citizen.Wait(15000)
                TriggerServerEvent('kibra-kokain:kokainPaketle')
            end
            end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_m_y_bevhills_01"))
    while not HasModelLoaded(GetHashKey("a_m_y_bevhills_01")) do
        Wait(1)
    end
    npc = CreatePed(1, GetHashKey("a_m_y_bevhills_01"), Config.Satici.x, Config.Satici.y, Config.Satici.z, Config.heading, false, true)
    SetPedCombatAttributes(npc, 46, true)               
    SetPedFleeAttributes(npc, 0, 0)               
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)



Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        Citizen.Wait(0)
        for _,v in pairs(saticikordinat) do
            x = v[1]
            y = v[2]
            z = v[3]
            if(Vdist(pos.x, pos.y, pos.z, x, y, z) < 20.0)then
                DrawText3D(x,y,z+2.10, "~g~"..v[4], 1.2, 1)
                DrawText3D(x,y,z+1.95, "~w~[E] Basarak Konus", 1.0, 1)
               if  IsControlJustReleased(0, 38) then
                exports['mythic_progbar']:Progress({
                    name = "kokainsat",
                    duration = 10000,
                    label = 'Kokain Satılıyor...',
                    useWhileDead = true,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    animation = {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                    },
                    prop = {
                        model = "prop_weed_bottle",
                    }
                }, function(cancelled)
                    if not cancelled then
                        -- Do Something If Action Wasn't Cancelled
                    else
                        -- Do Something If Action Was Cancelled
                    end
                end)
                Citizen.Wait(10000)
                TriggerServerEvent('kibra-kokain:kokainSat')
                  
               end
            end
        end
    end
end)

function DrawText3D(x,y,z, text, scl, font) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 10, 255, 215)
		SetTextDropshadow(0)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

-- Kokain
Citizen.CreateThread(function()
    if Config.KokainBlip then
      local blip = AddBlipForCoord(Config.KokainTopla.x, Config.KokainTopla.y, Config.KokainTopla.z)
      SetBlipSprite(blip, 140)
      SetBlipDisplay(blip, 4)
      SetBlipScale(blip, 0.6)
      SetBlipColour(blip, 1)
      SetBlipAsShortRange(blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString('Kokain')
      EndTextCommandSetBlipName(blip)
    end
end)


-- Satıcı Blip
Citizen.CreateThread(function()
    if Config.SaticiBlip then
      local blip = AddBlipForCoord(Config.Satici.x, Config.Satici.y, Config.Satici.z)
      SetBlipSprite(blip, 437)
      SetBlipDisplay(blip, 4)
      SetBlipScale(blip, 0.6)
      SetBlipColour(blip, 3)
      SetBlipAsShortRange(blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString('Kokain Satıcısı')
      EndTextCommandSetBlipName(blip)
    end
end)







