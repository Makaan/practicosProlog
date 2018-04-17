grid(1, [
    [a,a,c],
    [a,a,c],
    [a,a,c]
]).

pintar(CNuevo, ColorEsquina, M, MN):- buscarYPintar(CNuevo, ColorEsquina, 0, 0, M, MN).


buscarYPintar(ColorNuevo, ColorActual, X, Y, M, MNA):- pintarPos(ColorNuevo, ColorActual, X, Y,  M, MN), XMas is X + 1, buscarYPintar(ColorNuevo, ColorActual, XMas, Y, MN, MNA).

buscarFila(C, CA, X, 0, [F | Col], [FN | Col]):- pintarColumna(C, CA, X, F, FN).
buscarFila(C, CA, X, Y, [FA | Fs], [FA | FNs]):- Y > 0, NY is Y - 1, buscarFila(C, CA, X, NY, Fs, FNs).

pintarColumna(ColorNuevo, ColorActual, 0, [ColorCol | Col], [ColorNuevo | Col]):- ColorActual = ColorCol. 
pintarColumna(ColorNuevo, ColorActual, N, [E | Cols], [E | Col]):- N > 0, NA is N-1, pintarColumna(ColorNuevo, ColorActual, NA, Cols, Col).

pintarPos(C, CA, X, Y, M, MR):- buscarFila(C, CA, X, Y, M, MR).