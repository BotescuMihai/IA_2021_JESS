(defrule startup
  =>
  (printout t "The problem is" crlf)
  (printout t "   SEND" crlf)
  (printout t " + MORE" crlf)
  (printout t "   ------" crlf)
  (printout t " = MONEY" crlf)
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
          (letter S)
          (letter E)
          (letter N)
          (letter D)
          (letter M)
          (letter O)
          (letter R)
          (letter Y)))

(deftemplate combination (slot letter (type SYMBOL)) (slot number (type INTEGER)))
(defrule generate-combinations
  (number ?x)
  (letter ?a)
  =>
  (assert (combination (letter ?a) (number ?x))))

(defrule find-solution
    (combination (letter M) (number ?m&: (= 1 ?m)))
    (combination (letter O) (number ?o&: (= 0 ?o)))
    (combination (letter S) (number ?s&: (= 9 ?s)))
    (combination (letter D) (number ?d&~?m&~?o&~?s&))
    (combination (letter E) (number ?e&~?d&~?m&~?o&~?s&))
    
    (combination (letter Y) (number ?y&~?d&~?e&~?m&~?o&~?s&: (= (mod (+ ?d ?e) 10) ?y)))
    (combination (letter N) (number ?n&~?y&~?d&~?e&~?m&~?o&~?s&: (= (+ ?e 1) ?n)))
    (combination (letter R) (number ?r&~?d&~?e&~?m&~?o&~?s&~?y&~?n&: (= (mod (+ ?n ?r 
                        											(/ (+ ?d ?e) 10)) 10) ?e)))
	 
  =>
  (printout t "A solution is:" crlf)
  (printout t "  S = " ?s )
  (printout t "  E = " ?e )
  (printout t "  N = " ?n )
  (printout t "  D = " ?d )
  (printout t "  M = " ?m )
  (printout t "  O = " ?o )
  (printout t "  R = " ?r )
  (printout t "  Y = " ?y )
    
  (printout t crlf)
  (printout t "   " ?s ?e ?n ?d crlf)
  (printout t " + " ?m ?o ?r ?e crlf) 
  (printout t "   " "------" crlf)
  (printout t " = " ?m ?o ?n ?e ?y crlf))  
  
(reset)
(run)
