(define (problem planning2_p) (:domain planning2_d)
(:objects

    robot - agent
    anne - agent
    sally - agent

    box - thing
    ball - thing

    room - place
    elsewhere - place

    start - id
    end - id

    t1 - id
    t2 - id
    t3 - id
    t4 - id
    t5 - id
    t6 - id
    t7 - id
    t8 - id
    t9 - id
    t10 - id 
)

(:init
    (hasStartId robot start)
    (hasStartId sally start)
    (hasStartId anne start)

    (hasStartAgent robot)

    (free t6)
    (free t7)
    (free t8)
    (free t9)
    (free t10)


    (disjuncted_a sally anne)
    (disjuncted_a sally robot)
    
    (disjuncted_a anne sally)
    (disjuncted_a anne robot)

    (disjuncted_a robot sally)
    (disjuncted_a robot anne)

    (disjuncted room box)
    (disjuncted box room)
    (disjuncted room elsewhere)
    (disjuncted elsewhere room)
    (disjuncted elsewhere box)
    (disjuncted box elsewhere)
    
    ;--- Scene
    (Know start robot t1)
    (isAt t1 robot room)
    (Know start robot t2)
    (isAt t2 anne room)
    (Know start robot t3)
    (isAt t3 sally room)
    (Know start robot t4)
    (isIn t4 ball room)
    (Know start robot t5)
    (isIn t5 box room)

    (Know start anne t4)
    (Know start anne t5)
    (Know start sally t4)
    (Know start sally t5)
)

(:goal  
    (and 
        (ok)
    )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)