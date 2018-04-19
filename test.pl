grid(1, [
    [a,a,c,a],
    [c,a,a,a],
    [a,a,c,b],
    [a,c,c,a]
]).

pintar(CNuevo, ColorEsquina, M, MN):- buscarYPintar(CNuevo, ColorEsquina, 0, 0, M, MN).

buscarYPintar(_, _, X, Y, M, M):- X < 0; X >= 4; Y < 0; Y >= 4, !.
buscarYPintar(ColorNuevo, ColorActual, X, Y, M, MND):- 
    buscarFila(ColorNuevo, ColorActual, X, Y, M, MN),
    XMas is X + 1, buscarYPintar(ColorNuevo, ColorActual, XMas, Y, MN, MNA),
    YMas is Y + 1, buscarYPintar(ColorNuevo, ColorActual, X, YMas, MNA, MND).
    %XMenos is X - 1, buscarYPintar(ColorNuevo, ColorActual, XMenos, Y, MNB, MNC),
    %YMenos is Y - 1, buscarYPintar(ColorNuevo, ColorActual, X, YMenos, MNC, MND).
    

buscarFila(C, CA, X, 0, [F | Col], [FN | Col]):- pintarColumna(C, CA, X, F, FN).
buscarFila(C, CA, X, Y, [FA | Fs], [FA | FNs]):- Y > 0, NY is Y - 1, buscarFila(C, CA, X, NY, Fs, FNs).

pintarColumna(ColorNuevo, ColorActual, 0, [ColorCol | Col], [ColorNuevo | Col]):- ColorActual = ColorCol.
pintarColumna(ColorNuevo, ColorActual, N, [E | Cols], [E | Col]):- N > 0, NA is N-1, pintarColumna(ColorNuevo, ColorActual, NA, Cols, Col).

pintarPos(C, CA, X, Y, M, MR):- buscarFila(C, CA, X, Y, M, MR).