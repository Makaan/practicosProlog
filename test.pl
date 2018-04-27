grid(1, [
    [a,a,c,a],
    [c,a,a,a],
    [a,a,c,b],
    [a,c,c,a]
]).

grid(2, [
    [y,y,b,g,v,y,p,v,b,p,v,p,v,r],
    [y,y,p,p,g,v,v,r,r,b,g,v,p,r],
    [b,y,g,y,b,g,r,g,p,g,p,r,y,y],
    [r,y,y,y,y,p,y,g,r,g,y,v,y,p],
    [y,p,y,v,y,g,g,v,r,b,v,y,r,g],
    [r,b,v,g,b,r,y,p,b,p,y,r,y,y],
    [p,g,v,y,y,r,b,r,v,r,v,y,p,y],
    [b,y,v,g,r,v,r,g,b,y,b,y,p,g],
    [r,b,b,v,g,v,p,y,r,v,r,y,p,g],
    [v,b,g,v,v,r,g,y,b,b,b,b,r,y],
    [v,v,b,r,p,b,g,g,p,p,b,y,v,p],
    [r,p,g,y,v,y,r,b,v,r,b,y,r,v],
    [r,b,b,v,p,y,p,r,b,g,p,y,b,r],
    [v,g,p,b,v,v,g,g,g,b,v,g,g,g]
    ]).

pintar(CNuevo, ColorEsquina, M, MN):- buscarYPintar(CNuevo, ColorEsquina, 0, 0, M, MN).


buscarYPintar(_, _, X, Y, M, M):- X < 0; X > 4; Y < 0; Y > 4.
buscarYPintar(_, ColorEsquina, X, Y, M, MN):-
    getColorEn(X, Y, ColorEnXY, M),
    ColorEnXY \= ColorEsquina,
    MN = M.

buscarYPintar(CNuevo, ColorEsquina, X, Y, M, MND):- 
    getColorEn(X, Y, ColorEnXY, M),
    ColorEnXY = ColorEsquina, pintarEnPos(CNuevo, X, Y, M, MN),
    XMas is X + 1, buscarYPintar(CNuevo, ColorEsquina, XMas, Y, MN, MNA),
    XMen is X - 1, buscarYPintar(CNuevo, ColorEsquina, XMen, Y, MNA, MNB),
    YMas is Y + 1, buscarYPintar(CNuevo, ColorEsquina, X, YMas, MNB, MNC),
    YMen is Y - 1, buscarYPintar(CNuevo, ColorEsquina, X, YMen, MNC, MND).

%getColorEn(_, _, _, []).
getColorEn(X, 0, Color, [Fila | _]):- getColorEnX(X, Fila, Color).
getColorEn(X, Y, Color, [_ | M]):- YA is Y - 1, getColorEn(X, YA, Color, M).

%getColorEnX(_, [], _).
getColorEnX(0, [Color | _], Color).
getColorEnX(X, [_ | Fila], Color):- XA is X - 1, getColorEnX(XA, Fila, Color).

pintarEnPos(CNuevo, X, 0, [Fila | M], [FilaNueva | M]) :- pintarEnX(CNuevo, X, Fila, FilaNueva).
pintarEnPos(CNuevo, X, Y, [Fila | M], [Fila | MNueva]) :- YA is Y - 1, pintarEnPos(CNuevo, X, YA, M, MNueva).

pintarEnX(CNuevo, 0, [_ | Fila], [CNuevo | Fila]).
pintarEnX(CNuevo, X, [Elem | Fila], [Elem | FilaNueva]):- XA is X - 1, pintarEnX(CNuevo, XA, Fila, FilaNueva). 

/*
buscarYPintar(_, _, 13, 0, M, M):- !.
buscarYPintar(ColorNuevo, ColorActual, X, Y, M, MND):- 
    buscarFila(ColorNuevo, ColorActual, X, Y, M, MN),    
    XMas is X + 1, buscarYPintar(ColorNuevo, ColorActual, XMas, Y, MN, MNA),
    YMas is Y + 1, buscarYPintar(ColorNuevo, ColorActual, X, YMas, MNA, MND).
    %XMenos is X - 1, buscarYPintar(ColorNuevo, ColorActual, XMenos, Y, MNB, MNC),
    %YMenos is Y - 1, buscarYPintar(ColorNuevo, ColorActual, X, YMenos, MNC, MND).
    

buscarFila(C, CA, X, 0, [F | Col], [FN | Col]):- pintarColumna(C, CA, X, F, FN).
buscarFila(C, CA, X, Y, [FA | Fs], [FA | FNs]):- Y > 0, NY is Y - 1, buscarFila(C, CA, X, NY, Fs, FNs).

pintarColumna(ColorNuevo, ColorActual, 0, [ColorCol | Col], [ColorNuevo | Col]):- ColorActual = ColorCol.
pintarColumna(_, ColorActual, 0, [ColorCol | Col], [ColorCol | Col]):- ColorActual \= ColorCol, false.
pintarColumna(ColorNuevo, ColorActual, N, [E | Cols], [E | Col]):- N > 0, NA is N-1, pintarColumna(ColorNuevo, ColorActual, NA, Cols, Col).

pintarPos(C, CA, X, Y, M, MR):- buscarFila(C, CA, X, Y, M, MR).
*/
