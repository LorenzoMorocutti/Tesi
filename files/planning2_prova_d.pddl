(define (domain planning2_prova_d)

(:requirements :adl :derived-predicates :strips :typing :conditional-effects :negative-preconditions :equality)

(:types
    entity
    place - entity
    thing - entity 
    agent 

    id
)


(:predicates 
        (disjuncted ?a ?b - entity)
        (disjuncted_a ?a ?b - agent)
        (disjuncted_r ?a ?b - place)     
        (Know ?x1 - id ?a - agent ?x2 - id)
        (hasStartId ?a - agent ?x - id)
        (isStart ?x - id)
        (hasStartAgent ?ag - agent)
        (isIn ?x1 - id ?e - entity ?p - entity)
        (isAt ?x1 - id ?ag - agent ?p - place) 
        (free ?x - id)
        (isSad ?x1 - id ?a - agent ?x2 - id)
        (isHappy ?x1 - id ?a - agent ?x2 - id) 
        (ok)
        (ok2)
        (ok3)
        (ok4)
        (offended ?ag1 ?ag2 - agent)
        (praised ?ag1 ?ag2 - agent)
        (blamed ?ag1 ?ag2 - agent)
        (report_offended ?ag1 ?ag2 - agent)
        (report_praised ?ag1 ?ag2 - agent)
        (report_blamed ?ag1 ?ag2 - agent)

        (slapped ?ag1 ?ag2 - agent)
)



(:derived (isSad ?x3 - id ?ag - agent ?x2 - id)
        (exists(?x1 - id ?o ?r ?box - entity)
            (and
                (isIn ?x1 ?o ?box)
                (isStart ?x1)

                (isIn ?x2 ?o ?r)
                (not (isStart ?x2))
                (Know ?x3 ?ag ?x2)
                (isStart ?x3)
            )
        )
)

(:action say_put_one
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 ?x8 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?box ?o - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isStart ?x1)

            (isAt ?x2 ?ag1 ?r1)
            (isStart ?x2)

            (isAt ?x3 ?ag2 ?r2)
            (isStart ?x3)

            (isIn ?x4 ?box ?r1)
            (isStart ?x4)

            (isIn ?x5 ?o ?r1)
            (isStart ?x5)

            (Know ?x6 ?ag1 ?x5)
            (isStart ?x6)

            (Know ?x7 ?ag2 ?x5)
            (isStart ?x7)

            (disjuncted_r ?r1 ?r2)
            (disjuncted ?r1 ?box)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
            (free ?x8)
    )
    :effect (and 
            (not (isStart ?x5))
            (not (Know ?x6 ?ag1 ?x5))
            (not (free ?x8))
            (isIn ?x8 ?o ?box)
            (isStart ?x8)
            (Know ?x6 ?ag1 ?x8)
    )
)

(:action say_put_two
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r ?box ?o - entity)
    :precondition (and 
            (isAt ?x1 robot ?r)
            (isStart ?x1)

            (isAt ?x2 ?ag1 ?r)
            (isStart ?x2)

            (isAt ?x3 ?ag2 ?r)
            (isStart ?x3)

            (isIn ?x4 ?box ?r)
            (isStart ?x4)

            (isIn ?x5 ?o ?r)
            (isStart ?x5)

            (Know ?x6 ?ag1 ?x5)
            (Know ?x7 ?ag2 ?x5)
            (isStart ?x6)
            (isStart ?x7)

            (disjuncted ?r ?box)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
    )
    :effect (and 
            (not (isIn ?x5 ?o ?r))
            (isIn ?x5 ?o ?box)
    )
)


(:action say_go_one
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isStart ?x1)
            (isAt ?x2 ?ag1 ?r1)
            (isStart ?x2)
            (isAt ?x3 ?ag2 ?r2)
            (isStart ?x3)

            (Know ?x4 ?ag1 ?x2)
            (isStart ?x4)
            (Know ?x5 ?ag2 ?x2)
            (isStart ?x5)

            (disjuncted_r ?r1 ?r2)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
            (free ?x6)
    )
    :effect (and 
            (not (isStart ?x2))
            (not (Know ?x4 ?ag1 ?x2))
            (not (free ?x6))
            (isAt ?x6 ?ag1 ?r2)
            (isStart ?x6)
            (Know ?x4 ?ag1 ?x6)
    )
)

(:action say_go_two
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isStart ?x1)

            (isAt ?x2 ?ag1 ?r1)
            (isStart ?x2)

            (isAt ?x3 ?ag2 ?r1)
            (isStart ?x3)

            (Know ?x4 ?ag1 ?x2)
            (isStart ?x4)
            (Know ?x5 ?ag2 ?x2)
            (isStart ?x5)

            (disjuncted_r ?r1 ?r2)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
    )
    :effect (and 
            (not (isAt ?x2 ?ag1 ?r1))
            (isAt ?x2 ?ag1 ?r2)
    )
)


; (:action say_comeback_one
;     :parameters (?x1 ?x2 ?x3 ?4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity)
;     :precondition (and 
;             (isAt ?x1 robot ?r1)
;             (isStart ?x1)
;             (isAt ?x2 ?ag1 ?r2)
;             (isStart ?x2)
;             (isAt ?x3 ?ag2 ?r2)
;             (isStart ?x3)

;             (Know ?x4 ?ag1 ?x2)
;             (isStart ?x4)
;             (Know ?x5 ?ag2 ?x2)
;             (isStart ?x5)

;             (disjuncted_r ?r1 ?r2)
;             (disjuncted_a ?ag1 ?ag2)
;             (disjuncted_a robot ?ag1)
;             (disjuncted_a robot ?ag2)
;             (free ?x6)
;     )
;     :effect (and 
;             (not (isStart ?x2))
;             (not (Know ?x4 ?ag1 ?x2))
;             (not (free ?x6))
;             (isAt ?x6 ?ag1 ?r1)
;             (isStart ?x6)
;             (Know ?x4 ?ag1 ?x6)
;     )
; )

(:action say_comeback_two
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isStart ?x1)

            (isAt ?x2 ?ag1 ?r2)
            (isStart ?x2)

            (isAt ?x3 ?ag2 ?r1)
            (isStart ?x3)

            (Know ?x4 ?ag1 ?x2)
            (isStart ?x4)
            (Know ?x5 ?ag2 ?x2)
            (isStart ?x5)

            (disjuncted_r ?r1 ?r2)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
    )
    :effect (and 
            (not (isAt ?x2 ?ag1 ?r2))
            (isAt ?x2 ?ag1 ?r1)
    )
)


(:action insult
    :parameters (?x1 ?x2 - id ?ag - agent ?p - entity)
    :precondition (and 
            (isAt ?x1 robot ?p)
            (isAt ?x2 ?ag ?p)
    )
    :effect (and 
            (offended ?ag robot)
    )
)

(:action praise
    :parameters (?x1 ?x2 - id ?ag - agent ?p - entity)
    :precondition (and 
            (isAt ?x1 robot ?p)
            (isAt ?x2 ?ag ?p)
    )
    :effect (and 
            (praised ?ag robot)
    )
)

(:action blame
    :parameters (?x1 ?x2 - id ?ag - agent ?p - entity)
    :precondition (and 
            (isAt ?x1 robot ?p)
            (isAt ?x2 ?ag ?p)
    )
    :effect (and 
            (blamed ?ag robot)
    )
)

(:action report_insult
    :parameters (?x1 ?x2 ?x3 - id ?ag1 ?ag2 - agent ?p - entity)
    :precondition (and 
            (isAt ?x1 robot ?p)
            (isAt ?x2 ?ag1 ?p)
            (isAt ?x3 ?ag2 ?p)
            (offended ?ag1 ?ag2)
    )
    :effect (and 
            (report_offended ?ag1 ?ag2)
    )
)

(:action report_praise
    :parameters (?x1 ?x2 ?x3 - id ?ag1 ?ag2 - agent ?p - entity)
    :precondition (and 
            (isAt ?x1 robot ?p)
            (isAt ?x2 ?ag1 ?p)
            (isAt ?x3 ?ag2 ?p)
            (praised ?ag1 ?ag2)
    )
    :effect (and 
            (report_praised robot ?ag2)
    )
)

(:action report_blame
    :parameters (?x1 ?x2 ?x3 - id ?ag1 ?ag2 - agent ?p - entity)
    :precondition (and 
            (isAt ?x1 robot ?p)
            (isAt ?x2 ?ag1 ?p)
            (isAt ?x3 ?ag2 ?p)
            (blamed ?ag1 ?ag2)
    )
    :effect (and 
            (report_blamed ?ag1 ?ag2)
    )
)



; This test action shows the usage of the different actions to reach a certain goal.
; I suggest to try the first block of four predicates (if you want, also try the first two predicates separately first)
; and then the last two alone (to see also the comeback action).
; Remember always to change the id in the parameters section, to avoid a huge planner time

(:action test
    :parameters (?x1 ?x2 ?x3 ?x4 - id)
    :precondition (and 
        (Know ?x1 sally ?x2)
        (isIn ?x2 ball box1)
        (Know ?x3 sally ?x4)
        (isAt ?x4 anne elsewhere)



        ; (isSad ?x5 anne ?x6)
        ; (isAt ?x7 anne room)
    )
    :effect (and 
        (ok)
    )
)

)
