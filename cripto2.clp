;project+
;prepare
;success
(assert (cifra 0)(cifra 1)(cifra 2)(cifra 3)(cifra 4)(cifra 5)(cifra 6)(cifra 7)(cifra 8)(cifra 9)(litera P)
(litera R)(litera O)(litera J)(litera E)(litera C)(litera T)(litera A)(litera S)(litera U)(litera C))
(deftemplate cripto(slot litera)(slot cifra)) 

(defrule asociere
    (cifra ?c)
    (litera ?l)
=>
(assert(cripto(litera ?l)(cifra ?c)))
)
(defrule solutie
(cripto (litera A)(cifra ?a&:(= ?a 0)))
(cripto (litera T)(cifra ?t&~?a))
(cripto (litera E)(cifra ?e&~?t&~?a))
(cripto (litera S) (cifra ?s&~?e&~?t&~?a&:(= (mod (+ ?t ?e)10)?s))) (cripto (litera C)(cifra ?c&~?s&~?e&~?t&~?a))
(cripto (litera R)(cifra ?r&~?c&~?s&~?e&~?t&~?a))
(cripto (litera S)(cifra ?s&~?r&~?c&~?e&~?t&:(= (mod (+ ?c ?r (div (+ ?e
?t)10)) 10) ?s )))
(cripto (litera E)(cifra ?e&~?r&~?c&~?e&~?t&:(= (mod (+ ?a ?e (div (+ ?c ?r)10)) 10) ?e )))
(cripto (litera J)(cifra ?j&~?a&~?c&~?r&~?s&~?e&~?t))
(cripto (litera P)(cifra ?p&~?j&~?a&~?c&~?r&~?s&~?e&~?t))
(cripto (litera C)(cifra ?c&~?p&~?j&~?a&~?c&~?r&~?s&~?e&~?t&:(= (mod (+
?p ?j (div (+ ?a ?e)10)) 10) ?c )))
(cripto (litera O)(cifra ?o&~?p&~?j&~?a&~?c&~?r&~?s&~?e&~?t))
(cripto (litera R)(cifra ?r&~?o&~?p&~?j&~?a&~?c&~?r&~?s&~?e&~?t)) (cripto (litera U)(cifra ?u&~?c&~?p&~?j&~?a&~?c&~?r&~?s&~?e&~?t&:(= (mod
(+ ?r ?r (div (+ ?o ?e)10)) 10) ?u )))
      =>
(printout t" "?p?r?o?j?e?c?t crlf) (printoutt" "?p?r?e?p?a?r?e crlf) (printout t "-----------" crlf)
(printout t " "?s ?u ?c ?c ?e ?s ?s crlf) (printout t " " crlf)
)
(run)
(reset)