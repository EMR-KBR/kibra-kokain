ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)
		print('[^2kibra:kokain^0] - ^1Baslatildi^0')
	end
end)

RegisterServerEvent('kibra-kokain:kokainTopla')
AddEventHandler('kibra-kokain:kokainTopla', function ()
    local src = source
    local oyuncu = ESX.GetPlayerFromId(src)
     if oyuncu.canCarryItem('hamkokain', 1) then
      oyuncu.addInventoryItem('hamkokain', 1)
      TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '1 Tane Kokain Elde Ettiniz.', length = 2500})
     else 
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Envanteriniz dolu!', length = 2500})
     end
end)

RegisterServerEvent('kibra-kokain:kokainAyristir')
AddEventHandler('kibra-kokain:kokainAyristir', function ()
    local src = source 
    local oyuncu = ESX.GetPlayerFromId(src)
    if oyuncu.getInventoryItem('hamkokain').count >= 1 then
    if oyuncu.canCarryItem('hamkokain', 1) then
    oyuncu.removeInventoryItem('hamkokain', 1)
    oyuncu.addInventoryItem('ayristirilmis_kokain', 1)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '1 Tane Kokain ayrıştırdınız.', length = 2500})
    else 
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Envanterinizde Kokain Yok!', length = 2500})
    end
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Envanteriniz dolu!', length = 2500}) 
    end
end)

RegisterServerEvent('kibra-kokain:kokainKurut')
AddEventHandler('kibra-kokain:kokainKurut', function ()
   local src = source
   local oyuncu = ESX.GetPlayerFromId(src)
   if oyuncu.getInventoryItem('ayristirilmis_kokain').count >= 2 then 
    if oyuncu.canCarryItem('ayristirilmis_kokain', 2) then
    oyuncu.removeInventoryItem('ayristirilmis_kokain', 2)
    oyuncu.addInventoryItem('kurutulmus_kokain', 1)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '1 Tane Kokain kuruttunuz.', length = 2500})
   else 
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Envanterinizde Ayrıştırılmış Kokain Yok!', length = 2500})
   end
   else
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Envanteriniz dolu!', length = 2500}) 
   end
end)

RegisterServerEvent('kibra-kokain:kokainPaketle')
AddEventHandler('kibra-kokain:kokainPaketle', function ()
    local src = source 
    local oyuncu = ESX.GetPlayerFromId(src)
    if oyuncu.getInventoryItem('kurutulmus_kokain').count >= 2 then
       if oyuncu.canCarryItem('kurutulmus_kokain', 2) then
        oyuncu.removeInventoryItem('kurutulmus_kokain', 2)
        oyuncu.addInventoryItem('paketlenmis_kokain', 1)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '1 Tane Kokain Paketlediniz', length = 2500})
    else 
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Envanterinizde Kurutulmuş Kokain Yok!', length = 2500})
    end
else
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Envanteriniz dolu!', length = 2500}) 
   end
end)

RegisterServerEvent('kibra-kokain:kokainSat')
AddEventHandler('kibra-kokain:kokainSat', function ()
    local src = source 
    local adsoyad = GetPlayerName(src)
    local oyuncu = ESX.GetPlayerFromId(src) 
    if oyuncu.getInventoryItem('paketlenmis_kokain').count >= 5 then 
       oyuncu.canCarryItem('paketlenmis_kokain', 5) 
        oyuncu.removeInventoryItem('paketlenmis_kokain', 5)
        if Config.KaraPara then 
            oyuncu.addAccountMoney('black_money', Config.Para)
        else 
            oyuncu.addMoney(Config.Para)
        end 
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Kokain Satışı Yaparak '..Config.Para..' kazandınız!', length = 2500})
    else
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Kokain Satabilmek için 5 tane paketlenmiş kokaininiz olmalı!', length = 2500})
end

end)