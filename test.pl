solve(true, 1).
solve((A,B), NM):- solve(A, N), solve(B, M), NM is N + M.
solve(A, N):- clause(A, B), solve(B, M), N is M.

a(X):- b(X), b(X).
b(a).