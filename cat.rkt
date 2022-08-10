#lang racket

(define argv (vector->list (current-command-line-arguments)))
(define (display-until-eof file)
  (let  ([c (read-char file)])
    (unless   (eof-object? c)
      (begin  (display c)
              (display-until-eof file)))))

(when (= (length argv) 0)
  (display-until-eof (current-input-port))
  (exit 1))

((λ ()
   (map (λ (path)
          (cond [(equal? path "-")
                 (display-until-eof (current-input-port))]
  
                [else (let ([FILE (open-input-file path)])
                        (display-until-eof FILE))])) argv) (values)))
       
