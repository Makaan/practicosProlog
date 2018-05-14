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
		 [y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		 [y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		 [y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		 [y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		 [y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		 [y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		 [y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		 [y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		 [y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		 [y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		 [y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		 [y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		 [y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		 [y,y,y,y,y,y,y,y,y,y,y,y,y,y]
		]).

grid(4, [
		[a,y,y,y,y,y,y,y,y,y,y,y,y,y],
		[y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		[y,a,y,y,y,y,y,y,y,y,y,y,y,y],
		[y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		[y,y,y,a,y,y,y,y,y,y,y,y,y,y],
		[y,y,y,y,y,y,y,y,a,y,y,y,y,y],
		[y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		[y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		[y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		[y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		[y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		[y,y,y,y,y,y,y,y,y,y,y,y,y,y],
		[y,y,y,y,y,y,y,y,b,y,y,y,y,y],
		[y,y,y,y,y,y,y,y,y,y,y,y,y,y]
	]).

grid(5, [
    [a,a,c,a],
    [c,a,a,a],
    [a,a,c,b],
    [a,c,c,a]
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

pintar(_, _, X, Y, M, M, 0):- 
	X < 0;
	X > 13; 
	Y < 0; 
	Y > 13.

pintar(Color, Color, _, _, M, M, 0).

pintar(_, ColorEsquina, X, Y, M, M, 0):-
	getColorEn(X, Y, M, ColorEnXY),
	ColorEnXY \= ColorEsquina.

pintar(CNuevo, ColorEsquina, X, Y, M, MND, Cont):- 
	getColorEn(X, Y, M, ColorEsquina),
	pintarEnPos(CNuevo, X, Y, M, MN),
	XMas is X + 1, pintar(CNuevo, ColorEsquina, XMas, Y, MN, MNA, ContA),
	XMen is X - 1, pintar(CNuevo, ColorEsquina, XMen, Y, MNA, MNB, ContB),
	YMas is Y + 1, pintar(CNuevo, ColorEsquina, X, YMas, MNB, MNC, ContC),
	YMen is Y - 1, pintar(CNuevo, ColorEsquina, X, YMen, MNC, MND, ContD),
	Cont is ContA + ContB + ContC + ContD + 1.

%getColorEn(_, _, _, []).
getColorEn(X, 0, [Fila | _], Color):- getColorEnX(X, Fila, Color).
getColorEn(X, Y, [_ | M], Color):- X >= 0, Y>= 0, YA is Y - 1, getColorEn(X, YA, M, Color).

%getColorEnX(_, [], _).
getColorEnX(0, [Color | _], Color).
getColorEnX(X, [_ | Fila], Color):- X >= 0, XA is X - 1, getColorEnX(XA, Fila, Color).

pintarEnPos(CNuevo, X, 0, [Fila | M], [FilaNueva | M]) :- pintarEnX(CNuevo, X, Fila, FilaNueva).
pintarEnPos(CNuevo, X, Y, [Fila | M], [Fila | MNueva]) :- YA is Y - 1, pintarEnPos(CNuevo, X, YA, M, MNueva).

pintarEnX(CNuevo, 0, [_ | Fila], [CNuevo | Fila]).
pintarEnX(CNuevo, X, [Elem | Fila], [Elem | FilaNueva]):- XA is X - 1, pintarEnX(CNuevo, XA, Fila, FilaNueva). 


ayudaUnaJugada(Grid, LC, Max):-
	ayuda(Grid, LC, LN),
	max_member(Max, LN).

ayuda(_, [], []).
ayuda(Grid, [Color | LC], [(NColor, Color) | LN]):- 
	Grid = [Fila | _],
	Fila = [X | _],
	pintar(Color, X, 0, 0, Grid, FGrid, N),
	pintar(X, Color, 0, 0, FGrid, _, M),
	NColor is M - N,
	ayuda(Grid, LC, LN).

ayudaDosJugadas(_, [], []).
ayudaDosJugadas(Grid, LC, Max):- 
	ayuda(Grid, LC, LNA),
	ayudaDosJugadasAux(Grid, LC, LNA, LN),
	max_member(Max, LN).

ayudaDosJugadasAux(_, _, [], []).
ayudaDosJugadasAux(Grid, LC, [(Num, Color) | LNA], [MaxDos | LN]):-
	Grid = [Fila | _],
	Fila = [X | _],
	pintar(Color, X, 0, 0, Grid, FGrid, _),
	ayuda(FGrid, LC, LNC),
	max_member(Max, LNC),
	Max = (Num2, Color2),
	NumMaxDos is Num + Num2,
	MaxDos = (NumMaxDos, Color, Color2),	
	ayudaDosJugadasAux(Grid, LC, LNA, LN).


