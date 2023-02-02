(define (domain annsally_domain)

(:requirements :adl :derived-predicates :strips :typing :conditional-effects :negative-preconditions :equality)

(:types
    entity
    agent - entity 
    place - entity
    cosa - entity 

    phase    
    id
)


(:predicates 
        (disjuncted ?a ?b - entity)     
        (Know ?x1 - id ?a - agent ?x2 - id ?v - phase)
        (See ?x1 - id  ?a - agent ?x2 - id ?v - phase)
        (hasStartId ?a - agent ?x - id)
        (isIn ?x1 - id ?e - entity ?p - entity ?v - phase) 
        (isPutting ?x2 - id ?a2 - agent ?o ?p - entity  ?v - phase)
        (isGoing ?x1 - id ?a - agent ?p1 ?p2 - entity ?v - phase)
        (follow ?v2 ?v1 - phase)
        (isHappy ?x1 - id ?a - agent ?x2 - id ?v - phase)
        (ok)
)

(:functions
    (ask_to_leave)
)

;--- Red
(:derived (Know ?x1 - id  ?a - agent ?x2 - id ?v - phase)
        (and (See ?x1 ?a ?x2 ?v))
)


; ;--- Green
(:derived (Know ?x1 - id ?a2 - agent ?x2 - id ?v - phase)
        (exists (?a1 - agent ?p - entity)
            (and
                (Know ?x1 ?a1 ?x2 ?v)
                (isIn ?x2 ?a2 ?p ?v)
                (hasStartId ?a1 ?x1)
            )
        ) 
)

(:derived (See ?x1 - id ?a2 - agent ?x3 - id ?v - phase)
        (exists (?x2 - id ?a1 - agent ?e ?p - entity)
            (and
                (Know ?x1 ?a1 ?x2 ?v)
                (isIn ?x2 ?a2 ?p ?v)

                (Know ?x1 ?a1 ?x3 ?v)
                (isIn ?x3 ?e ?p ?v)

                (hasStartId ?a1 ?x1)

                ;(disjuncted ?a2 ?e)
            )
        )
)

; ;--- Blue
(:derived (Know ?x1 - id ?a2 - agent ?x2 - id ?v - phase)
        (exists (?a1 - agent ?o - entity ?p - entity)
            (and
                (Know ?x1 ?a1 ?x2 ?v)
                (isPutting ?x2 ?a2 ?o ?p ?v)
                (hasStartId ?a1 ?x1)
            )
        ) 
)

(:derived (See ?x1 - id ?a3 - agent ?x4 - id ?v - phase)
        (exists (?x2 ?x3 - id ?a1 ?a2 - agent ?p1 ?p2 ?o - entity)
            (and
                (Know ?x1 ?a1 ?x2 ?v)
                (isIn ?x2 ?a2 ?p1 ?v)

                (Know ?x1 ?a1 ?x3 ?v)
                (isIn ?x3 ?a3 ?p1 ?v)

                (Know ?x1 ?a1 ?x4 ?v)
                (isPutting ?x4 ?a2 ?o ?p2 ?v)

                (hasStartId ?a3 ?x1)
                (disjuncted ?a2 ?a3)
            )
        )
)

; ;--- Same rule
(:derived (Know ?x1 - id ?a1 - agent ?x2 - id ?v2 - phase)
        (exists(?a2 - agent ?o ?p - entity ?v1 - phase)
            (and
                (Know ?x1 ?a1 ?x2 ?v1)
                (isPutting ?x2 ?a2 ?o ?p ?v1)

                (hasStartId ?a1 ?x1)
                (follow ?v2 ?v1)
                (disjuncted ?a1 ?a2)
            )
        )
)

(:derived (isIn ?x2 - agent ?o - entity ?p - entity ?v2  - phase)
        (exists (?x1 - id ?a1 ?a2 - agent ?v1 - phase)
            (and
                (Know ?x1 ?a1 ?x2 ?v1)
                (isPutting ?x2 ?a2 ?o ?p ?v1)

                (hasStartId ?a1 ?x1)
                (follow ?v2 ?v1)
                (disjuncted ?a1 ?a2)
            )
        )
)
; ;---

; ;--- Same rule
(:derived (Know ?x1 - id ?a1 - agent ?x2 - id ?v2 - phase)
        (exists(?o - entity ?p - entity ?v1 - phase)
            (and
                (Know ?x1 ?a1 ?x2 ?v1)
                (hasStartId ?a1 ?x1)
                (isPutting ?x2 ?a1 ?o ?p ?v1)
                (follow ?v2 ?v1)
            )
        )
)

(:derived (isIn ?x2 - id ?o - entity ?p - entity ?v2 - phase)
        (exists (?x1 - id ?a1 - agent ?v1 - phase)
            (and
                (Know ?x1 ?a1 ?x2 ?v1)
                (hasStartId ?a1 ?x1)
                (isPutting ?x2 ?a1 ?o ?p ?v1)
                (follow ?v2 ?v1)
            )
        )
)
; ;---


; ;--- White 
(:derived (Know ?x1 - id ?a2 - agent ?x2 - id ?v - phase)
        (exists(?a1 - agent ?p1 ?p2 - place)
            (and
                (Know ?x1 ?a1 ?x2 ?v)
                (hasStartId ?a1 ?x1)
                (isGoing ?x2 ?a2 ?p1 ?p2 ?v)
            )
        )
)

(:derived (See ?x1 - id ?a3 - agent ?x4 - id ?v - phase)
        (exists(?x2 ?x3 - id ?a1 ?a2 - agent ?p1 ?p2 - entity)
            (and
                (Know ?x1 ?a1 ?x2 ?v)
                (isIn ?x2 ?a2 ?p1 ?v)

                (Know ?x1 ?a1 ?x3 ?v)
                (isIn ?x3 ?a3 ?p1 ?v)

                (Know ?x1 ?a1 ?x4 ?v)
                (isGoing ?x4 ?a2 ?p1 ?p2 ?v)

                (hasStartId ?a1 ?x1)
                (disjuncted ?a2 ?a3)
            )
        )
)

; ;--- Same rule
(:derived (Know ?x1 - id ?a1 - agent ?x2 - id ?v2 - phase)
        (exists(?a2 - agent ?v1 - phase ?p1 ?p2 - entity)
            (and
                (Know ?x1 ?a1 ?x2 ?v1)
                (hasStartId ?a1 ?x1)
                (isGoing ?x2 ?a2 ?p1 ?p2 ?v1)
                (follow ?v2 ?v1)
                (disjuncted ?a1 ?a2)
            )
        )
)

(:derived (isIn ?x2 - id ?a2 - agent ?p2 - entity ?v2 - phase)
        (exists(?x1 - id ?a1 - agent ?v1 - phase ?p1 - entity)
            (and
                (Know ?x1 ?a1 ?x2 ?v1)
                (hasStartId ?a1 ?x1)
                (isGoing ?x2 ?a2 ?p1 ?p2 ?v1)
                (follow ?v2 ?v1)
                (disjuncted ?a1 ?a2)
            )
        )
)
; ;---

; ;--- Same rule
(:derived (Know ?x1 - id ?a - agent ?x2 - id ?v2 - phase)
        (exists(?v1 - phase ?p1 ?p2 - entity)
            (and
                (Know ?x1 ?a ?x2 ?v1)
                (isGoing ?x2 ?a ?p1 ?p2 ?v1)
                
                (hasStartId ?a ?x1)
                (follow ?v2 ?v1)
            )
        )
)

(:derived (isIn ?x2 - id ?a - agent ?p2 - entity ?v2 - phase)
        (exists(?x1 - id ?v1 - phase ?p1 - entity)
            (and
                (Know ?x1 ?a ?x2 ?v1)
                (isGoing ?x2 ?a ?p1 ?p2 ?v1)

                (hasStartId ?a ?x1)
                (follow ?v2 ?v1)
            )
        )
)


; (:action 
;     :parameters ()
;     :precondition (and )
;     :effect (and )
; )



(:action test
    :parameters (?x2 - id ?p - entity ?v - phase)
    :precondition (and 
                ;(= (check_presence) 0)
                (Know start anne ?x2 second)
                (isIn ?x2 ball ?p second)
        )
    :effect (and 
                ;(not (Know start robot ?x2 ?v))
                (ok)
        )
)

)

