local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('kuban_scoreboard:fetchData', function()
    local src = source
    local players = GetNumPlayerIndices()
    local police, fire, medic, mechanic = 0, 0, 0, 0
    local Player = QBCore.Functions.GetPlayer(src)
    local playerId = src
    local job = Player and Player.PlayerData.job.label or "Unemployed"
    local jobRank = Player and (Player.PlayerData.job.grade.label or Player.PlayerData.job.grade.name) or "None"
    local jobAndRank = job .. " - " .. jobRank
    for _, player in pairs(GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(tonumber(player))
        if Player then
            local jobName = Player.PlayerData.job.name

            if jobName == "police" then police = police + 1
            elseif jobName == "fire" then fire = fire + 1
            elseif jobName == "ambulance" then medic = medic + 1
            elseif jobName == "mechanic" then mechanic = mechanic + 1
            end
        end
    end
    TriggerClientEvent('kuban_scoreboard:updateData', src, {
        players = players,
        police = police,
        fire = fire,
        medic = medic,
        mechanic = mechanic,
        playerId = playerId,
        jobAndRank = jobAndRank 
    })
end)
CreateThread(function()
    while true do
        Wait(1000)
        for _, player in pairs(GetPlayers()) do
            TriggerClientEvent('kuban_scoreboard:fetchData', tonumber(player))
        end
    end
end)
