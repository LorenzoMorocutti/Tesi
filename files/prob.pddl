(define (problem prob) (:domain dom)
(:objects

    robot - agent
    anne - agent
    sally - agent
    ilenia - agent
    lorenzo - agent

    box1 - thing
    box2 - thing
    ball - thing

    room - place
    elsewhere - place

    start - id
    end - id

    one - id
    two - id
    three - id
    four - id
    five - id
    six - id
    seven - id
    eight - id
    nine - id
    ; ten - id
    ; eleven - id
    ; twelve - id
    ; thirteen - id
    ; fourteen - id
    ; fifteen - id
    ; sixteen - id
    ; seventeen - id
    ; eighteen - id
    ; nineteen - id
    ; twenty - id
    ; twentyone - id
    ; twentytwo - id
    ; twentythree - id
    ; twentyfour - id
    ; twentyfive - id
    ; twentysix - id
    ; twentyseven - id
    ; twentyeight - id
    ; twentynine - id
    ; thirty - id
    ; thirtyone - id
    ; thirtytwo - id
    ; thirtythree - id
    ; thirtyfour - id
)

(:init

    (hasStartId robot start)
    (hasStartId sally start)
    (hasStartId anne start)
    (hasStartId lorenzo start)
    (hasStartId ilenia start)

    (follow six seven)

    (disjuncted sally anne)
    (disjuncted sally robot)
    (disjuncted sally lorenzo)
    (disjuncted sally ilenia)
    
    (disjuncted anne sally)
    (disjuncted anne robot)
    (disjuncted anne lorenzo)
    (disjuncted anne ilenia)

    (disjuncted robot sally)
    (disjuncted robot anne)
    (disjuncted robot lorenzo)
    (disjuncted robot ilenia)

    (disjuncted lorenzo anne)
    (disjuncted lorenzo robot)
    (disjuncted lorenzo sally)
    (disjuncted lorenzo ilenia)

    (disjuncted ilenia anne)
    (disjuncted ilenia robot)
    (disjuncted ilenia lorenzo)
    (disjuncted ilenia sally) 

    (disjuncted box1 box2)
    (disjuncted box2 box1)

    (disjuncted room elsewhere)
    (disjuncted elsewhere room)
    
    ;--- Scene
    (Know start robot one)
    (isIn one robot room)
    (See start robot two)
    (isIn two sally room)
    (See start robot three)
    (isIn three anne elsewhere)
    (See start robot four)
    (isIn four lorenzo room)
    (See start robot five)
    (isIn five ilenia room)
    (See start robot six)
    (isIn six ball box1)  
)

(:goal  
    (and 
        ;(isIn three anne elsewhere)
        ; (Know start robot seven)
        ; (isIn seven ball box2)
        ; (Know start anne six)
        ; (isIn six ball box1)
        (ok5)
        ;(isSad anne)
    )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)