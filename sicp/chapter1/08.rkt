#lang sicp

(#%require rackunit)

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (square x)
  (* x x))

(define (good-enough? guess improved-guess)
  (< (/ (abs (- improved-guess guess)) guess) 0.000001))

(define (cbrt-iter guess x)
  (let ([improved-guess (improve guess x)])
    (if (good-enough? guess improved-guess)
        guess
        (cbrt-iter improved-guess x))))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(define epsilon 0.00001)
(check-= (cbrt 0.000008) 0.02 epsilon)
(check-= (cbrt 8) 2 epsilon)
(check-= (cbrt 8000000000001) 20000  epsilon)


