window.addEventListener("message", function(event) {
    if (event.data.action === "toggle") {
        document.body.style.display = event.data.visible ? "block" : "none";
    } else if (event.data.action === "update") {
        document.getElementById("player-count").innerText = "Players: " + event.data.players;
        document.getElementById("player-id").innerText = "Player ID: " + event.data.playerId;
        document.getElementById("job-rank").innerText = "Your Job & Rank: " + event.data.jobAndRank;
        document.getElementById("police-count").innerText = event.data.police;
        document.getElementById("fire-count").innerText = event.data.fire;
        document.getElementById("medic-count").innerText = event.data.medic;
        document.getElementById("mechanic-count").innerText = event.data.mechanic;
    }
});
