(defrule startup
  =>
  (printout t "The problem is" crlf)
  (printout t "    BASE" crlf)
  (printout t " +  BALL" crlf)
  (printout t "   ------" crlf)
  (printout t " = GAMES" crlf)
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
          (letter B)
          (letter A)
          (letter S)
          (letter E)
          (letter L)
          (letter G)
          (letter M)
          ))

(deftemplate combination (slot letter (type SYMBOL)) (slot number (type INTEGER)))
(defrule generate-combinations
  (number ?x)
  (letter ?a)
  =>
  (assert (combination (letter ?a) (number ?x))))


;; BASE + 
;; BALL 
;;GAMES
(defrule find-solution
(combination (letter G) (number ?g & :(= ?g 1)))
(combination (letter A) (number ?a &~?g))
(combination (letter B) (number ?b &~?a&~?g & :(> (* 2 ?b) 9)))
(combination (letter M) (number ?m &~?b&~?a&~?g))
(combination (letter E) (number ?e &~?m&~?b&~?a&~?g))
(combination (letter L) (number ?l &~?e&~?m&~?b&~?a&~?g))
(combination (letter S) (number ?s &~?l&~?e&~?m&~?b&~?a&~?g & :(and (= ?e (mod (+ ?s ?l) 10)) (= ?s (mod (+ ?e ?l) 10)))))
(test (eq (+ (mod (* 2 ?b) 10) (div (* 2 ?a) 10)) ?a))
(test (eq (+ (mod (* 2 ?a) 10) (div (+ ?s ?l) 10)) ?m))
(test (eq (+ (mod (+ ?s ?l) 10) (div (+ ?e ?l) 10)) ?e))
=>
(printout t "A solution is:" crlf)
(printout t " B = " ?b)
(printout t " A = " ?a)
(printout t " S = " ?s)
(printout t " E = " ?e)
(printout t " L = " ?l)
(printout t " G = " ?g)
(printout t " M = " ?m)
(printout t crlf)
(printout t "  " ?b ?a ?s ?e " + " crlf)
(printout t "  " ?b ?a ?l ?l crlf)
(printout t "=" ?g ?a ?m ?e ?s crlf)
)

(reset)

(run)
