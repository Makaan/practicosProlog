:- module(proylcc,
	[
		grid/2,
		flick/3
	]).

grid(1, [
		 [y,g,b,g,v,y,p,v,b,p,v,p,v,r],
         [r,r,p,p,g,v,v,r,r,b,g,v,p,r],
         [b,v,g,y,b,g,r,g,p,g,p,r,y,y],
         [r,p,y,y,y,p,y,g,r,g,y,v,y,p],
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

grid(3, [
		 [y,g,b,v,p,r,y,g,b,v,p,r,y,g],
		 [v,b,g,y,r,p,v,b,g,y,r,p,v,b],
		 [p,r,y,g,b,v,p,r,y,g,b,v,p,r],
		 [g,y,r,p,v,b,g,y,r,p,v,b,g,y],
		 [b,v,p,r,y,g,b,v,p,r,y,g,b,v],
		 [r,p,v,b,g,y,r,p,v,b,g,v,r,p],
		 [y,r,b,p,v,g,r,y,p,b,g,v,y,g],
		 [p,p,r,y,p,y,g,y,v,r,y,p,v,b],
		 [b,y,v,r,g,v,r,p,y,b,y,r,y,g],
		 [p,b,y,y,v,y,g,p,r,r,p,y,b,r],
		 [g,y,p,g,r,b,p,g,v,r,b,y,g,y],
		 [r,g,y,r,y,g,r,p,v,b,y,r,y,g],
		 [y,b,r,g,y,b,y,b,g,p,g,r,p,y],
		 [p,r,y,b,v,g,r,y,p,r,v,r,v,b]
		]).

grid(4, [
		[g,y,r,y,r,b,b,p,r,b,v,r,p,v],
		[y,r,b,g,r,v,g,p,b,r,b,r,g,g],
		[g,r,p,r,b,y,g,b,v,y,v,b,r,r],
		[y,p,y,v,g,g,y,b,r,b,y,r,p,y],
		[r,g,r,v,y,y,g,p,b,g,y,g,b,r],
		[v,y,r,y,p,g,b,r,g,v,p,r,p,y],
		[y,r,g,r,y,v,b,g,y,p,y,b,y,r],
		[b,v,b,y,r,y,g,p,y,g,g,v,r,p],
		[b,g,r,p,y,p,b,p,g,y,y,b,r,y],
		[g,y,r,y,r,p,g,v,p,g,p,v,y,r],
		[y,p,v,g,p,v,v,b,r,p,y,b,g,g],
		[r,g,v,r,b,g,y,b,y,b,r,b,b,p],
		[b,r,p,b,y,v,p,g,b,g,b,b,g,y],
		[y,p,g,b,r,p,v,g,v,y,v,r,b,p]
	]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% flick(+Grid, +Color, -FGrid)
%
% FGrid es el resultado de hacer 'flick' de la grilla Grid con el color Color.

flick(Grid,Color,FGrid):-
	Grid = [F|_],
	F = [X|_],
	pintar(Color, X, 0, 0, Grid, FGrid, _).

% pintar(+Color, +ColorEsquina, +X, +Y, +M, -MNueva, -Cont)
% pintar toma un color, el color de la esquina de una matriz M y pinta todos los cuadros, a partir de la posicion (X, Y), adyacentes a esas coordenadas
% del nuevo Color, tambien retorna la cantidad de celdas pintadas.

% Caso base que evita que al buscar adyacentes se vaya de los bordes de la matriz M.
pintar(_, _, X, Y, M, M, 0):-
	X < 0;
	X > 13;
	Y < 0;
	Y > 13.

% Caso base en el que que si el color a pintar es el mismo que el de la esquina no hace nada.
pintar(Color, Color, _, _, M, M, 0).

% Si el color en la posicion (X, Y) es distinto al color con el que se empezo a pintar termina.
pintar(_, ColorEsquina, X, Y, M, M, 0):-
	getColorEn(X, Y, M, ColorEnXY),
	ColorEnXY \= ColorEsquina.

% Caso general de pintar. Busca el color en (X, Y), si es el mismo que el de la esquina lo pinta, luego llama a pintar para todos los adyacentes
% suma uno al contador de cuadros pintados.
pintar(CNuevo, ColorEsquina, X, Y, M, MNueva, Cont):-
	getColorEn(X, Y, M, ColorEsquina),
	pintarEnPos(CNuevo, X, Y, M, MN),
	XMas is X + 1, pintar(CNuevo, ColorEsquina, XMas, Y, MN, MNA, ContA),
	XMen is X - 1, pintar(CNuevo, ColorEsquina, XMen, Y, MNA, MNB, ContB),
	YMas is Y + 1, pintar(CNuevo, ColorEsquina, X, YMas, MNB, MNC, ContC),
	YMen is Y - 1, pintar(CNuevo, ColorEsquina, X, YMen, MNC, MNueva, ContD),
	Cont is ContA + ContB + ContC + ContD + 1.


% getColorEn(+X, +Y, +M, -Color)
% getColorEn retorna el color en la posicion (X, Y) de la matriz (lista de listas) yendo hasta la fila correspondiente a Y,
% para llamar luego a getColorEnX que recorrera las columnas.
getColorEn(X, 0, [Fila | _], Color):- getColorEnX(X, Fila, Color).

% En el caso general controla que la posicion no tenga coordenadas negativas.
getColorEn(X, Y, [_ | M], Color):- X >= 0, Y >= 0, YA is Y - 1, getColorEn(X, YA, M, Color).


% getColorEnX(+X, +Fila, -Color).
% getColorEnX retorna el color en la posicion X de la columna (lista).
getColorEnX(0, [Color | _], Color).
% En el caso general controla que la posicion no tenga X negativo.
getColorEnX(X, [_ | Fila], Color):- X >= 0, XA is X - 1, getColorEnX(XA, Fila, Color).


% pintarEnPos(+CNuevo, +X, +Y, +M, -MNueva).
% pintarEnPos pinta la celda en la posicion (X, Y) de la matriz (lista de listas) con el color pasado como parametro, yendo hasta la fila correspondiente a Y,
pintarEnPos(CNuevo, X, 0, [Fila | M], [FilaNueva | M]) :- pintarEnX(CNuevo, X, Fila, FilaNueva).
pintarEnPos(CNuevo, X, Y, [Fila | M], [Fila | MNueva]) :- YA is Y - 1, pintarEnPos(CNuevo, X, YA, M, MNueva).

% pintarEnX(+Cnuevo, +X, +Fila, -FilaNueva).
% pintarEnX pinta la celda en la posicion X de la columna (lista) con el color pasado como parametro.
pintarEnX(CNuevo, 0, [_ | Fila], [CNuevo | Fila]).
pintarEnX(CNuevo, X, [Elem | Fila], [Elem | FilaNueva]):- XA is X - 1, pintarEnX(CNuevo, XA, Fila, FilaNueva).

% ayuda(+Grid, +LC, -LN).
% ayuda retorna una lista con la cantidad de cuadros que pintaria cada color de la lista LC.
ayuda(_, [], []).
ayuda(Grid, [Color | LC], [(NColor, Color) | LN]):-
	Grid = [Fila | _],
	Fila = [X | _],
	% pinto la matriz con el color.
	pintar(Color, X, 0, 0, Grid, FGrid, N),
	% pinto la matriz con los colores invertidos.
	pintar(X, Color, 0, 0, FGrid, _, M),
	% la diferencia entre ambas pintadas es la cantidad de cuadros que se agregarian al pintar de "Color".
	NColor is M - N,
	ayuda(Grid, LC, LN).


% ayudaDosJugadas(+Grid, +LC, -LN).
% ayudaDosJugadas retorna para cada color las mejores jugadas, en cantidad de cuadros pintados, al realizar dos pintadas consecutivas.
ayudaDosJugadas(_, [], []).

% en el caso general se pide la lista de jugadas posibles con un solo color usando "ayuda".
ayudaDosJugadas(Grid, LC, LN):-
	ayuda(Grid, LC, LNA),
	% el metodo auxiliar va a tomar el resultado de ayuda y va a hacer lo mismo con cada uno de los elementos de la lista resultado.
	ayudaDosJugadasAux(Grid, LC, LNA, LN).


% ayudaDosJugadasAux(+Grid, +LC, +LNA, -LN).
% ayudaDosJugadasAux toma una lista de jugadas y su cantidad total de cuadros pintados para pedir "ayuda" sobre cada una
% realizando asi todas las combinaciones posibles de dos jugadas y la cantidad de cuadros pintados en total
% para devolverlo en una estructura (NumMaxDos, Color, Color2) en el que el primer parametro es la cantida de cuadros pintados
% y el segundo y tercero son los colores en el orden que se "jugaron".
ayudaDosJugadasAux(_, _, [], []).
ayudaDosJugadasAux(Grid, LC, [(Num, Color) | LNA], [(NumMaxDos, Color, Color2) | LN]):-
	Grid = [Fila | _],
	Fila = [X | _],
	% pinto la grilla del color que tengo en la cabeza de la lista
	pintar(Color, X, 0, 0, Grid, FGrid, _),
	% pido ayuda de la matriz nueva, efectivizando una segunda jugada.
	ayuda(FGrid, LC, LNC),
	% tomo la mejor segunda jugada.
	max_member(Max, LNC),
	Max = (Num2, Color2),
	% sumo la cantidad de cuadros pintados por la primera y la mejor segunda.
	NumMaxDos is Num + Num2,
	% llamo recursivamente por cada uno de los elementos de la lista de primeras jugadas restantes.
	ayudaDosJugadasAux(Grid, LC, LNA, LN).


