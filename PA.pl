/* Ejercicio 2 */
diasMes(enero, 31).
diasMes(febrero, 28).
diasMes(febrero, 29).
diasMes(marzo, 31).
diasMes(abril, 30).
diasMes(mayo, 31).
diasMes(junio, 30).
diasMes(julio, 31).
diasMes(agosto, 31).
diasMes(septiembre, 30).
diasMes(octubre, 31).
diasMes(noviembre, 30).
diasMes(diciembre, 31).

/* Ejercicio 4 */
progenitor(abel, cesar). 
progenitor(abel, dario). 
progenitor(flavia, cesar).
progenitor(flavia, dario). 
progenitor(dario, hector). 
progenitor(luisa, hector).
progenitor(dario, ines). 
progenitor(luisa, ines). 
progenitor(omar, maria).
progenitor(sara, maria). 
progenitor(omar, victor). 
progenitor(sara, victor).

esMujer(flavia).
esMujer(luisa).
esMujer(sara).
esMujer(ines).
esMujer(maria).


padresDe(X,Y,Z):- progenitor(X, Z), progenitor(Y, Z).

tuvoHijos(X):- progenitor(X, Y).

esMadre(X) :- esMujer(X), tuvoHijos(X).

/* Son hermanos si tienen los mismos padres */
hermanos(X, Y):- progenitor(P, X), progenitor(P, Y), progenitor(M, X), progenitor(M, Y).

abuelo(X, Y):- progenitor(X, Z), progenitor(Z, Y).

/* Ejercicio 4 */

parejaCasada(abel, flavia). 
parejaCasada(dario, luisa).
parejaCasada(omar, sara). 
parejaCasada(hector, maria).

suegra(Suegra, X):- esMujer(Suegra), parejaCasada(Suegro, Suegra), padresDe(Suegro, Suegra, Pareja), parejaCasada(Pareja, X).

/* Ejercicio 9 */
suma(X, Y, Suma) :- Suma is X+Y.

producto(X, Y, Producto) :- Producto is X*Y.

factorial(0, Resu):- Resu is 1.
factorial(X, Resu):- XX is X - 1, factorial(XX, R), Resu is X * R. 

fibonacci(0, Resu):- Resu is 0.
fibonacci(1, Resu):- Resu is 1.
fibonacci(X, Resu):- Y is X - 1, Z is X - 2, fibonacci(Y, RY), fibonacci(Z, RZ), Resu is RY + RZ.