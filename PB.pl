% Ejercicio 1
nn(0).
nn(s(X)) :- nn(X).

% Ejercicio 2
suma(0, B, B).
suma(s(A), B, s(Resu)) :- suma(A, B, Resu).

% Ejercicio 3
producto(_, 0, 0).
producto(0, _, 0).
producto(A, s(B), Resu):- suma(A, ResuP, Resu), producto(A, B, ResuP).

% Ejercicio 4

potencia(_, 0, 1).
potencia(0, _, 0).
potencia(A, s(B), Resu):- producto(A, ResuP, Resu), potencia(A, B, ResuP).

% Ejercicio 5

% a)
juntarDosElementos(A, B, [A, B]).

% b)
    % 1)
    addFirst(A, L, [A | L]).

    % 2)
    addLast(A, [], [A | []]).
    addLast(A, [X | L], [X | LRes]):- addLast(A, L, LRes).

% c)
concatenar([], L, L).
concatenar([X | L], L2, [X | LRes]):- concatenar(L, L2, LRes).

% d)
buscar(A, [A | _]).
buscar(A, [_ | L]):- buscar(A, L).

% e)
invertir([], []).
invertir([X | L], LR):- invertir(L, LRI), addLast(X, LRI, LR).

% f)
    %1)
    borrarUnElemento(A, [A | L], L).
    borrarUnElemento(A, [X | L], [X | LRes]):- borrarUnElemento(A, L, LRes). 
    
    %2)
    borrarTodos(_, [], []).
    borrarTodos(A, [A | L], LRes):- borrarTodos(A, L, LRes).
    borrarTodos(A, [X | L], [X | LRes]):- X\=A, borrarTodos(A, L, LRes).

% g)
    %1)
    cambiarUnElemento(A, B, [B | L], [A | L]).
    cambiarUnElemento(A, B, [X | L], [X | LRes]):- cambiarUnElemento(A, B, L, LRes).

    %2)
    cambiarTodos(A, B, [], []).
    cambiarTodos(A, B, [B | L], [A | LRes]):- cambiarTodos(A, B, L, LRes).
    cambiarTodos(A, B, [X | L], [X | LRes]):- X \= B, cambiarTodos(A, B, L, LRes).

% h)
listasIguales([], []).
listasIguales([A | L1], [A | L2]):- listasIguales(L1, L2).

palindromo(L):- invertir(L, LI), listasIguales(L, LI).

% i)
listaDoble(L, LRes):- invertir(L, LI), concatenar(L, LI, LRes).

% j)
moverUnoADerecha([], []).
moverUnoADerecha(L, LRes):- moverUnoADerechaAux(L, LU, U), concatenar([U], LU, LRes).

moverUnoADerechaAux([U | []], [] , U).
moverUnoADerechaAux([X | L], [X | LU] , U):- moverUnoADerechaAux(L,LU, U).

% k)
moverUnoAIzquierda([], []).
moverUnoAIzquierda([X | L], LRes):- concatenar(L, [X], LRes).

