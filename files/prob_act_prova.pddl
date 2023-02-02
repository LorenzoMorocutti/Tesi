(define (problem prob_act_prova) (:domain dom_act_prova)
(:objects

    robot - agent
    anne - agent
    sally - agent

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
    ten - id
    eleven - id
    twelve - id
    thirteen - id
    fourteen - id
    fifteen - id
    sixteen - id
    seventeen - id
    eighteen - id
    nineteen - id
)

(:init

    (hasStartId robot start)
    (hasStartId sally start)
    (hasStartId anne start)

    ; (follow second first)
    ; (follow third second)
    ; (follow fourth third)
    ; (follow fifth fourth)
    ;(follow six seven)
    (free seven)
    (free eight)
    (free nine)
    (free ten)
    (free eleven)
    ; (free twelve)
    ; (free thirteen)
    ; (free fourteen)

    (disjuncted sally anne)
    (disjuncted sally robot)
    ; (disjuncted sally lorenzo)
    ; (disjuncted sally ilenia)
    
    (disjuncted anne sally)
    (disjuncted anne robot)
    ; (disjuncted anne lorenzo)
    ; (disjuncted anne ilenia)

    (disjuncted robot sally)
    (disjuncted robot anne)
    ; (disjuncted robot lorenzo)
    ; (disjuncted robot ilenia)

    ; (disjuncted lorenzo anne)
    ; (disjuncted lorenzo robot)
    ; (disjuncted lorenzo sally)
    ; (disjuncted lorenzo ilenia)

    ; (disjuncted ilenia anne)
    ; (disjuncted ilenia robot)
    ; (disjuncted ilenia lorenzo)
    ; (disjuncted ilenia sally) 

    (disjuncted box1 box2)
    (disjuncted box2 box1)
    (disjuncted room box1)
    (disjuncted box1 room)
    (disjuncted room box2)
    (disjuncted box2 room)
    (disjuncted room elsewhere)
    (disjuncted elsewhere room)
    
    ;--- Scene
    (Know start robot one)
    (isIn one robot room)
    (See start robot two)
    (isIn two sally room)
    (See start robot three)
    (isIn three anne room)
    ; (See start robot four)
    ; (isIn four lorenzo room)
    ; (See start robot five)
    ; (isIn five ilenia room)
    (See start robot six)
    ;(Know start anne six)
    (isIn six ball room)
)

(:goal  
    (and 
        ; (Know start robot two)
        ; (Know start anne two)
        ;(ok5)
        ;(Know start robot seven)
        ;(not (Know start anne seven))
        ;(Know start anne six)
        ; (Know start anne seven)
        ; (See start sally seven)
        (isPutting seven anne ball box1)
        ; (Know start sally eight)
        ; (See start anne eight)
        ; (isGoing eight sally room elsewhere)
        ; (Know start robot seven)
        ; (isIn seven ball box1)
        ; (Know start anne six)
        ; (isIn six ball room)
        ; (Know start robot eight)
        ; (isIn eight anne elsewhere)
        ;(isIn seven ball box1)
        ; (not (See start robot six))
        ; (not (Know start robot six))
    )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)