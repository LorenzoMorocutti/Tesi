(define (domain dom)

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

(:functions
    (ask_to_leave)
)

;--- Red
(:derived (Know ?x1 - id  ?a - agent ?x2 - id)
        (and (See ?x1 ?a ?x2))
)


; ;--- Green
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
                (isIn ?x3 ?e ?p1)

                (hasStartId ?a1 ?x1)

                (disjuncted ?a2 ?e)
            )
        )
)

;--- Blue

; --Same rule 

(:derived (Know ?x1 - id ?a2 - agent ?x5 - id)
        (exists (?x2 ?x4 - id ?a2 - agent ?room ?p1 ?p2 ?o - entity)
            (and
               (Know ?x1 ?a1 ?x2)
               (or (isIn ?x2 ?a1 ?room) (isIn ?x2 ?a2 ?room) )

               (Know ?x1 ?a1 ?x4)
               (isIn ?x4 ?o ?p1)

               (Know ?x1 ?a1 ?x5)
               (isPutting ?x5 ?a2 ?o ?p2)

               (hasStartId ?a1 ?x1)
            )
        )
)

(:derived (isIn ?x5 - id ?o - entity ?p2 - entity)
        (exists (?x1 ?x2 ?x4 - id ?a1 ?a2 - agent ?room ?p1 - entity)
            (and
          (Know ?x1 ?a1 ?x2)
               (or (isIn ?x2 ?a1 ?room) (isIn ?x2 ?a2 ?room) )

               (Know ?x1 ?a1 ?x4)
               (isIn ?x4 ?o ?p1)

               (Know ?x1 ?a1 ?x5)
               (isPutting ?x5 ?a2 ?o ?p2)

               (hasStartId ?a1 ?x1)
            )
        )
)

; (:derived (Know ?x1 - id ?a2 - agent ?x5 - id)
;         (exists (?x2 ?x3 ?x4 - id ?a1 ?a3 - agent ?room ?p1 ?p2 ?o - entity)
;             (and
;                (Know ?x1 ?a1 ?x2)
;                (isIn ?x2 ?a2 ?room)

;                (disjuncted ?a1 ?a2)

;             ;    (Know ?x1 ?a1 ?x3)
;             ;    (isIn ?x3 ?a3 ?room)

;                (Know ?x1 ?a1 ?x4)
;                (isIn ?x4 ?o ?p1)

;                (Know ?x1 ?a1 ?x5)
;                (isPutting ?x5 ?a1 ?o ?p2)

;                (hasStartId ?a1 ?x1)
;             )
;         )
; )

; ; (:derived (See ?x1 - id ?a3 - agent ?x5 - id)
; ;         (exists (?x2 ?x3 ?x4 - id ?a1 ?a2 - agent ?room ?p1 ?p2 ?o - entity)
; ;             (and
; ;                (Know ?x1 ?a1 ?x2)
; ;                (isIn ?x2 ?a2 ?room)

; ;             ;    (Know ?x1 ?a1 ?x3)
; ;             ;    (isIn ?x3 ?a3 ?room)

; ;                (Know ?x1 ?a1 ?x4)
; ;                (isIn ?x4 ?o ?p1)

; ;                (Know ?x1 ?a1 ?x5)
; ;                (isPutting ?x5 ?a1 ?o ?p2)

; ;                (hasStartId ?a1 ?x1)
; ;             )
; ;         )
; ; )


; (:derived (isIn ?x5 - id ?o - entity ?p2 - entity)
;         (exists (?x1 - id ?a1 ?a2 - agent)
;             (and
;                (Know ?x1 ?a1 ?x5)
;                (isPutting ?x5 ?a2 ?o ?p2)

;                (hasStartId ?a1 ?x1)
;             )
;         )
; )


; ;--- White 

; -- Same rule
(:derived (Know ?x1 - id ?a1 - agent ?x2 - id)
        (exists(?x3 - id ?a2 ?a3 - agent ?p1 ?p2 - entity)
            (and
                (Know ?x1 ?a1 ?x2)
                (isIn ?x2 ?a2 ?p1)

                (Know ?x1 ?a1 ?x3)
                (isIn ?x3 ?a3 ?p1)

                (Know ?x1 ?a1 ?x2)
                (isGoing ?x2 ?a2 ?p1 ?p2)

                (hasStartId ?a1 ?x1)
                ;(disjuncted ?a2 ?a3)
            )
        )
)

(:derived (See ?x1 - id ?a2 - agent ?x2 - id)
        (exists(?x3 - id ?a3 ?a2 - agent ?p1 ?p2 - entity)
            (and
                (Know ?x1 ?a1 ?x2)
                (isIn ?x2 ?a2 ?p1)

                (Know ?x1 ?a1 ?x3)
                (isIn ?x3 ?a3 ?p1)

                (Know ?x1 ?a1 ?x2)
                (isGoing ?x2 ?a2 ?p1 ?p2)

                (hasStartId ?a1 ?x1)
                ;(disjuncted ?a2 ?a3)
            )
        )
)

(:derived (See ?x1 - id ?a3 - agent ?x2 - id)
        (exists(?x3 - id ?a1 ?a2 - agent ?p1 ?p2 - entity)
            (and
                (Know ?x1 ?a1 ?x2)
                (isIn ?x2 ?a2 ?p1)

                (Know ?x1 ?a1 ?x3)
                (isIn ?x3 ?a3 ?p1)

                (Know ?x1 ?a1 ?x2)
                (isGoing ?x2 ?a2 ?p1 ?p2)

                (hasStartId ?a1 ?x1)
                ;(disjuncted ?a2 ?a3)
            )
        )
)

(:derived (isIn ?x2 - id ?a2 - agent ?p2 - entity)
        (exists(?x1 ?x3 - id ?a3 ?a2 - agent ?p1 - entity)
            (and
                (Know ?x1 ?a1 ?x2)
                (isIn ?x2 ?a2 ?p1)

                (Know ?x1 ?a1 ?x3)
                (isIn ?x3 ?a3 ?p1)

                (Know ?x1 ?a1 ?x2)
                (isGoing ?x2 ?a2 ?p1 ?p2)

                (hasStartId ?a1 ?x1)
                ;(disjuncted ?a2 ?a3)
            )
        )
)


(:action send_away
    :parameters (?a - agent ?x1 ?x2 - id)
    :precondition (and
            (isIn ?x2 anne room)
            (hasStartId robot ?x1)
    )
    :effect (and 
            ;(not (isIn ?x2 anne room))
            (isGoing ?x2 anne room elsewhere)
            (Know ?x1 robot ?x2)
            (ok)
    )
)

(:action make_change
    :parameters (?a ?b - entity ?ag2 - agent ?x1 ?x2 ?x3 ?x4 - id)
    :precondition(and 
            (isIn ?x2 ball ?a)
            (isIn ?x3 ?ag2 room)

            (follow ?x2 ?x4)
            (disjuncted ?a ?b)
            (hasStartId robot ?x1)
            (ok)
    )
    :effect (and 
            ;(not (isIn ?x3 ball ?a))
            (isPutting ?x4 ?ag2 ball ?b)
            (Know ?x1 robot ?x4)
            (ok2)
    )
)

; (:action recall_in
;     :parameters (?a - agent ?x1 ?x2 - id)
;     :precondition (and 
;             (isIn ?x2 ?a elsewhere)
;             (hasStartId robot ?x1)
;     )
;     :effect (and 
;             (not(isIn ?x2 ?a elsewhere))
;             (isGoing ?x2 ?a elsewhere room)
;             (See ?x1 robot ?x2)
;             (ok3)
;     )
; )

; (:action make_sad
;     :parameters (?a - agent ?x1 ?x2 ?x3 - id ?p1 ?p2 - entity)
;     :precondition (and 
;             ; (Know ?x1 robot ?x4)
;             ; (isIn ?x4 ?a room)
;             (Know ?x1 robot ?x2)
;             (isIn ?x2 ball ?p1)
;             (Know ?x1 ?a ?x3)
;             (isIn ?x3 ball ?p2)
;             (disjuncted ?p1 ?p2)
;             (ok)
;             (ok2)
;     )
;     :effect (and 
;             (isSad ?a)
;             ;(ok4)
;     )
; )


(:action test
    :parameters (?x1 ?x2 ?x3 ?x4 - id ?p1 - entity)
    :precondition (and 
                (Know ?x1 robot seven)
                (isIn seven ball ?p1)
                (Know ?x4 ?a ?x3)
                (isIn ?x3 ball ?p2)
                (disjuncted ?p1 ?p2)
                ; (isPutting ?x2 robot ball ?p1)
                ;(ok)
                (ok2)
                ;(ok3)
        )
    :effect (and 
                (ok5)
        )
)

)