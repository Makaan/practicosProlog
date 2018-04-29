grid(1, [
    [a,a,c,a],
    [c,a,a,a],
    [a,a,c,b],
    [a,c,c,a]
]).

grid(3, [
    [n,a,c,e],
    [w,a,a,a],
    [a,a,d,b],
    [a,f,c,a]
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

flick(Grid,Color,FGrid):-
    Grid = [F|_],
    F = [X|_],
    pintar(Color, X, 0, 0, Grid, FGrid).

pintar(_, _, X, Y, M, M):- 
    X < 0;
    X > 13; 
    Y < 0; 
    Y > 13.

pintar(_, ColorEsquina, X, Y, M, M):-
    getColorEn(X, Y, ColorEnXY, M),
    ColorEnXY \= ColorEsquina, !.

pintar(CNuevo, ColorEsquina, X, Y, M, MND):- 
    getColorEn(X, Y, ColorEnXY, M),
    ColorEnXY = ColorEsquina, pintarEnPos(CNuevo, X, Y, M, MN),
    XMas is X + 1, pintar(CNuevo, ColorEsquina, XMas, Y, MN, MNA),
    XMen is X - 1, pintar(CNuevo, ColorEsquina, XMen, Y, MNA, MNB),
    YMas is Y + 1, pintar(CNuevo, ColorEsquina, X, YMas, MNB, MNC),
    YMen is Y - 1, pintar(CNuevo, ColorEsquina, X, YMen, MNC, MND).

%getColorEn(_, _, _, []).
getColorEn(X, 0, [Fila | _], Color):- getColorEnX(X, Fila, Color).
getColorEn(X, Y, [_ | M], Color):- Y >= 0, Y < 14, YA is Y - 1, getColorEn(X, YA, M, Color).

%getColorEnX(_, [], _).
getColorEnX(0, [Color | _], Color).
getColorEnX(X, [_ | Fila], Color):- XA is X - 1, getColorEnX(XA, Fila, Color).

pintarEnPos(CNuevo, X, 0, [Fila | M], [FilaNueva | M]) :- pintarEnX(CNuevo, X, Fila, FilaNueva).
pintarEnPos(CNuevo, X, Y, [Fila | M], [Fila | MNueva]) :- YA is Y - 1, pintarEnPos(CNuevo, X, YA, M, MNueva).

pintarEnX(CNuevo, 0, [_ | Fila], [CNuevo | Fila]).
pintarEnX(CNuevo, X, [Elem | Fila], [Elem | FilaNueva]):- XA is X - 1, pintarEnX(CNuevo, XA, Fila, FilaNueva). 

difMatrices([], [], 0).
difMatrices([FA | MA], [FB | MB], NR):- difFilas(FA, FB, NF), difMatrices(MA, MB, NM), NR is NM + NF.

difFilas([], [], 0).
difFilas([A | FA], [B | FB], N):- difFilas(FA, FB, NF) ,A \= B, N is NF + 1.
difFilas([A | FA], [A | FB], N):- difFilas(FA, FB, N).

borde(_, _, X, Y, _, _):-
    X < 0;
    X > 3; 
    Y < 0; 
    Y > 3.

borde(CNuevo, ColorAct, X, Y, M, N):- getColorEn(X, Y, M, ColorEnXY),
        ColorEnXY = ColorAct,
        XMas is X + 1, borde(CNuevo, ColorAct, XMas, Y, M, NA),
        XMen is X - 1, borde(CNuevo, ColorAct, XMen, Y, M, NB),
        YMas is Y + 1, borde(CNuevo, ColorAct, X, YMas, M, NC),
        YMen is Y - 1, borde(CNuevo, ColorAct, X, YMen, M, ND),
        N is NA + NB + NC + ND.

borde(CNuevo, ColorAct, X, Y, M, N):- getColorEn(X, Y, M, ColorEnXY),
    ColorEnXY = CNuevo,
    XMas is X + 1, borde(CNuevo, ColorAct, XMas, Y, M, NA),
    XMen is X - 1, borde(CNuevo, ColorAct, XMen, Y, M, NB),
    YMas is Y + 1, borde(CNuevo, ColorAct, X, YMas, M, NC),
    YMen is Y - 1, borde(CNuevo, ColorAct, X, YMen, M, ND),
    N is NA + NB + NC + ND + 1.
    

borde(_, ColorAct, X, Y, M, 0):- getColorEn(X, Y, M, ColorEnXY),
    ColorEnXY \= ColorAct.

ayuda(_, [], []).
ayuda(Grid, [Color | LC], [NColor | LN]):- 
    Grid = [Fila | _],
    Fila = [X | _],
    borde(Color, X, 0, 0, Grid, NColor),
    ayuda(Grid, LC, LN).