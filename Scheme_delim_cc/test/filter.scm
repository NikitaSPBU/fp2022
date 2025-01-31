(define filter (lambda (f list)
  (if (empty? list)
    '()
    ((lambda ()
      (define head (car list))
      (define tail (cdr list))
      (if (f head)
        (cons head (filter f tail))
        (filter f tail)))))))

(define filter-reverse (lambda (f list)
  (define helper (lambda (init f list)
    (if (empty? list)
      init  
      ((lambda ()
        (define head (car list))
        (define tail (cdr list))
        (helper (if (f head)
                  (cons head init)
                  init)
                f tail))))))
  (helper '() f list)))

(display (filter (lambda (x) (> x 0))
                  '(1 -2 3 -4 5 -6 7 -8)))
(display (filter-reverse (lambda (x) (< x 0))
                  '(1 -2 3 -4 5 -6 7 -8)))