local scoreboardVisible = false
local function ToggleScoreboard()
    scoreboardVisible = not scoreboardVisible
    SendNUIMessage({ action = "toggle", visible = scoreboardVisible })

    if scoreboardVisible then
        TriggerServerEvent('kuban_scoreboard:fetchData')
    end
end

RegisterCommand("scoreboard", function()
    ToggleScoreboard()
end, false)

RegisterKeyMapping("scoreboard", "Toggle Scoreboard", "keyboard", "HOME")

RegisterNetEvent('kuban_scoreboard:updateData', function(data)
    SendNUIMessage({
        action = "update",
        players = data.players,
        playerId = data.playerId,
        jobStatuses = data.jobStatuses
    })
end)
