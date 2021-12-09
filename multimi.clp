(deffunction suma(?l)
	(bind ?suma 0)
	(foreach ?x ?l
		(bind ?suma (+ ?suma ?x))
	)
	(printout t "Suma elem listei " ?l " este:" ?suma crlf)
)

(suma (create$ 1 2 3 4 5))
