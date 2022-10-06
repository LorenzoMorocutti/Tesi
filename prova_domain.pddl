;Header and description

(define (domain prova_domain)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types rage happiness sadness indifference robot user)

(:predicates 
                (feeling_r ?u - user ?x - rage)
                (feeling_h ?u - user ?x - happiness)
                (feeling_s ?u - user ?x - sadness)
                (feeling_i ?u - user ?x - indifference)
                (response_r ?r - robot ?x - rage)
                (response_h ?r - robot ?x - happiness)
                (response_s ?r - robot ?x - sadness)
                (response_i ?r - robot ?x - indifference)
                (response)
)



(:durative-action rage_response
    :parameters (?start_emotion - rage ?end_emotion - indifference ?user - user ?robot - robot)
    :duration (= ?duration 1)
    :condition (and
        (at start (feeling_r ?user ?start_emotion))
        (at start (not(response)))
    )
    :effect (and 
        (at end (response_r ?robot ?start_emotion))
        (at end (feeling_i ?user ?end_emotion))
        (at end (response))
    )
)

(:durative-action happy_response
    :parameters (?start_emotion - happiness ?end_emotion - indifference ?user - user ?robot - robot)
    :duration (= ?duration 1)
    :condition (and
        (at start (feeling_h ?user ?start_emotion))
        (at start (not(response)))
    )
    :effect (and 
        (at end (response_h ?robot ?start_emotion))
        (at end (feeling_i ?user ?end_emotion))
        (at end (response))
    )
)

(:durative-action sad_response
    :parameters (?start_emotion - sadness ?end_emotion - indifference ?user - user ?robot - robot)
    :duration (= ?duration 1)
    :condition (and
        (at start (feeling_s ?user ?start_emotion))
        (at start (not(response)))
    )
    :effect (and 
        (at end (response_s ?robot ?start_emotion))
        (at end (feeling_i ?user ?end_emotion))
        (at end (response))
    )
)

(:durative-action indifference_response_r
    :parameters (?start_emotion - sadness ?end_emotion_u - rage ?end_emotion - indifference ?user - user ?robot - robot)
    :duration (= ?duration 2)
    :condition (and 
        (at start (feeling_s ?user ?start_emotion))
        (at start (not(response)))
    )
    :effect (and 
        (at end (response_i ?robot ?end_emotion))
        (at end (feeling_r ?user ?end_emotion_u))
        (at end (response))
    )
)

)