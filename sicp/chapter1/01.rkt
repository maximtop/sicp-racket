#lang sicp

(#%require rackunit)

(define question1 10)
(check-equal? question1 10)

(define question2 (+ 5 3 4))
(check-equal? question2 12)

(define question3 (- 9 1))
(check-equal? question3 8)

(define question4 (/ 6 2))
(check-equal? question4 3)

(define question5 (+ (* 2 4) (- 4 6)))
(check-equal? question5 6)

(define a 3) ;; 3
(define b (+ a 1)) ;; 4

(define question6 (+ a b (* a b)))
(check-equal? question6 19)

(define question7 (= a b))
(check-equal? question7 #false)

(define question8 (if (and (> b a) (< b (* a b)))
                      b
                      a))
(check-equal? question8 4)

(define question9 (cond ((= a 4) 6)
                        ((= b 4) (+ 6 7 a))
                        (else 25)))
(check-equal? question9 16)

(define question10 (+ 2 (if (> b a) b a)))
(check-equal? question10 6)

(define question11 (* (cond ((> a b) a)
                            ((< a b) b)
                            (else -1))
                      (+ a 1)))
(check-equal? question11 16)
