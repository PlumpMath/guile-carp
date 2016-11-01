(define-module (carp)
  #:use-module (srfi srfi-13)
  #:export (confess))

(define (localize-path path)
  (string-append (basename (dirname path)) "/" (basename path)))

(define (long-message message location)
  (let* ((filename (localize-path (assq-ref location 'filename)))
         (line     (assq-ref location 'line)))
    (format (current-error-port) "~a at ~a line ~a~%" message filename line)))

(define-syntax confess
  (syntax-rules ()
    ((_ message)
     (begin
       (long-message message (current-source-location))
       (exit EXIT_FAILURE)))))
