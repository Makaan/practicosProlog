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

derecha(L, 0, L).
derecha(L, N, LR):- NA is N - 1, moverUnoADerecha(L, LRA), derecha(LRA, NA, LR).


izquierda(L, N, LR):- izquierdaAux(L, [], N, LR).
izquierdaAux([X | L], LA, N, LR):- NA is N-1, izquierdaAux(L, [X | LA], NA, LR).
izquierdaAux(L, LA, 0, LR):- invertir(LA, LAI), concatenar(L, LAI, LR).


% 6)
% a)
conjuntoValido([]).
conjuntoValido([X | L]) :- noExiste(X, L), conjuntoValido(L).

noExiste(X, []).
noExiste(X, [X | _]):- false.
noExiste(X, [A | L]):- A \= X, noExiste(X, L).

% b)
pertenece(X, L):- buscar(X, L).

% c)
agregarAConjunto(X, C, R):- conjuntoValido(C), noExiste(X, C), addLast(X, C, R).

% d)
% PREGUNTAR
unirConjuntos(C1, C2, CR):- conjuntoValido(C1), conjuntoValido(C2), unirConjuntosAux(C1, C2, CR).

%dif(+C1, +C2, -D)
dif(C1, C2, D):- findall(X, (pertenece(X, C1), noExiste(X, C2)), D).


unirConjuntosAux([], C2, C2).
unirConjuntosAux([_ | C1], C2, CR):- unirConjuntos(C1, C2, CR).
unirConjuntosAux([X | C1] , C2, [X | CR]):- noExiste(X, C2), unirConjuntos(C1, C2, CR).


/*8. Confeccionar un predicado Prolog que sea capaz de determinar el tipo de argumento
que ha recibido (i.e., si es una variable, un  ́atomo, un entero o una lista). */

tipo(X):- integer(X), write("X es un entero").
tipo(X):- var(X), write("X es una variable").
tipo(X):- atom(X), write("X es un atomo").
tipo(X):- is_list(X), write("X es una Lista").        

/* 9. Asumiendo que se dispone de un diccionario de pares (pc, pi), donde pc es una palabra
en castellano y pi es su equivalente en ingl ́es, implementar en Prolog un traductor de
oraciones. Indicar claramente la convenci ́on adoptada para representar las oraciones. */

% Las oraciones van a ser listas de palabras, con un predicado que las va a imprimir.

rosetta(hola, hello).
rosetta(mundo, world).

traductor([]):- write(".").
traductor([X | L]):- rosetta(Y, X), write(Y), write(" "), traductor(L).

/*10. Definir predicados recursivos para ordenar:
    a) Una lista de n ́umeros.
    b) Una lista de palabras.
Aclaracion ́ : representar las palabras mediante listas de letras. */

%a) 
ordenarNums([], []).
ordenarNums([X | []], [X]).
ordenarNums([X, Y | L], [X | LR]):- X < Y, ordenarNums([Y | L], LR).
ordenarNums([X, Y | L], [Y | LR]):- X > Y, ordenarNums([X | L], LR). 

/*20. Adoptando una representaci ́on razonable para  ́arboles binarios de b ́usqueda, implementar
a trav ́es de predicados Prolog las siguientes relaciones:

a) crearArbolVacio(X): retorna en X un  ́arbol vac ́ıo.
b) insertar(E, A, NA): inserta el elemento E en el  ́arbol A, retornando el nuevo  ́arbol
en NA (asumir que si el elemento a ser insertado ya pertenece al  ́arbol, entonces se
retorna el mismo  ́arbol).
c) eliminar(E, A, NA): elimina el elemento E del  ́arbol A, retornando el nuevo  ́arbol en
NA. Se debe manejar apropiadamente la eliminaci ́on de elementos tanto en las hojas
del  ́arbol como en sus nodos internos.
d) altura(A, X): retorna en X la altura del  ́arbol A.
e) balanceado(A): determina si el  ́arbol A est ́a balanceado o no.
*/

crearArbolVacio(#).

insertar(E, #, bin(E, #, #)).
insertar(E, bin(P, #, #), bin(P, bin(E, #, #), #)):- E < P.
insertar(E, bin(P, #, #), bin(P, #, bin(E, #, #))):- E > P.
insertar(E, bin(P, HI, HD), bin(P, HIN, HD)):- E < P,  insertar(E, HI, HIN). 
insertar(E, bin(P, HI, HD), bin(P, HI, HDN)):- E > P,  insertar(E, HD, HDN). 

eliminar(E, bin(E, #, #), #).
eliminar(E, bin(E, HI, #), HI).
eliminar(E, bin(E, #, HD), HD).
eliminar(E, bin(P, HI, HD), bin(P, HI, HD)):- E < P, eliminar(P, HI, HD).
