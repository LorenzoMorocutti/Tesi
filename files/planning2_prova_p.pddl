(define (problem planning2_prova_p) (:domain planning2_prova_d)
(:objects

    robot - agent
    anne - agent
    sally - agent

    box1 - thing
    box2 - thing
    empty_space - thing
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
    t11 - id 
    t12 - id
    t13 - id
    t14 - id
    t15 - id
    t16 - id
)

(:init
    (hasStartAgent robot)

    (isStart t1)
    (isStart t2)
    (isStart t3)
    (isStart t4)
    (isStart t5)
    (isStart t6)
    (isStart t7)
    (isStart t8)
    (isStart t9)
    (isStart t10)
    (isStart t11)
    (isStart t12)
    (isStart t13)
    (isStart t14)
    (isStart t15)
    (isStart t16)

    (free t14)
    (free t15)
    (free t16)


    (disjuncted_a sally anne)
    (disjuncted_a sally robot)
    
    (disjuncted_a anne sally)
    (disjuncted_a anne robot)

    (disjuncted_a robot sally)
    (disjuncted_a robot anne)

    (disjuncted ball box1)
    (disjuncted box1 ball)
    (disjuncted ball box2)
    (disjuncted box2 ball)
    (disjuncted empty_space ball)
    (disjuncted ball empty_space)

    (disjuncted box2 box1)
    (disjuncted box1 box2)
    (disjuncted box1 empty_space)
    (disjuncted empty_space box1)
    (disjuncted box2 empty_space)
    (disjuncted empty_space box2)  

    (disjuncted room box1)
    (disjuncted box1 room)
    (disjuncted room empty_space)
    (disjuncted empty_space room)
    (disjuncted box2 room)
    (disjuncted room box2) 

    (disjuncted_r room elsewhere)
    (disjuncted_r elsewhere room)

    
    ;--- Scene
    (isAt t1 robot room)
    (isAt t2 anne room)
    (isAt t3 sally room)
    (isIn t4 ball room)
    (isIn t5 box1 room)
    (isIn t6 box2 room)
    (isIn t7 empty_space room)

    (Know t8 anne t4)
    (Know t9 sally t4)
    (Know t10 anne t3)
    (Know t11 sally t2)
    (Know t12 anne t2)
    (Know t13 sally t3)
)

(:goal  
    (and 
        (ok)
    )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)