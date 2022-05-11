(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (cadr (cdr s)))

(define (ascending? lst) 
    (cond
        ((null? (cdr lst)) #t)
        ((< (cadr lst) (car lst)) #f)  
        (else (ascending? (cdr lst)))
    )
)

(define (interleave lst1 lst2) 
    (define lst '())
    (cond
        ((null? lst1) (append lst lst2))
        ((null? lst2) (append lst lst1))
        (else (append lst (list (car lst1)) (list (car lst2)) (interleave (cdr lst1) (cdr lst2))))
    )
)

(define (my-filter func lst)
    (cond
        ((null? lst) nil)
        ((func (car lst)) (cons (car lst) (my-filter func (cdr lst))))
        (else (my-filter func (cdr lst)))
    )
)

(define (no-repeats lst)
    (cond
        ((null? lst) nil)
        (else (cons (car lst) 
                    (no-repeats
                       (my-filter (lambda (x) (not (= x (car lst)))) (cdr lst)))))
))
