;Header and description

(define (domain prova_domain)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types rage happiness sadness indifference robot)

(:predicates 
                (feeling_r ?x - rage)
                (feeling_h ?x - happines)
                (feeling_s ?x - sadness)
                (feeling_i ?x - indifference)
                
)


;typical form of a durative action
(:durative-action fillwarm
	:parameters (?x - drink)
	:duration (= ?duration 5)
	:condition (and 
        (at start (warm ?x))
        (at start(not (busybarman))) 
    )
	:effect (and 
        (at start(busybarman))
        (at end (ready ?x))
        (at end(not(busybarman)))
    )
)


;typical form of a normal action
(:action pick-upD
	:parameters (?x - drink ?hand - hand ?bar - waypoint ?table - waypoint ?waiter - robot)
	:precondition (and
        (hashand ?waiter ?hand)
        (free ?hand) 
        (ready ?x)
        (at ?waiter ?bar)
        (isbar ?bar)
        (order ?x ?table ?waiter)
    )
	:effect(and
        (holding ?x ?hand)
        (not (free ?hand)) 
    )
)

)