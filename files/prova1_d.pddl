;Header and description

(define (domain prova1_d)

;remove requirements that are not needed
(:requirements :adl :derived-predicates :strips :typing :conditional-effects :negative-preconditions :equality)

(:types 
    agent
)

; un-comment following line if constants are needed
;(:constants )

(:predicates 
    (padre ?x ?y - agent)
    (nonno ?x ?y - agent)
    (nonna ?x ?y - agent)
)


(:derived (nonna ?x ?y - agent)
        (nonno ?x ?y)
)

(:action make_nonno
    :parameters (?x ?y ?z - agent)
    :precondition (and 
            (padre ?x ?z)
            (padre ?z ?y)
    )
    :effect (and 
            (nonno ?x ?y)
    )
)


)