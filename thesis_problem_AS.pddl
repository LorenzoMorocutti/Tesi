(define (problem thesis_problem) (:domain thesis_domain)
(:objects
    robot - agent
    anne - agent
    sally - agent
    box1 - thing
    box2 - thing
    emptySpace - thing
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
    t17 - id
    t18 - id
    t19 - id
    t20 - id
    t21 - id
    t22 - id
    t23 - id
)

(:init
    (isSadic sally)


    (isEnd end)
    
    ; All the start ids
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
    (isStart t23)

    ; All the free ids
    (free t17)
    (free t18)
    (free t19)
    (free t20)
    (free t21)
    (free t22) 
 
    ;--- Scene
    (isAt t1 robot room)
    (isAt t2 anne room)
    (isAt t3 sally room)

    (Know t4 anne t2)
    (Know t5 anne t3)
    (Know t6 sally t2)
    (Know t7 sally t3)

    (isIn t8 ball emptySpace)
    (Know t9 anne t8)
    (Know t10 sally t8)

    ; Willingness of the agents about changin room or putting the ball into the box

    (Willing t11 anne t8)
    (Willing t12 sally t8)
    (Willing t13 anne t2)
    (NotSureIfWilling t14 sally t3)
)


; To test the various goal, uncomment the (ok1,2,3,4,5,6) to activate the test actions:
; ok1 -> activates test1
; ok2 -> activates test2 
; ....

(:goal  
    (and 
        ;(ok1)
        ;(ok2)
        (ok3)
        ;(ok4)
        ;(ok5)
        ;(ok6)
        ;(ok7)
    )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)