(defglobal 
    ?*contador*=0
)

(deffacts facts
    (lista 5 3 8 14 7)
    (num 21)
)

(defrule multiplicar
    ?f1 <- (lista $?w ?x ?y $?z)
    ?f2 <- (* ?x ?y)
    =>
    (bind ?*contador* (+ ?*contador* ?f2))
    (retract ?f1)
    (assert (lista $?w $?z))
)

(defrule dividir
    ?f1 <- (lista $?w ?x ?y $?z)
    (test (> ?x ?y))
    ?f2 <- (- ?x ?y)
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
    test (= (?*contador*) 21)
    =>
    (printout t "Has llegado a 21 de de forma correcta" crlf)
    (halt)
)