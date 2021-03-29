(defglobal 
    ?*contador*=0
)

(deffacts facts
    (lista 5 3 8 14 7 res 0)
    (num 21)
)

(defrule multiplicar
    ?f1 <- (lista $?w ?x ?y $?z res $?a)
    (test (>= (length(lista) 1)))
    ?f2 <- (* ?x ?y)
    =>
    (bind ?*contador* (+ ?*contador* ?f2))
    (retract ?f1)
    (assert (lista $?w $?z res $?a)
)

(defrule multiplicar-con-res ;se utiliza cuando solo queda un numero en "lista"
    ?f1 <- (lista $?w ?x $?z res $?a ?b $?c)
    ?f2 <- (* ?x ?b)
    =>
    (bind ?*contador* (+ ?*contador* ?f2))
    (retract ?f1)
    (assert (lista $?w $?z res $?a $?c)
)

(defrule dividir
    ?f1 <- (lista $?w ?x ?y $?z res $?a)
    (test (>= (length(lista) 1)))
    (test (= (mod ?x ?y) 0))
    ?f2 <- (div ?x ?y)
    
    (= res ?f2)
    =>
    (bind ?*contador* (+ ?*contador* ?f2))
    (retract ?f1)
    (assert (lista $?w $?z)
)

(defrule dividir-con-res
    ?f1 <- (lista $?w ?x ?y $?z res $?a ?b $?c)
    (test (= (mod ?x ?y) 0))
    ?f2 <- (div ?x ?y)
    =>
    (bind ?*contador* (+ ?*contador* ?f2))
    (retract ?f1)
    (assert (lista $?w $?z)
)

(defrule restar
    ?f1 <- (lista $?w ?x ?y $?z res $?a)
    (test (>= (length(lista) 1)))
    (test (> ?x ?y))
    ?f2 <- (- ?x ?y)
    =>
    (bind ?*contador* (+ ?*contador* ?f2))
    (retract ?f1)
    (assert (lista $?w $?z )
)

(defrule restar-con-res
    ?f1 <- (lista $?w ?x ?y $?z res $?a ?b $?c)
    (test (> ?x ?b))
    ?f2 <- (- ?x ?b)
    =>
    (bind ?*contador* (+ ?*contador* ?f2))
    (retract ?f1)
    (assert (lista $?w $?z )
)

(defrule sumar
    ?f1 <- (lista $?w ?x ?y $?z res $?a)
    (test (>= (length(lista) 1)))
    ?f2 <- (+ ?x ?y)
    =>
    (bind ?*contador* (+ ?*contador* ?f2))
    (retract ?f1)
    (assert (lista $?w $?z)
)

(defrule sumar-con-res
    ?f1 <- (lista $?w ?x ?y $?z res $?a ?b $?c)
    ?f2 <- (+ ?x ?b)
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