(defglobal 
    ?*contador*=0
)

(deffacts facts
    (lista 5 3 8 14 7 res 0)
    (res 0)
    (num 21)
)

(defrule multiplicar
    ?f1 <- (lista $?w ?x ?y $?z res $?a ?x ?y $?z)
    ?f2 <- (* ?x ?y)
    =>
    (bind ?*contador* (+ ?*contador* ?f2))
    (retract ?f1)
    (assert (lista $?w $?z))
)

(defrule dividir
    ?f1 <- (lista $?w ?x ?y $?z res )
    (test (> ?x ?y))
    ?f2 <- (- ?x ?y)
    (= res ?f2)
    =>
    (bind ?*contador* (+ ?*contador* ?f2))
    (retract ?f1)
    (assert (lista $?w $?z)
)

(defrule restar
    ?f1 <- (lista $?w ?x ?y $?z)
    (test (> ?x ?y))
    ?f2 <- (- ?x ?y)
    =>
    (bind ?*contador* (+ ?*contador* ?f2))
    (retract ?f1)
    (assert (lista $?w $?z )
)

(defrule sumar
    ?f1 <- (lista $?w ?x ?y $?z)
    ?f2 <- (+ ?x ?y)
    =>
    (bind ?*contador* (+ ?*contador* ?f2))
    (retract ?f1)
    (assert (lista $?w $?z)
)

(defrule end
    (declare (salience 100))
    (test (and (= (length lista) 0)((= (length res) 0))
    (test (= ?*contador* 21))
    =>
    (printout t "Has llegado a 21 de de forma correcta" crlf)
    (halt)
)