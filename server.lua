local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('kuban_scoreboard:fetchData', function()
    local src = source
    local players = GetNumPlayerIndices()
    local playerId = src
    local jobCounts = { police = 0, ambulance = 0, phoenixcustoms = 0, mechanic = 0 }
    for _, player in pairs(GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(tonumber(player))
        if Player then
            local jobName = Player.PlayerData.job.name
            if jobCounts[jobName] ~= nil then
                jobCounts[jobName] = jobCounts[jobName] + 1
            end
        end
    end
    local function getJobStatus(count)
        if count == 0 then return "None"
        elseif count <= 3 then return "Very Low"
        elseif count <= 6 then return "Low"
        elseif count <= 8 then return "Medium"
        elseif count <= 12 then return "High"
        else return "Very High" end
    end
    local jobStatuses = {
        police = getJobStatus(jobCounts.police),
        ambulance = getJobStatus(jobCounts.ambulance),
        phoenixcustoms = getJobStatus(jobCounts.phoenixcustoms),
        mechanic = getJobStatus(jobCounts.mechanic)
    }
    TriggerClientEvent('kuban_scoreboard:updateData', src, {
        players = players,
        playerId = playerId,
        jobStatuses = jobStatuses
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
