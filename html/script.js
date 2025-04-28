window.addEventListener("message", function(event) {
    if (event.data.action === "toggle") {
        document.body.style.display = event.data.visible ? "block" : "none";
    } else if (event.data.action === "update") {
        document.getElementById("player-count").innerText = `${event.data.players}/200`;
        document.getElementById("player-id").innerText = event.data.playerId;

        updateStatus("police", event.data.jobStatuses.police);
        updateStatus("ambulance", event.data.jobStatuses.ambulance);
        updateStatus("phoenixcustoms", event.data.jobStatuses.phoenixcustoms);
        updateStatus("mechanic", event.data.jobStatuses.mechanic);
    }
});

function updateStatus(job, status) {
    let statusElement = document.getElementById(job + "-status");
    let barElement = document.getElementById(job + "-bar");

    statusElement.innerText = status;

    let statusClass = "none";
    if (status === "Very Low") statusClass = "very-low";
    else if (status === "Low") statusClass = "low";
    else if (status === "Medium") statusClass = "medium";
    else if (status === "High") statusClass = "high";
    else if (status === "Very High") statusClass = "very-high";

    statusElement.className = "status " + statusClass;
    barElement.className = "status-bar bar-" + statusClass;
}
