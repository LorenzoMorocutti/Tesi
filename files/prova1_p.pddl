(define (problem prova1_p) (:domain prova1_d)
(:objects 
    lorenzo - agent
    carlo - agent
    pietro - agent
    ilenia - agent
    federico - agent
)

(:init
    (padre carlo lorenzo)
    (padre pietro carlo)
    (nonno federico ilenia)
)

(:goal (and
    (nonna pietro lorenzo)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
