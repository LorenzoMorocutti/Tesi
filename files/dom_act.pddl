(define (domain dom_act)

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
        (follow ?x2 ?x1 - id)
        (free ?x - id)
        (isSad ?a - agent)
        (isHappy ?x1 - id ?a - agent ?x2 - id) 
        (ok) 
        (ok2)
        (ok3)
        (ok4)
        (ok5)
)


;--- Red

;-- Rule 1
(:action see_infer_know
    :parameters (?x1 - id ?a - agent ?x2 - id)
    :precondition (and 
            (See ?x1 ?a ?x2)
    )
    :effect (and 
            (Know ?x1 ?a ?x2)
    )
)



;--- Green

;-- Rule 2
(:action know_another_isIn
    :parameters (?x1 - id ?a2 - agent ?x2 - id ?a1 - agent ?p - entity)
    :precondition (and 
            (Know ?x1 ?a1 ?x2)
            (isIn ?x2 ?a2 ?p)
            (hasStartId ?a1 ?x1)
    )
    :effect (and 
            (Know ?x1 ?a2 ?x2)
    )
)

;-- Rule 3
(:action one_see_another
    :parameters (?x1 ?x2 ?x3 - id ?a1 ?a2 - agent ?p1 ?e - entity)
    :precondition (and 
            (Know ?x1 ?a1 ?x2)
            (isIn ?x2 ?a2 ?p1)

            (Know ?x1 ?a1 ?x3)
            (isIn ?x3 ?e ?p1)

            (hasStartId ?a1 ?x1)

            ;(disjuncted ?a2 ?e)
    )
    :effect (and 
            (See ?x1 ?a2 ?x3)
    )
)


(:action one_dont_see_another
    :parameters (?x1 ?x2 ?x3 ?x4 - id ?a1 ?a2 - agent ?p1 ?e - entity)
    :precondition (and 
            (Know ?x1 ?a1 ?x3)
            (isIn ?x3 ?a2 ?p1)

            (not (Know ?x1 ?a1 ?x4))
            (isIn ?x4 ?e ?p1)

            (hasStartId ?a1 ?x1)

            ;(disjuncted ?a2 ?e)
    )
    :effect (and 
            (not (See ?x1 ?a2 ?x4))
            (not (Know ?x1 ?a2 ?x4))
    )
)

(:action agent_know_isPutting
    :parameters (?x1 - id ?a2 - agent ?x2 - id ?a1 - agent ?o ?p - entity)
    :precondition (and 
            (Know ?x1 ?a1 ?x2)
            (isPutting ?x2 ?a2 ?o ?p)
            (hasStartId ?a1 ?x1)
    )
    :effect (and 
            (Know ?x1 ?a2 ?x2)
    )
)

(:action isPutting_infer_See
    :parameters (?x1 - id ?a3 - agent ?x4 - id ?a1 ?a2 - agent ?x2 ?x3 - id ?p1 ?p2 ?o - entity)
    :precondition (and 
            (Know ?x1 ?a1 ?x2)
            (isIn ?x2 ?a2 ?p1)

            (Know ?x1 ?a1 ?x3)
            (isIn ?x3 ?a3 ?p1)

            (Know ?x1 ?a1 ?x4)
            (isPutting ?x4 ?a2 ?o ?p2)

            (hasStartId ?a3 ?x1)
            ;(disjuncted ?a2 ?a3)
    )
    :effect (and 
            (See ?x1 ?a3 ?x4)
    )
)

(:action know_isPutting_infer_know_isIn
    :parameters (?x1 - id ?a1 - agent ?x2 - id ?o ?p - entity ?a2 - agent)
    :precondition (and 
            (Know ?x1 ?a1 ?x2)
            (isPutting ?x2 ?a2 ?o ?p)

            (hasStartId ?a1 ?x1)
            ;(disjuncted ?a1 ?a2)
    )
    :effect (and 
            ;(Know ?x1 ?a1 ?x2)
            (isIn ?x2 ?o ?p)
    )
)


(:action know_isGoing_infer_know
    :parameters (?x1 - id ?a2 - agent ?x2 - id ?a1 - agent ?p1 ?p2 - entity)
    :precondition (and 
            (Know ?x1 ?a1 ?x2)
            (isGoing ?x2 ?a2 ?p1 ?p2)
            (hasStartId ?a1 ?x1)
    )
    :effect (and 
            (Know ?x1 ?a2 ?x2)
    )
)

(:action isGoing_infer_See
    :parameters (?x1 - id ?a3 - agent ?x4 - id ?a1 ?a2 - agent ?x2 ?x3 - id ?p1 ?p2 - entity)
    :precondition (and 
            (Know ?x1 ?a1 ?x2)
            (isIn ?x2 ?a2 ?p1)

            (Know ?x1 ?a1 ?x3)
            (isIn ?x3 ?a3 ?p1)

            (Know ?x1 ?a1 ?x4)
            (isGoing ?x4 ?a2 ?p1 ?p2)

            (hasStartId ?a3 ?x1)
            ;(disjuncted ?a2 ?a3)
    )
    :effect (and 
            (See ?x1 ?a3 ?x4)
    )
)

(:action know_isGoing_infer_know_isIn
    :parameters (?x1 - id ?a1 - agent ?x2 - id ?p1 ?p2 - entity ?a2 - agent)
    :precondition (and 
            (Know ?x1 ?a1 ?x2)
            (isGoing ?x2 ?a2 ?p1 ?p2)

            (hasStartId ?a1 ?x1)
            ;(disjuncted ?a1 ?a2)
    )
    :effect (and 
            ;(Know ?x1 ?a1 ?x2)
            (isIn ?x2 ?a2 ?p2)
    )
)
;--- Blue


;-- Rule 5
; (:action isPutting_infer_See
;     :parameters (?a1 ?a2 ?a3 - agent ?x1 ?x2 ?x3 ?x4 ?x5 - id ?p1 ?p2 ?room ?o - entity)
;     :precondition (and 
;             (Know ?x1 ?a1 ?x2)
;             (isIn ?x2 ?a2 ?room)

;             (Know ?x1 ?a1 ?x3)
;             (isIn ?x3 ?a3 ?room)

;             (Know ?x1 ?a1 ?x4)
;             (isIn ?x4 ?o ?p1)

;             (Know ?x1 ?a1 ?x5)
;             (isPutting ?x5 ?a2 ?o ?p2)

;             (hasStartId ?a1 ?x1)
;             ;(disjuncted ?a2 ?a3)
;     )
;     :effect (and 
;             (Know ?x1 ?a1 ?x5)
;             (not(Know ?x1 ?a1 ?x4))
;             (Know ?x1 ?a2 ?x5)
;             (See ?x1 ?a3 ?x5)

;             ;(not (isIn ?x4 ?o ?p1))
;             (isIn ?x5 ?o ?p2)
;     )
; )

;-----------; (:action agent_know_isPutting
;     :parameters (?x1 - id ?a2 - agent ?x2 - id ?a1 - agent ?o ?p - entity)
;     :precondition (and 
;             (Know ?x1 ?a1 ?x2)
;             (isPutting ?x2 ?a2 ?o ?p)
;             (hasStartId ?a1 ?x1)
;     )
;     :effect (and 
;             (Know ?x1 ?a2 ?x2)
;     )
; )

;-- Rule 9
; (:action know_isIn_infer_know_isGoing
;     :parameters (?x1 ?x4 ?x2 ?x3 - id  ?a3 ?a1 ?a2 - agent ?p1 ?p2 - entity)
;     :precondition (and 
;             (Know ?x1 ?a1 ?x2)
;             (isIn ?x2 ?a2 ?p1)

;             (Know ?x1 ?a1 ?x3)
;             (isIn ?x3 ?a3 ?p1)

;             (Know ?x1 ?a1 ?x2)
;             (isGoing ?x2 ?a2 ?p1 ?p2)

;             (hasStartId ?a1 ?x1)
;             ;(disjuncted ?a2 ?a3) 
;     )
;     :effect (and 
;             (Know ?x1 ?a1 ?x2)
;             (See ?x1 ?a2 ?x2)
;             (See ?x1 ?a3 ?x2)
;             (not(isIn ?x2 ?a2 ?p1))
;             (isIn ?x2 ?a2 ?p2)
;     )
; )



; (:action send_away
;     :parameters (?a - agent ?x1 ?x2 - id)
;     :precondition (and
;             (isIn ?x2 ?a room)
;             (hasStartId robot ?x1)
;     )
;     :effect (and 
;             (isGoing ?x2 ?a room elsewhere)
;             (Know ?x1 robot ?x2)
;             (ok)
;     )
; )


(:action say_put 
    :parameters (?a ?b - entity ?ag - agent ?x1 ?x2 ?x3 ?x4 ?x5 - id)
    :precondition(and 
            (Know ?x1 robot ?x3)
            (isIn ?x3 ball ?a)
            (isIn ?x5 ?ag ?a)
            
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
            (not (Know ?x1 robot ?x3))
            (not (See ?x1 robot ?x3))
            (not (free ?x4))
            ;(ok2)
    )
)

(:action say_go 
    :parameters (?a ?b - entity ?ag - agent ?x1 ?x2 ?x3 ?x4 - id)
    :precondition(and 
            (Know ?x1 robot ?x3)
            (isIn ?x3 ?ag ?a)
            ;(isIn ?x5 ?ag ?a)
            
            ;(isIn ?x2 robot room)

            ;(follow ?x3 ?x4)
            (free ?x4)
            (disjuncted ?a ?b)
            (hasStartId robot ?x1)

            ;(ok)
    )
    :effect (and 
            (See ?x1 robot ?x4)
            (isGoing ?x4 ?ag ?a ?b)
            (not (Know ?x1 robot ?x3))
            (not (See ?x1 robot ?x3))
            ;(ok2)
    )
)

; (:action recall_in
;     :parameters (?a - agent ?x1 ?x2 - id)
;     :precondition (and 
;             (isIn ?x2 ?a elsewhere)
;             (hasStartId robot ?x1)
;     )
;     :effect (and 
;             ;(not(isIn ?x2 ?a elsewhere))
;             (isGoing ?x2 ?a elsewhere room)
;             (Know ?x1 robot ?x2)
;     )
; )

; (:action make_sad
;     :parameters (?a - agent ?x1 ?x2 ?x3 ?x4 - id ?p1 ?p2 - entity)
;     :precondition (and 
;         ;     (Know ?x1 robot ?x4)
;         ;     (isIn ?x4 ?a room)
;             (Know ?x1 robot ?x2)
;             (isIn ?x2 ball ?p1)
;             (Know ?x1 ?a ?x3)
;             (isIn ?x3 ball ?p2)
            
;             (isIn ?x4 ?a room)
;             (disjuncted ?p1 ?p2)
;     )
;     :effect (and 
;             (isSad ?a)
;     )
; )

(:action test
    :parameters (?x1 - id)
    :precondition (and 
                (Know start robot ?x1)
                (isIn ?x1 sally elsewhere)
                ; (Know start robot ?x2)
                ; (isIn ?x2 anne ?p2)
                ; (disjuncted ?p1 ?p2)
                ;(isGoing ?x1 robot ?p1 elsewhere)
                ;(isPutting ?x1 robot ?o elsewhere)
                ;(isIn ?x1 ball box1)
        )
    :effect (and 
                (ok5)
        )
)


)

