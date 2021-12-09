(defrule startup
=>
(assert (color red)
		(color blue)
		(color green)
		(color yellow)
		(country Portugal)
		(country Spain)
		(country France)
		(country Germany)
		(country Czechia)
		(country Austria)
		(country Italy)
)
)

(deftemplate combination (slot country) (slot color))
(defrule generate-combinations
    (country ?c1)
    (color ?c)
    =>
    (assert (combination (country ?c1) (color ?c)))
)

(defrule find-solution
(combination (country ?P & :(= ?P Portugal)) (color ?c1))
(combination (country ?S & :(= ?S Spain)) (color ?c2 & ~?c1))
(combination (country ?F & :(= ?F France)) (color ?c3 & ~?c2))
(combination (country ?G & :(= ?G Germany)) (color ?c4 & ~?c3))
(combination (country ?C & :(= ?C Czechia)) (color ?c5 & ~?c4))
(combination (country ?A & :(= ?A Austria)) (color ?c6 & ~?c5 & ~?c3))
(combination (country ?I & :(= ?I Italy)) (color ?c7 & ~?c6 & ~?c3))
=>
(printout t "A solution is:" crlf)
(printout t ?P "->" ?c1 crlf)
(printout t ?S "->" ?c2 crlf)
(printout t ?F "->" ?c3 crlf)
(printout t ?G "->" ?c4 crlf)
(printout t ?C "->" ?c5 crlf)
(printout t ?A "->" ?c6 crlf)
(printout t ?I "->" ?c7 crlf)
)
(reset)
(run)

 