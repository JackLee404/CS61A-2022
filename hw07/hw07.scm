(define (cadr lst) (car (cdr lst)))

(define (make-kwlist1 keys values)
  (list keys values)  
)

(define (get-keys-kwlist1 kwlist) 
  (car kwlist)  
)

(define (get-values-kwlist1 kwlist)
  (cadr kwlist))

(define (make-kwlist2 keys values)
  (begin (define (loop keys_ values_ lst)
  (if (not (null? keys_))
  (loop (cdr keys_) (cdr values_) (append lst (list (list (car keys_) (car values_)))))
  lst))
  (loop keys values ()))
)

(define (get-keys-kwlist2 kwlist) 
  (begin (define (loop kwlist_ lst)
  (if (not (null? kwlist_))
  (loop (cdr kwlist_) (append lst (list (car (car kwlist_)))))
  lst))
  (loop kwlist () ))
  )

(define (get-values-kwlist2 kwlist)
  (begin (define (loop kwlist_ lst)
  (if (not (null? kwlist_))
  (loop (cdr kwlist_) (append lst (cdr (car kwlist_))))
  lst))
  (loop kwlist () ))
)

(define (add-to-kwlist kwlist key value)
  (define keys (get-keys-kwlist kwlist))
  (define values (get-values-kwlist kwlist))
  (make-kwlist (append keys (list key)) (append values (list value)))
)

(define (get-first-from-kwlist kwlist key)
  'YOUR-CODE-HERE)

(define (prune-expr expr)
  (define (prune-helper lst)
    (cond
    ((null? lst) nil)
    ((null? (cdr lst)) (list (car lst)))
    (else (append (list (car lst)) (prune-helper (cdr (cdr lst)))))))
  
  (append (list (car expr)) (prune-helper (cdr expr))))

(define (curry-cook formals body) 
  (cond 
  ((null? (cdr formals)) `(lambda (,(car formals)) ,body))
  (else (append `(lambda (,(car formals))) (list(curry-cook (cdr formals) body))))
  ))

(define (curry-consume curries args)
  (cond 
  ((null? (cdr args)) (curries (car args)))
  (else (curry-consume (curries (car args)) (cdr args))
  ))
)
