(defglobal 
    ?*contador*=0
)

(deffacts facts
    (lista 5 3 8 14 7)
    (num 21)
)

(defrule multiplicar
    ?f1 <- (lista $?)
)

(defrule dividir

)

(defrule restar

)

(defrule sumar

)

(defrule end
    (declare (salience 100))
    test (= (?*contador*) 21)
    =>
    (halt)
)