(defrule startup
  =>
  ;; 1. enuntul problemei
  
  (printout t "The problem is" crlf)
  (printout t "    CROSS" crlf)
  (printout t " +  ROADS" crlf)
  (printout t "   ------" crlf)
  (printout t " = DANGER" crlf)
  (assert (number 0)
          (number 1)
          (number 2)
          (number 3)
          (number 4)
          (number 5)
          (number 6)
          (number 7)
          (number 8)
          (number 9)
          (letter C)
          (letter R)
          (letter O)
          (letter S)
          (letter A)
          (letter D)
          (letter N)
          (letter G)
          (letter E)
          ))

;; 2. Generarea tuturor combinatiilor posibile (numar,litera)

(deftemplate combination (slot letter (type SYMBOL)) (slot number (type INTEGER)))
(defrule generate-combinations
  (number ?x)
  (letter ?a)
  =>
  (assert (combination (letter ?a) (number ?x))))


;; CROSS +     9999+
;; ROADS       9999
;;DANGER        ...  8

;; Am 5 litere => am transport undeva
;; WORST CASE:
;; 9999+9999=19998 < 20000 => D = 1
;; CONDITII:
;; 1) D=1
;; 2) C + R > 9
;; 3) (c + r) mod 10 + (r + o) div 10 = a
;; 4) (r + o) mod 10 + (o + a) div 10 = n
;; 5) (o + a) mod 10 + (s + d) div 10 = g
;; 6) (s + d) mod 10 + (s + s) div 10 = e
;; 7) (s + s) mod 10 = r


(defrule find-solution
(combination (letter D) (number ?d))
(combination (letter A) (number ?a &~?d))
(combination (letter C) (number ?c &~?a&~?d))
(combination (letter R) (number ?r &~?c&~?a&~?d))
(combination (letter N) (number ?n &~?r&~?c&~?a&~?d))
(combination (letter O) (number ?o &~?n&~?r&~?c&~?a&~?d))
(combination (letter G) (number ?g &~?o&~?n&~?r&~?c&~?a&~?d))
(combination (letter S) (number ?s &~?g&~?o&~?n&~?r&~?c&~?a&~?d))
(combination (letter E) (number ?e &~?s&~?g&~?o&~?n&~?r&~?c&~?a&~?d))
(test (eq ?d 1))
(test (> (+ ?c ?r) 9))
(test (eq (+ (mod (+ ?c ?r) 10) (div (+ ?r ?o) 10)) ?a))
(test (eq (+ (mod (+ ?r ?o) 10) (div (+ ?o ?a) 10)) ?n))
(test (eq (+ (mod (+ ?o ?a) 10) (div (+ ?s ?d) 10)) ?g))
(test (eq (+ (mod (+ ?s ?d) 10) (div (+ ?s ?s) 10)) ?e))
(test (eq (mod (+ ?s ?s) 10) ?r))
=>
(printout t "A solution is:" crlf)
(printout t " C = " ?c)
(printout t " R = " ?r)
(printout t " O = " ?o)
(printout t " S = " ?s)
(printout t " A = " ?a)
(printout t " D = " ?d)
(printout t " N = " ?n)
(printout t " G = " ?g)
(printout t " E = " ?e)
(printout t crlf)
(printout t "  " ?c ?r ?o ?s ?s " + " crlf)
(printout t "  " ?r ?o ?a ?d ?s crlf)
(printout t "=" ?d ?a ?n ?g ?e ?r crlf)
)

(reset)

(run)
