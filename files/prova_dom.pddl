;Header and description

(define (domain prova_dom)

;remove requirements that are not needed
(:requirements :adl :derived-predicates :strips :typing :conditional-effects :negative-preconditions :equality)

(:types
    entity

    agent - entity 
    place - entity
    thing - entity

    id
)

(:predicates 
        (disjuncted ?a ?b - entity)     
        (follow ?x1 ?x2 - id)
        (Know ?x1 - id ?a - agent ?x2 - id)
        (See ?x1 - id  ?a - agent ?x2 - id)
        (hasStartId ?a - agent ?x - id)
        (isIn ?x1 - id ?e - entity ?p - entity) 
        (isPutting ?x2 - id ?a2 - agent ?o ?p - entity)
        (isGoing ?x1 - id ?a - agent ?p1 ?p2 - entity)
        (isHappy ?x1 - id ?a - agent ?x2 - id)
        (isSad ?a - agent)
        (ok)
        (ok2)
        (ok3)
        (ok4)
        (ok5)
)

(:derived (Know ?x1 - id  ?a - agent ?x2 - id)
        (and (See ?x1 ?a ?x2))
)

(:derived (Know ?x1 - id ?a2 - agent ?x2 - id)
        (exists (?a1 - agent ?p - entity)
            (and
                (Know ?x1 ?a1 ?x2)
                (isIn ?x2 ?a2 ?p)
                (hasStartId ?a1 ?x1)
            )
        ) 
)

(:derived (See ?x1 - id ?a2 - agent ?x3 - id)
        (exists (?x2 - id ?a1 - agent ?e ?p1 ?p2 - entity)
            (and
                (Know ?x1 ?a1 ?x2)
                (isIn ?x2 ?a2 ?p1)

                (Know ?x1 ?a1 ?x3)
                (isIn ?x3 ?e ?p2)

                (hasStartId ?a1 ?x1)

                (disjuncted ?a2 ?e)
            )
        )
)

(:derived (isIn ?x2 - id ?o - entity ?p - entity)
        (exists (?x1 - id ?a1 ?a2 - agent ?room - entity)
            (and
               ;(Know ?x1 ?a1 ?x2)
               (isIn ?x1 ?a1 ?room)
               (isPutting ?x2 ?a2 ?o ?p)

               ;(hasStartId ?a1 ?x1)
            )
        )
)

(:action make_change
    :parameters (?a ?b - entity ?ag1 ?ag2 - agent ?x1 ?x2 ?x3 ?x4 - id)
    :precondition(and 
            (isIn ?x2 ball ?a)
            (disjuncted ?a ?b)
            (follow ?x2 ?x3)
            (hasStartId robot ?x1)
            (isIn ?x4 ?ag2 room)
    )
    :effect (and 
            (isPutting ?x3 ?ag2 ball ?b)
            ;(Know ?x1 robot ?x3)
            (ok2)
    )
)

(:action test
    :parameters (?x1 ?x2 - id ?a1 ?a2 - agent ?o ?p - entity)
    :precondition (and 
                (Know ?x1 ?a1 ?x2)
                (isPutting ?x2 ?a2 ?o ?p)
                (isIn ?x2 ?o ?p)
                (ok2)
                ; (Know start anne three)
                ; (isIn three ball box1)
        )
    :effect (and 
                (ok5)
        )
)

)