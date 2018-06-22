(defun rango(N M) 
    (cond 
        ((> N M) '())                   ;Si N > M retorna una lista vacia
        ((= N M) (cons M '()))          ;Si N = M retorna una lista con M como unico elmento
        (T (cons N (rango (1+ N) M)))   ;Si N < M retorna una nueva lista con cabeza N y cuerpo el resultado de llamar a rango(N+1, M)
    )
)

(defun ordenarl(L) 
    (cond
        ((ordenadal L) L)
        (T (ordenarl (ordenarlAux L)))
    )
)

(defun ordenarlAux(L)
    (cond
        ((null (cdr L)) L)
        ((> (longitud (car L)) (longitud (car(cdr L))))
            (append (list (car (cdr L)) (car L)) (ordenarLAux(cdr(cdr L))))
        )
        (T 
            (cons (car L) (ordenarlAux (cdr L)))    
        )
    )
)

(defun ordenadal(L)
    (cond
        ((null (cdr L)) T)
        ((> (longitud (car L)) (longitud (car(cdr L))))
            nil
        )
        (T 
            (and T (ordenadal (cdr L)))
        )
    )
)


;Retorna la longitud de una lista
(defun longitud(L)
    (COND 
        ((null L) 0)
        (T (+ 1 (longitud (CDR L))))
    )   
)