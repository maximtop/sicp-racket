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
  (< (/ (abs (- next-guess guess)) guess) 0.001))

(define (sqrt-iter2 guess x)
  (let ([next-guess (improve guess x)])
    (if (good-enough2? guess next-guess)
        guess
        (sqrt-iter2 next-guess x))))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt2 x)
  (sqrt-iter2 1.0 x))

(sqrt 9)
(sqrt2 9)

(sqrt 0.000004) ; returns wrong 0.03129261341049664
(sqrt2 0.000004) ; returns close enough 002001107733030763