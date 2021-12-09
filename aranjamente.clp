(defrule start
	=>
	(printout t "The problem is:" crlf)
	(printout t "Generate all the aranjaments for <1,2,3,4,5> of 3 items" crlf)
)

(deftemplate combination
	(slot n1 (type INTEGER))
	(slot n2 (type INTEGER))
	(slot n3 (type INTEGER))
)

(assert (number 1)
		(number 2)
		(number 3)
		(number 4)
		(number 5)
)

(defrule genCombo
	(number ?n1)
	(number ?n2 &~?n1)
	(number ?n3 &~?n2 &~?n1)
	=>
	(assert (combination (n1 ?n1) (n2 ?n2) (n3 ?n3)))
)

(defrule solution
	(combination (n1 ?n1) (n2 ?n2) (n3 ?n3))
	=>
	(printout t "A solution is: {<" ?n1 "," ?n2 "," ?n3 ">}" crlf)
)


(run)
(reset)