#lang sicp

(#%require rackunit)

(define (square num)
  (* num num))

(define (sum-of-squares num1 num2)
  (+ (square num1) (square num2)))

(define (largest-of-two a b)
  (if (> a b)
      a
      b))

(define (largest-of-three a b c)
  (cond [(and (> a b) (> a c)) a]
        [(and (> b a) (> b c)) b]
        [else c]))

(define (sum-of-larger-squares a b c)
  (let ([largest (largest-of-three a b c)])
    (cond [(= a largest) (sum-of-squares a (largest-of-two b c))]
          [(= b largest) (sum-of-squares b (largest-of-two a c))]
          [else (sum-of-squares c (largest-of-two a b))])))

(check-equal? (sum-of-larger-squares 1 2 3) 13)
(check-equal? (sum-of-larger-squares 1 2 2) 8)
(check-equal? (sum-of-larger-squares 2 1 2) 8)