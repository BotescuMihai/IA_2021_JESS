(deftemplate triunghi (multislot coordonate))

(assert (triunghi (coordonate 0 0 3 3 2 2)))

(assert (triunghi (coordonate 1 2 3 4 5 6)))

(deffunction dist(?x1 ?x2 ?y1 ?y2)
	(return (sqrt (+ (* (- ?y1 ?x1) (- ?y1 ?x1)) (* (- ?y2 ?x2) (- ?y2 ?x2))
	))))

(deffunction tipTriunghi(?l1 ?l2 ?l3)
	(printout t ?l1 " " ?l2 " " ?l3 crlf)
	(if (or (> ?l1 (+ ?l2 ?l3))
			(> ?l2 (+ ?l1 ?l3))
			(> ?l3 (+ ?l1 ?l2))
		) then
	(if (or (= (* ?l1 ?l1) (+ (* ?l2 ?l2) (* ?l3 ?l3)))
			(= (* ?l2 ?l2) (+ (* ?l1 ?l1) (* ?l3 ?l3)))
			(= (* ?l3 ?l3) (+ (* ?l1 ?l1) (* ?l2 ?l2))) then
			(return "triunghi dreptunghic")
	else
		(if (or (= ?l1 ?l2)
			    (= ?l2 ?l3)
			    (= ?l1 ?l3)) then
			    (return "triunghi isoscel" )
		else
			(if (= ?l1 ?l2 ?l3) then
				(return "triunghi echilateral")
			else
				(return "triunghi scalen/oarecare")
			))))
	)else		
	(return "nu e triunghi")
)
(deffunction detdistance($?lista)
	(bind ?x1 (nth$ 1 ?lista))
	(bind ?y1 (nth$ 2 ?lista))
	(bind ?x2 (nth$ 3 ?lista))
	(bind ?y2 (nth$ 4 ?lista))
	(bind ?x3 (nth$ 5 ?lista))
	(bind ?y3 (nth$ 6 ?lista))
	(printout  t "P1(" ?x1 "," ?y1 ")" crlf)
	(printout  t "P2(" ?x2 "," ?y2 ")" crlf)
	(printout  t "P3(" ?x3 "," ?y3 ")" crlf)
	(bind ?dP1P2 (dist ?x1 ?y1 ?x2 ?y2))
	(bind ?dP2P3 (dist ?x2 ?y2 ?x3 ?y3))
	(bind ?dP3P1 (dist ?x3 ?y3 ?x1 ?y1))
	(printout t "d(P1(" ?x1 "," ?y1 "),P2(" ?x2 "," ?y2 "))=" ?dP1P2 crlf)
	(printout t "d(P2(" ?x2 "," ?y2 "),P3(" ?x3 "," ?y3 "))=" ?dP2P3 crlf)
	(printout t "d(P3(" ?x3 "," ?y3 "),P1(" ?x1 "," ?y1 "))=" ?dP3P1 crlf)
	
)

(bind ?l1 (dist 0 0 5 5))
(bind ?l2 (dist 0 0 3 3))
(bind ?l3 (dist 0 0 4 4))

(printout t "tip triunghi:" (tipTriunghi (dist 3 4 2 5) (dist 3 4 1 6) (dist 2 5 1 6)) crlf)


(deffunction checkPatrat(?l1 ?l2 ?l3 ?l4)
	(return (= ?l1 ?l2 ?l3 ?l4))
)

(deffunction perimetruPatrat(?l1 ?l2 ?l3 ?l4)
	(return (+ ?l1 ?l2 ?l3 ?l4))
)

(deffunction ariaPatrat(?l1 ?l2 ?l3 ?l4)
	(return (* ?l1 ?l1))
)


(
	