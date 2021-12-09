(defrule start
	=>
	(printout t "The problem is:" crlf)
	(printout t "Compute the cartesian product of the sets <1,3,5> and <2,4>" crlf)
)

(deftemplate combination
	(slot n1 (type INTEGER))
	(slot n2 (type INTEGER))
)

(assert
	(in A 1)
	(in A 3)
	(in A 5)
	(in B 2)
	(in B 4)
)

(assert (number 1)
		(number 2)
		(number 3)
		(number 4)
		(number 5)
		(number 6)
)

(defrule genCombo
	(number ?n1)
	(number ?n2)
	(in A ?n1)
	(in B ?n2)
	=>
	(assert (combination (n1 ?n1) (n2 ?n2)))
)

(defrule solution
	(combination (n1 ?n1) (n2 ?n2))
	=>
	(printout t "An element from the final result is: <" ?n1 "," ?n2 ">" crlf)
)


(run)
(reset)