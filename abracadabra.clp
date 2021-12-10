(defrule startup
  =>
  (printout t "The problem is" crlf)
  (printout t "   ABRA" crlf)
  (printout t " +   CA" crlf)
  (printout t " +DABRA" crlf)
  (printout t "   ------" crlf)
  (printout t "=MAGIC" crlf)
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
          (letter A)
          (letter B)
          (letter R)
          (letter C)
          (letter D)
          (letter M)
          (letter G)
          (letter I)
          ))

(deftemplate combination (slot letter (type SYMBOL)) (slot number (type INTEGER)))
(defrule generate-combinations
  (number ?x)
  (letter ?a)
  =>
  (assert (combination (letter ?a) (number ?x))))

;   ABRA
; +   CA
; +DABRA
;   ----
; =MAGIC

(defrule find-solution
(combination (letter M) (number ?m))
(combination (letter D) (number ?d &~?m & :(= ?m (+ ?d 1)) & :(> ?d 0)))
(combination (letter A) (number ?a &~?d&~?m))
(combination (letter C) (number ?c &~?a&~?d&~?m & :(= ?c (mod (* 3 ?a) 10))))
(combination (letter R) (number ?r &~?c&~?a&~?d&~?m))
(combination (letter I) (number ?i &~?r&~?c&~?a&~?d&~?m & :(= ?i (+ (mod (+ ?r ?c ?r) 10) (div (* 3 ?a) 10)))))
(combination (letter B) (number ?b &~?i&~?r&~?c&~?a&~?d&~?m))
(combination (letter G) (number ?g &~?b&~?i&~?r&~?c&~?a&~?d&~?m & :(= ?g (+ (mod (* 2 ?b) 10) (div (+ ?r ?c ?r) 10)))))
(test (eq ?a (+ (mod (* 2 ?a) 10) (div (* 2 ?b) 10))))
  =>
  (printout t "A solution is:" crlf)
  (printout t "  A = " ?a )
  (printout t "  B = " ?b )
  (printout t "  R = " ?r )
  (printout t "  C = " ?c )
  (printout t "  D = " ?d )
  (printout t "  M = " ?m )
  (printout t "  G = " ?g )
  (printout t "  I = " ?i )
    
  (printout t crlf)
  (printout t "    " ?a ?b ?r ?a crlf)
  (printout t " +    " ?c ?a crlf)
  (printout t " + " ?d ?a ?b ?r ?a crlf) 
  (printout t "   " "------" crlf)
  (printout t " = " ?m ?a ?g ?i ?c crlf)
 )
  
(reset)
(run)
