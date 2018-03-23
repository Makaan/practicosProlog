% Ejercicio 1
nn(0).
nn(s(X)) :- nn(X).

% Ejercicio 2
suma(0, B, B).
suma(s(A), B, s(Resu)) :- suma(A, B, Resu).

% Ejercicio 3
producto(0, _, 0).
producto(_, 0, 0).
producto(A, s(B), Resu):- suma(A, ResuP, Resu), producto(A, B, ResuP).