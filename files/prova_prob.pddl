(define (problem prova_prob) 

(:domain prova_dom)
(:objects 
    robot - agent
    anne - agent
    lorenzo - agent

    room - place
    else - place

    ball - thing
    box1 - thing
    box2 - thing

    start - id 
    one - id
    two - id
    three - id
    four - id

)

(:init
    (follow three four)

    (hasStartId robot start)

    (disjuncted room else)
    (disjuncted else room)

    (disjuncted box1 box2)
    (disjuncted box2 box1)

    (Know start robot one)
    (isIn one robot room)
    (See start robot two)
    (isIn two anne room)
    (See start robot three)
    (isIn three ball box1)
)

(:goal (and
    ;(isIn two anne else)
    (ok5)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
