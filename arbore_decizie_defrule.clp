(deftemplate Intrebare (slot intrebare)(slot raspuns))

(assert (Intrebare (intrebare nil)(raspuns nil)))

(defrule r1
    (Intrebare (intrebare nil)(raspuns nil))
    =>
    (printout t "Number of family members > 3? (YES/NO)" crlf)
    (bind ?r (read))
    (assert (Intrebare (intrebare "Number of family members > 3?") (raspuns ?r)))
)


(defrule r1.1
	(Intrebare (intrebare "Number of family members > 3?") (raspuns YES))
	;(Intrebare (intrebare nil) (raspuns nil))
	=>
	(printout t "Is married? (YES/NO)" crlf)
	(bind ?r (read))
	(assert (Intrebare (intrebare "Is married ?") (raspuns ?r)))
)

(defrule r3.1
	(Intrebare (intrebare "Is married ?") (raspuns YES))
	=>
	(printout t "3BHK" crlf)
)



(defrule r3.2
	(Intrebare (intrebare "Is married ?") (raspuns NO))
	(Intrebare (intrebare nil) (raspuns nil))
	=>
	(printout t "Salary > 40000 ? (YES/NO)" crlf)
	(bind ?r (read))
	(assert (Intrebare (intrebare "Salary > 40000 ?") (raspuns ?r)))
)

(defrule r3.3
	(Intrebare (intrebare "Salary > 40000 ?") (raspuns YES))
	=>
	(printout t "2BHK" crlf)
)

(defrule r3.4
	(Intrebare (intrebare "Salary > 40000 ?") (raspuns NO))
	=>
	(printout t "1BHK" crlf)
)

(defrule r1.2
(Intrebare (intrebare "Number of family members > 3?") (raspuns NO))
	(Intrebare (intrebare nil) (raspuns nil))
	=>
	(printout t "Salary > 80000 ? (YES/NO)" crlf)
	(bind ?r (read))
	(assert (Intrebare (intrebare "Salary > 80000 ?") (raspuns ?r)))
)



(defrule r2.2
(Intrebare (intrebare "Salary > 80000 ?") (raspuns NO))
(Intrebare (intrebare nil) (raspuns nil))
=>
(bind ?i "Is Married ? (YES/NO)")
(printout t ?i crlf)
(bind ?r (read))
(assert (Intrebare (intrebare "Is Married ?") (raspuns ?r)))
)

(defrule r2.3
(Intrebare (intrebare "Is Married ?") (raspuns YES))
=>
(printout t "2BHK" crlf)
)

(defrule r2.4
(Intrebare (intrebare "Is Married ?") (raspuns NO))
=>
(printout t "3BHK" crlf)
)

(run)
(reset)

