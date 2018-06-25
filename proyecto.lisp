;Implementar una funci ́on Lisp rango que dados dos enteros M y N representando los
;extremos de un rango entero, M ≤ N, obtanga la lista con la secuencia de enteros
;comprendidos dentro de dicho rango, incluyendo los extremos.

(defun rango(N M) 
    (cond 
        ((> N M) '())                   ;Si N > M retorna una lista vacia
        ((= N M) (cons M '()))          ;Si N = M retorna una lista con M como unico elmento
        (T (cons N (rango (1+ N) M)))   ;Si N < M retorna una nueva lista con cabeza N y cuerpo el resultado de llamar a rango(N+1, M)
    )
)

;Implementar una función ordenarl que reciba una lista de listas y retorne el resultado de
;ordenar sus elemntos (sublistas), de menor a mayor, de acuerdo a su longitud.

(defun ordenarl(L) 
    (cond
        ((ordenadal L) L)               ;Si esta ordenada retorna L
        (T (ordenarl (ordenarlAux L)))  ;Si no, llama recursivamente con la lista que retorna ordenarlAux
    )
)

;Esta funcion ordena una lista en una pasada intercambiando pares de elementos si el primero es mayor en longitud al segundo
(defun ordenarlAux(L)
    (cond
        ((null (cdr L)) L)                              ;Si la lista tiene un elemento la retorna asi.
        ((> (longitud (car L)) (longitud (car(cdr L)))) ;Si la longitud del primer elemento es mayor al segundo los intercambia y llama recursivamente
            (append 
                (list 
                    (car (cdr L)) 
                    (car L)) 
                    (ordenarLAux(cdr(cdr L))
                )
            )
        )
        (T                                              ;Si no, llama recursivamente sin la cabeza de L.
            (cons 
                (car L) 
                (ordenarlAux (cdr L))
            )    
        )
    )
)

;Una lista esta ordenada si para cada par de elementos el primero tiene una longitud menor al segundo.
(defun ordenadal(L)
    (cond
        ((null (cdr L)) T)                                 ;Si la lista tiene un solo elemento o es vacia esta ordenada.
        ((> (longitud (car L)) (longitud (car(cdr L))))    ;Si la longitud del primer elemento es mayor a la del segundo retorna nil.
            nil
        )
        (T 
            (and T (ordenadal (cdr L)))                    ;Si no, llama recursivamente retornando T si toda la lista está ordenada.
        )
    )
)

;3. Definir una función Lisp que a partir de un conjunto S, representado a través de una
;lista, calcule el conjunto P(S) de todos sus subconjuntos posibles.

(defun partes(L)
    (cond   
        ((null L)                                   ;Si la el conjunto es vacio su conjunto de partes tambien lo es.
            '()
        )
        (T 
            (combinar (car L) (partes (cdr L)))     ;Retorna un conjunto resultado de combinar cada elemento del conjunto original con la llamada
                                                    ;recursiva de partes con la cola de la lista.
        )
    )
)

;combinar retorna una lista con todos los elementos de la lista L mas todos ellos si se los pone en una lista con cabeza E.
(defun combinar(E L)
    (cond 
        ((null (cdr L))                 ;Si la lista esta vacia se devuelve una lista con la lista formada por E, y seguida de vacio.
            (list 
                (cons E (car L))
                (car L)
            )
        )
        (T 
            (append                     ;Si no, se crea una lista con: la lista formada por E como cabeza y la cabeza de L como cuerpo,
                (list                   ;una lista con la cabeza de L como elemento y el resultado de llamar recursivamente a combinar
                    (cons E (car L))    ;con E y la cola de la lista L.
                    (car L)
                )
                (combinar E (cdr L))
            )
        )
    )
)


;Retorna la longitud de una lista
(defun longitud(L)
    (COND 
        ((null L) 0)                    ;Una lista vacia tiene longitud 0.
        (T (+ 1 (longitud (CDR L))))    ;Retorna 1 mas lo que retorna la llamada recursiva.
    )   
)