#lang sicp

(#%require rackunit)

(define (average num1 num2)
  (/ (+ num1 num2) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-enough2? guess next-guess)
  (< (/ (abs (- next-guess guess)) guess) 0.00001))

(define (sqrt-iter2 guess x)
  (let ([next-guess (improve guess x)])
    (if (good-enough2? guess next-guess)
        next-guess
        (sqrt-iter2 next-guess x))))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt2 x)
  (sqrt-iter2 1.0 x))

(define epsilon 0.00001)
(check-= (sqrt2 0.04) 0.2 epsilon)
(check-= (sqrt2 0.0004) 0.02 epsilon)
(check-= (sqrt2 40000) 200 epsilon)
