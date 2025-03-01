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
        police = data.police,
        fire = data.fire,
        medic = data.medic,
        mechanic = data.mechanic,
        playerId = data.playerId,
        jobAndRank = data.jobAndRank
    })
end)
