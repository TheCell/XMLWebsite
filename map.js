function init() {
    var buildings = document.getElementsByClassName("building");
    for (var i=0; i < buildings.length; i++) {
        buildings[i].addEventListener("click", buildingClicked);
    }
}

function buildingClicked() {
    alert("Hello World");
}