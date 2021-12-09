(deffunction maxim(?l)
	(bind ?maxim 0)
	(foreach ?x ?l
		(if (> ?x ?maxim) then
			(bind ?maxim ?x)
		)
	)
	(return ?maxim)
)

(printout t "Max=" (maxim (create$ 2 1 5 4 3)) crlf)