(define (domain dom_prova)

(:requirements :adl :derived-predicates :strips :typing :conditional-effects :negative-preconditions :equality)

(:types
    entity
    agent - entity 
    place - entity
    thing - entity 

    phase
    id
)


(:predicates 
        (disjuncted ?a ?b - entity)     
        (Know ?x1 - id ?a - agent ?x2 - id)
        (See ?x1 - id  ?a - agent ?x2 - id)
        (hasStartId ?a - agent ?x - id)
        (isIn ?x1 - id ?e - entity ?p - entity) 
        (isPutting ?x2 - id ?a2 - agent ?o ?p - entity)
        (isGoing ?x1 - id ?a - agent ?p1 ?p2 - entity)
        (free ?x - id)
        (isSad ?a - agent)
        (isHappy ?x1 - id ?a - agent ?x2 - id) 
        (ok5)
        (say ?x - id)
)


;--- Red

;-- Rule 1
; (:action see_infer_know
;     :parameters (?x1 - id ?a - agent ?x2 - id)
;     :precondition (and 
;             (See ?x1 ?a ?x2)
;     )
;     :effect (and 
;             (Know ?x1 ?a ?x2)
;     )
; )

(:derived (Know ?x1 - id  ?a - agent ?x2 - id)
        (and (See ?x1 ?a ?x2))
)



;--- Green

;-- Rule 2
; (:action know_another_isIn
;     :parameters (?x1 - id ?a2 - agent ?x2 - id ?a1 - agent ?p - entity)
;     :precondition (and 
;             (Know ?x1 ?a1 ?x2)
;             (isIn ?x2 ?a2 ?p)
;             (hasStartId ?a1 ?x1)
;     )
;     :effect (and 
;             (Know ?x1 ?a2 ?x2)
;     )
; )

(:derived (Know ?x1 - id ?a2 - agent ?x2 - id)
        (exists (?a1 - agent ?p - entity)
            (and
                (Know ?x1 ?a1 ?x2)
                (isIn ?x2 ?a2 ?p)
                (hasStartId ?a1 ?x1)
            )
        ) 
)

;-- Rule 3
; (:action one_see_another
;     :parameters (?x1 ?x2 ?x3 - id ?a1 ?a2 - agent ?p1 ?e - entity)
;     :precondition (and 
;             (Know ?x1 ?a1 ?x2)
;             (isIn ?x2 ?a2 ?p1)

;             (Know ?x1 ?a1 ?x3)
;             (isIn ?x3 ?e ?p1)

;             (hasStartId ?a1 ?x1)

;             ;(disjuncted ?a2 ?e)
;     )
;     :effect (and 
;             (See ?x1 ?a2 ?x3)
;     )
; )

(:derived (See ?x1 - id ?a2 - agent ?x3 - id)
        (exists (?x2 - id ?a1 - agent ?e ?p1 - entity)
            (and
                (Know ?x1 ?a1 ?x2)
                (isIn ?x2 ?a2 ?p1)

                (Know ?x1 ?a1 ?x3)
                (isIn ?x3 ?e ?p1)

                (hasStartId ?a1 ?x1)

                ;(disjuncted ?a2 ?e)
            )
        )
)

; (:action one_dont_see_another
;     :parameters (?x1 ?x2 ?x3 ?x4 - id ?a1 ?a2 - agent ?p1 ?e - entity)
;     :precondition (and 
;             (Know ?x1 ?a1 ?x3)
;             (isIn ?x3 ?a2 ?p1)

;             (not (Know ?x1 ?a1 ?x4))
;             (isIn ?x4 ?e ?p1)

;             (hasStartId ?a1 ?x1)

;             ;(disjuncted ?a2 ?e)
;     )
;     :effect (and 
;             (not (See ?x1 ?a2 ?x4))
;             (not (Know ?x1 ?a2 ?x4))
;     )
; )

; (:action agent_know_isPutting
;     :parameters (?a2 - agent ?x2 - id ?a1 - agent ?o ?p - entity)
;     :precondition (and 
;             (Know start ?a1 ?x2)
;             (isPutting ?x2 ?a2 ?o ?p)
;             ;(hasStartId ?a1 ?x1)
;     )
;     :effect (and 
;             (Know start ?a2 ?x2)
;     )
; )



; (:action know_isGoing_infer_know
;     :parameters (?a2 - agent ?x2 - id ?a1 - agent ?p1 ?p2 - entity)
;     :precondition (and 
;             (Know start ?a1 ?x2)
;             (isGoing ?x2 ?a2 ?p1 ?p2)
;             ;(hasStartId ?a1 ?x1)
;     )
;     :effect (and 
;             (Know start ?a2 ?x2)
;     )
; )

(:derived (Know ?x1 - id ?a2 - agent ?x2 - id)
        (exists(?a1 - agent ?p1 ?p2 - place)
            (and
                (Know ?x1 ?a1 ?x2)
                (isGoing ?x2 ?a2 ?p1 ?p2)
                (hasStartId ?a1 ?x1)
            )
        )
)

; (:action isPutting_infer_See
;     :parameters (?x1 - id ?a3 - agent ?x4 - id ?a1 ?a2 - agent ?x2 ?x3 - id ?p1 ?p2 ?o - entity)
;     :precondition (and 
;             (Know ?x1 ?a1 ?x2)
;             (isIn ?x2 ?a2 ?p1)

;             (Know ?x1 ?a1 ?x3)
;             (isIn ?x3 ?a3 ?p1)

;             (Know ?x1 ?a1 ?x4)
;             (isPutting ?x4 ?a2 ?o ?p2)

;             (hasStartId ?a3 ?x1)
;             ;(disjuncted ?a2 ?a3)
;     )
;     :effect (and 
;             (See ?x1 ?a3 ?x4)
;     )
; )

(:derived (Know ?x1 - id ?a2 - agent ?x2 - id)
        (exists (?a1 - agent ?o - entity ?p - entity)
            (and
                (Know ?x1 ?a1 ?x2)
                (isPutting ?x2 ?a2 ?o ?p)
                (hasStartId ?a1 ?x1)
            )
        ) 
)

(:derived (Know ?x1 - id ?a3 - agent ?x4 - id)
        (exists (?x2 ?x3 - id ?a1 ?a2 - agent ?p1 ?p2 ?o - entity)
            (and
                (Know ?x1 ?a1 ?x2)
                (isIn ?x2 ?a2 ?p1)

                (Know ?x1 ?a1 ?x3)
                (isIn ?x3 ?a3 ?p1)

                (Know ?x1 ?a1 ?x4)
                (isPutting ?x4 ?a2 ?o ?p2)

                (hasStartId ?a1 ?x1)
                ;(disjuncted ?a2 ?a3)
            )
        )
)


; (:action isGoing_infer_See
;     :parameters (?x1 - id ?a3 - agent ?x4 - id ?a1 ?a2 - agent ?x2 ?x3 - id ?p1 ?p2 - entity)
;     :precondition (and 
;             (Know ?x1 ?a1 ?x2)
;             (isIn ?x2 ?a2 ?p1)

;             (Know ?x1 ?a1 ?x3)
;             (isIn ?x3 ?a3 ?p1)

;             (Know ?x1 ?a1 ?x4)
;             (isGoing ?x4 ?a2 ?p1 ?p2)

;             (hasStartId ?a3 ?x1)
;             ;(disjuncted ?a2 ?a3)
;     )
;     :effect (and 
;             (See ?x1 ?a3 ?x4)
;     )
; )

(:derived (Know ?x1 - id ?a3 - agent ?x4 - id)
        (exists(?x2 ?x3 - id ?a1 ?a2 - agent ?p1 ?p2 - entity)
            (and
                (Know ?x1 ?a1 ?x2)
                (isIn ?x2 ?a2 ?p1)

                (Know ?x1 ?a1 ?x3)
                (isIn ?x3 ?a3 ?p1)

                (Know ?x1 ?a1 ?x4)
                (isGoing ?x4 ?a2 ?p1 ?p2)

                (hasStartId ?a1 ?x1)
                ;(disjuncted ?a2 ?a3)
            )
        )
)


; (:action know_isPutting_infer_know_isIn
;     :parameters (?a1 - agent ?x2 - id ?o ?p - entity ?a2 - agent)
;     :precondition (and 
;             (Know start ?a1 ?x2)
;             (isPutting ?x2 ?a2 ?o ?p)

;             ;(hasStartId ?a1 ?x1)
;             ;(disjuncted ?a1 ?a2)
;     )
;     :effect (and 
;             ;(Know ?x1 ?a1 ?x2)
;             (isIn ?x2 ?o ?p)
;     )
; )

(:derived (isIn ?x2 - id ?o - entity ?p - entity)
        (exists (?x1 - id ?a1 ?a2 - agent)
            (and
                (Know ?x1 ?a1 ?x2)
                (isPutting ?x2 ?a2 ?o ?p)

                (hasStartId ?a1 ?x1)
            )
        )
)

; (:action know_isGoing_infer_know_isIn
;     :parameters (?a1 - agent ?x2 - id ?p1 ?p2 - entity ?a2 - agent)
;     :precondition (and 
;             (Know start ?a1 ?x2)
;             (isGoing ?x2 ?a2 ?p1 ?p2)

;             ;(hasStartId ?a1 ?x1)
;             (disjuncted ?p1 ?p2)
;     )
;     :effect (and 
;             ;(Know ?x1 ?a1 ?x2)
;             (isIn ?x2 ?a2 ?p2)
;     )
; )

(:derived (isIn ?x2 - id ?a2 - agent ?p2 - entity)
        (exists(?x1 - id ?a1 - agent ?p1 - entity)
            (and
                (Know ?x1 ?a1 ?x2)
                (isGoing ?x2 ?a2 ?p1 ?p2)

                (hasStartId ?a1 ?x1)
                (disjuncted ?p1 ?p2)
            )
        )
)




; (:action say_put 
;     :parameters (?a ?b - entity ?ag - agent ?x3 ?x4 ?x5 - id)
;     :precondition(and 
;             (Know start robot ?x3)
;             (isIn ?x3 ball ?a)
;             (isIn ?x5 ?ag ?a)
            
;             (free ?x4)
;             (disjuncted ?a ?b)
;     )
;     :effect (and 
;             (See start robot ?x4)
;             (isPutting ?x4 ?ag ball ?b)
;             (not (Know start robot ?x3))
;             (not (See start robot ?x3))
;             (not (free ?x4))
;     )
; )

(:action say_put 
    ;:parameters (?a ?b - entity ?ag - agent ?x1 ?x2 ?x3 ?x4 ?x5 - id)
    :parameters (?x1 ?x3 ?x4 ?x5 - id ?ag - agent ?a ?b - entity)
    :precondition(and 
            (Know ?x1 robot ?x3)
            (isIn ?x3 ball ?a)

            (Know ?x1 robot ?x5)
            (isIn ?x5 ?ag ?a)

            ; (Know ?x1 robot ?x6)
            ; (isIn ?x6 ?b ?a)
            
            ;(isIn ?x2 robot room)

            ;(follow ?x3 ?x4)
            (free ?x4)
            (disjuncted ?a ?b)
            (hasStartId robot ?x1)

            ;(ok)
    )
    :effect (and 
            (See ?x1 robot ?x4)
            (isPutting ?x4 ?ag ball ?b)
            ;(not (See ?x1 robot ?x3))
            ;(not (Know ?x1 robot ?x3))
            (not (free ?x4))
            ;(ok2)
    )
)



(:action say_go 
    :parameters (?a ?b - entity ?ag - agent ?x3 ?x4 - id)
    :precondition(and 
            (Know start robot ?x3)
            (isIn ?x3 ?ag ?a)

            (free ?x4)
            (disjuncted ?a ?b)
    )
    :effect (and 
            (See start robot ?x4)
            (isGoing ?x4 ?ag ?a ?b)
            (not (free ?x4))
            ;(not (Know start robot ?x3))
            ;(not (See start robot ?x3))
    )
)


(:action test
    :parameters (?ag - agent ?p - entity)
    :precondition (and 
                ; (Know start sally eight)
                ; (isPutting eight anne ball box1)
                (Know start anne eight)
                (isIn eight ball box1)
                (Know start anne nine)
                (isGoing nine sally room ?p)
                (isIn nine sally ?p)
        )
    :effect (and 
                (ok5)
        )
)

)

