// Reference to object provided by pengineGrids.js library which interfaces with pengineGrids server (Prolog-engine)
// by making query requests and receiving answers.
var pengineGrid;
var pengineAyudaUnaJugada;
var pengineAyudaDosJugadas;
// Bidimensional array representing grid configuration.
var gridData;
// Bidimensional array with grid cells elements.
var cellElems = null;
// Number of turns
var turns = -1;
// Reference to element displaying turns
var turnsElem;

/**
 * Representation of color enumerate as object where each property key defines an enum value (a color), and the
 * associated property value (the string) defines the color name.
 *
 * Values: RED, VIOLET, PINK, GREEN, BLUE, YELLOW
 */

const colors = Object.freeze({
    RED: "red",
    VIOLET: "violet",
    PINK: "pink",
    GREEN: "green",
    BLUE: "blue",
    YELLOW: "yellow"
});

/*
 * Returns the Prolog representation of the received color
 */

function colorToProlog(color) {
    return colors[color].charAt(0);
}

function colorsToProlog() {
    var toReturn = ["r", "v", "p", "g", "b", "y"];
    return toReturn;
}

/*
 * Returns the color in colors enum associated to pColor, in Prolog representation.
 */

function colorFromProlog(pColor) {
    for (let color in colors) {
        if (colorToProlog(color) == pColor)
            return color;
    }
    return null;
}

/*
 * Returns the CSS representation of the received color.
 */

function colorToCss(color) {
    return colors[color];
}

/**
 * Initialization function. Requests to server, through pengineGrids.js library, 
 * the creation of a pengineGrid instance, which will run Prolog code server-side.
 */

function init() {
    turnsElem = document.getElementById("turnsNum");
    pengineGrid = new Pengine({
        server: "http://localhost:3030/pengine",
        application: "proylcc",
        oncreate: handleCreate,
        onsuccess: handleSuccess,
        destroy: false
    });
    pengineAyudaUnaJugada = new Pengine({
        server: "http://localhost:3030/pengine",
        application: "proylcc",
        onsuccess: handleSuccessAyudaUnaJugada,
        destroy: false
    });
    pengineAyudaDosJugadas = new Pengine({
        server: "http://localhost:3030/pengine",
        application: "proylcc",
        onsuccess: handleSuccessAyudaDosJugadas,
        destroy: false
    });


    var buttonsPanelElem = document.getElementById("buttonsPanel");

    for (let color in colors) {
        var buttonElem = document.createElement("button");
        buttonElem.classList.add("colorBtn");
        buttonElem.style.backgroundColor = colorToCss(color);
        buttonElem.addEventListener("click", function(e) {
            handleColorClick(color);
        });
        buttonsPanelElem.appendChild(buttonElem);
    }

}

/**
 * Callback for pengineGrid server creation
 */

function handleCreate() {
    pengineGrid.ask('grid(1, Grid)');
    ayudaUnaJugada();
    ayudaDosJugadas();
}

/**
 * Callback for successful response received from pengineGrids server
 */

function handleSuccess(response) {
    gridAct = response.data[0].Grid;

    turns++;
    if (cellElems == null) {
        createGridElems(gridAct.length, gridAct[0].length);
        gridData = gridAct;
    }

    for (let row = 0; row < gridData.length; row++)
        for (let col = 0; col < gridData[row].length; col++) {
            cellElems[row][col].classList.remove("color-" + colorFromProlog(gridData[row][col]));
            cellElems[row][col].classList.remove("animacion");
            gridData[row][col] = gridAct[row][col];
            cellElems[row][col].classList.add("color-" + colorFromProlog(gridData[row][col]));
            $(cellElems[row][col]).addClass('animacion');
            setTimeout(function() {
                $(cellElems[row][col]).removeClass('animacion');
            }, 800);
        }


    turnsElem.innerHTML = turns;
    ayudaUnaJugada();
    ayudaDosJugadas();

}

function handleSuccessAyudaUnaJugada(response) {
    console.log(response.data[0].Ayuda[0]);
    $("#cuadrosPintadosUnaJugada").empty();
    var arrColores = response.data[0].Ayuda;
    console.log(arrColores);
    for (color of arrColores) {
        console.log(color.args[1]);
        if (color.args[1] != gridData[0][0]) {
            var buttonElem = document.createElement("button");
            buttonElem.innerHTML = color.args[0];
            buttonElem.className = "colorBtn";
            buttonElem.style.marginRight = 5;
            buttonElem.style.backgroundColor = colorToCss(colorFromProlog(color.args[1]));
        }

        $("#cuadrosPintadosUnaJugada").append(buttonElem);
    }

}

function handleSuccessAyudaDosJugadas(response) {
    var color1 = colorFromProlog(response.data[0].Ayuda.args[1].args[0]);
    var color2 = colorFromProlog(response.data[0].Ayuda.args[1].args[1]);
    $("#cantCuadrosDosJugadas").text(response.data[0].Ayuda.args[0]);
    $("#btnDosJugadas1").css("backgroundColor", color1);
    $("#btnDosJugadas2").css("backgroundColor", color2);
}

/**
 * Create grid cells elements
 */

function createGridElems(numOfRows, numOfCols) {
    var gridElem = document.getElementById("grid");
    cellElems = [];
    for (let row = 0; row < numOfRows; row++) {
        cellElems[row] = [];
        for (let col = 0; col < numOfCols; col++) {
            var cellElem = document.createElement("div");
            cellElem.classList.add("colorBtn")
            gridElem.appendChild(cellElem);
            cellElems[row][col] = cellElem;
        }
    }
}

/**
 * Handler for color click. Ask query to pengineGrids server.
 */

function handleColorClick(color) {
    var s = "flick(" + Pengine.stringify(gridData) + "," + colorToProlog(color) + ",Grid)";
    console.log(s);
    pengineGrid.ask(s);
}

function ayudaUnaJugada() {
    pengineAyudaUnaJugada.ask("ayuda(" + Pengine.stringify(gridData) + "," + Pengine.stringify(colorsToProlog()) + ",Ayuda)");
}

function ayudaDosJugadas() {
    pengineAyudaDosJugadas.ask("ayudaDosJugadas(" + Pengine.stringify(gridData) + "," + Pengine.stringify(colorsToProlog()) + ",Ayuda)");
}

function abrirSideNav() {
    M.Sidenav.getInstance(document.querySelector(".sidenav")).open();
}

function cambiarGrilla(n) {
    pengineGrid.ask('grid(' + n + ', Grid)');
    M.Sidenav.getInstance(document.querySelector(".sidenav")).close();
}





/**
 * Call init function after window loaded to ensure all HTML was created before
 * accessing and manipulating it.
 */

window.onload = init;

$(document).ready(function() {
    $('.sidenav').sidenav();
    $('.collapsible').collapsible();
});