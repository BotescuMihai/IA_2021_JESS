(defrule startup
    =>
    (printout t "The problem is " crlf)
    (printout t "  + TWO " crlf)
    (printout t "    TWO " crlf)
    (printout t "    --- " crlf)
    (printout t "  = FOUR" crlf crlf)
    (assert (number 0)
        (number 1)(number 2)(number 3)(number 4)
        (number 5)(number 6)(number 7)(number 8)
        (number 9)(letter T)(letter W)(letter O)
        (letter F)(letter U)(letter R)
    )
)

(deftemplate combination (slot letter (type SYMBOL)) (slot number (type INTEGER)))
(defrule generate-combinations
    (number ?x)
    (letter ?a)
    =>
    (assert (combination (letter ?a)(number ?x)))
)

(defrule find-solution
(combination (letter T) (number ?t &: (= ?t 5)))
(combination (letter F) (number ?f &: (= ?f 1)))
(combination (letter R) (number ?r &: (= ?r 0)))
(combination (letter O) (number ?o &: (= ?o 0)))
(combination (letter W) (number ?w & ~?t & ~?f))
(combination (letter U) (number ?u & ~?w & ~?t & ~?f & ~?r & ~?o &: (= (mod (* 2 ?w) 10) ?u) &: (< (* 2 ?w) 9)))
=>
(printout t "A solution is:" crlf)
(printout t "T:" ?t " W:" ?w " O:" ?o " F:" ?f " U:" ?u " R:" ?r crlf)
(printout t ?t ?w ?o "+" crlf)
(printout t ?t ?w ?o crlf)
(printout t "---" crlf)
(printout t ?f ?o ?u ?r crlf)
)
(reset)
(run)

 