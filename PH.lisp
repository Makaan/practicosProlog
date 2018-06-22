;7 a) Calcular la longitud de una lista.
(defun longitud(L)
    (COND 
        ((null L) 0)
        (T (+ 1 (longitud (CDR L))))
    )   
)

;b) Eliminar el primer elemento de una lista.
(defun elPrimerElem(L) 
    (cdr L)
)

;c) Eliminar el  ́ultimo elemento de una lista.
(defun elUltimoElem(L)
    (cond 
        ((null (cdr L)) ())
        (T (cons (car L) (elUltimoElem (cdr L))))
    )
)

;d) Invertir una lista.

(defun invertirLista(L)
    (cond 
        ((null L) ())
        (T (append (invertirLista(cdr L)) (list (car L))))
    )
)