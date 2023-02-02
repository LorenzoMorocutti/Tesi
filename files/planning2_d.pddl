(define (domain planning2_d)

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
        (Know ?x1 - id ?a - agent ?x2 - id)
        (hasStartId ?a - agent ?x - id)
        (hasStartAgent ?ag - agent)
        (isIn ?x1 - id ?e - entity ?p - entity)
        (isAt ?x1 - id ?ag - agent ?p - place) 
        (free ?x - id)
        (isSad ?x1 - id ?a - agent ?x2 - id)
        (isHappy ?x1 - id ?a - agent ?x2 - id) 
        (ok)
        (holding ?ag - agent ?o - entity)
)


(:derived (isHappy ?x1 - id ?ag1 - agent ?x2 - id)
        (exists(?x3 - id ?ag2 - agent)
            (and
                (Know ?x1 ?ag1 ?x2)
                (hasStartId ?ag1 ?x1)
                (hasStartAgent ?ag1)

                (isSad ?x2 ?ag2 ?x3)
            )
        )
)

(:derived (Know ?x1 - id ?ag3 - agent ?x3 - id)
        (exists(?x2 - id ?ag1 ?ag2 - agent ?p - entity)
            (and
                (Know ?x1 ?ag1 ?x2)
                (Know ?x1 ?ag1 ?x3)
                (Know ?x1 ?ag1 ?x4)
                (hasStartId ?ag1 ?x1)
                (hasStartAgent ?ag1)
                (isAt ?x2 ?ag1 ?p)

                (isAt ?x3 ?ag2 ?p)
                (isAt ?x4 ?ag3 ?p)
            )
        )
)

(:action make_sad
    :parameters (?x1 ?x2 ?x3 ?x4 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?o - entity)
    :precondition (and             
                (Know ?x1 ?ag1 ?x2)
                (hasStartId ?ag1 ?x1)
                (hasStartAgent ?ag1)

                (isIn ?x2 ?o ?r1)

                (Know ?x1 ?ag2 ?x3)
                (isIn ?x3 ?o ?r2)

                (free ?x4)
                (disjuncted ?r1 ?r2)
                (disjuncted_a ?ag1 ?ag2)
    )
    :effect (and 
                (isSad ?x4 ?ag2 ?x3)
                (Know ?x1 ?ag1 ?x4)
                (not (free ?x4))
    )
)


(:action make_happy
    :parameters (?x1 ?x2 ?x3 ?x4 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?o - entity)
    :precondition (and             
                (Know ?x1 ?ag1 ?x2)
                (hasStartId ?ag1 ?x1)
                (hasStartAgent ?ag1)

                (isIn ?x2 ?o ?r1)

                (Know ?x1 ?ag2 ?x3)
                (isIn ?x3 ?o ?r1)

                (free ?x4)
                (disjuncted_a ?ag1 ?ag2)
    )
    :effect (and 
                (isHappy ?x4 ?ag2 ?x3)
                (Know ?x1 ?ag1 ?x4)
                (not (free ?x4))
    )
)



(:action say_put_one
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?box ?o - entity)
    :precondition (and 
            (Know start robot ?x1)
            (isAt ?x1 robot ?r1)
            (Know start robot ?x2)
            (isAt ?x2 ?ag1 ?r1)
            (Know start robot ?x3)
            (isAt ?x3 ?ag2 ?r2)
            (Know start robot ?x4)
            (isIn ?x4 box ?r1)
            (Know start robot ?x5)
            (isIn ?x5 ?o ?r1)

            (Know start ?ag1 ?x5)

            (disjuncted ?r1 ?r2)
            (disjuncted ?r1 ?box)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
            (free ?x6)
    )
    :effect (and 
            (not (Know start robot ?x5))
            (not (Know start ?ag1 ?x5))
            (not (free ?x6))
            (Know start robot ?x6)
            (Know start ?ag1 ?x6)
            (isIn ?x6 ?o ?box)
    )
)

(:action say_put_two
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?box ?o - entity)
    :precondition (and 
            (Know start robot ?x1)
            (isAt ?x1 robot ?r1)
            (Know start robot ?x2)
            (isAt ?x2 ?ag1 ?r1)
            (Know start robot ?x3)
            (isAt ?x3 ?ag2 ?r1)
            (Know start robot ?x4)
            (isIn ?x4 box ?r1)
            (Know start robot ?x5)
            (isIn ?x5 ?o ?r1)

            (Know start ?ag1 ?x5)
            (Know start ?ag2 ?x5)

            (disjuncted ?r1 ?box)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
            (free ?x6)
    )
    :effect (and 
            (not (Know start robot ?x5))
            (not (Know start ?ag1 ?x5))
            (not (Know start ?ag2 ?x5))
            (not (free ?x6))
            (Know start robot ?x6)
            (Know start ?ag1 ?x6)
            (Know start ?ag1 ?x6)
            (isIn ?x6 ?o ?box)
    )
)


(:action say_go_one
    :parameters (?x1 ?x2 ?x3 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity)
    :precondition (and 
            (Know start robot ?x1)
            (isAt ?x1 robot ?r1)
            (Know start robot ?x2)
            (isAt ?x2 ?ag1 ?r1)
            (Know start robot ?x3)
            (isAt ?x3 ?ag2 ?r2)

            (disjuncted ?r1 ?r2)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
            (free ?x6)
    )
    :effect (and 
            (not (Know start robot ?x2))
            (not (free ?x6))
            (Know start robot ?x6)
            (isAt ?x6 ?ag1 ?r2)
    )
)

(:action say_go_two
    :parameters (?x1 ?x2 ?x3 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity)
    :precondition (and 
            (Know start robot ?x1)
            (isAt ?x1 robot ?r1)

            (Know start robot ?x2)
            (isAt ?x2 ?ag1 ?r1)

            (Know start robot ?x3)
            (isAt ?x3 ?ag2 ?r1)

            (disjuncted ?r1 ?r2)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
            (free ?x6)
    )
    :effect (and 
            (not (Know start robot ?x2))
            (not (free ?x6))
            (Know start robot ?x6)
            (isAt ?x6 ?ag1 ?r2)
    )
)


(:action say_comeback_two
    :parameters (?x1 ?x2 ?x3 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity)
    :precondition (and 
            (Know start robot ?x1)
            (isAt ?x1 robot ?r1)

            (Know start robot ?x2)
            (isAt ?x2 ?ag1 ?r2)

            (Know start robot ?x3)
            (isAt ?x3 ?ag2 ?r1)

            (disjuncted ?r1 ?r2)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
            (free ?x6)
    )
    :effect (and 
            (not (Know start robot ?x2))
            (not (free ?x6))
            (Know start robot ?x6)
            (isAt ?x6 ?ag1 ?r1)
    )
)

(:action say_comeback_one
    :parameters (?x1 ?x2 ?x3 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity)
    :precondition (and 
            (Know start robot ?x1)
            (isAt ?x1 robot ?r1)
            (Know start robot ?x2)
            (isAt ?x2 ?ag1 ?r2)
            (Know start robot ?x3)
            (isAt ?x3 ?ag2 ?r2)

            (disjuncted ?r1 ?r2)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
            (free ?x6)
    )
    :effect (and 
            (not (Know start robot ?x2))
            (not (free ?x6))
            (Know start robot ?x6)
            (isAt ?x6 ?ag1 ?r1)
    )
)



(:action test
    :parameters (?x3 ?x4 ?x5 - id)
    :precondition (and 
        ; (Know start anne ?x1)
        ; (isIn ?x1 ball room)
        ; (Know start sally ?x2)
        ; (isIn ?x2 ball box)

        
        ; (Know start robot ?x3)
        ; (isAt ?x3 sally room)
        ; (Know start robot ?x4)
        ; (isAt ?x4 anne room)

        (isHappy ?x3 robot ?x5)

        ; (Know start sally ?x1)
        ; (isAt ?x1 sally elsewhere)

    )
    :effect (and 
        (ok)
    )
)


)
