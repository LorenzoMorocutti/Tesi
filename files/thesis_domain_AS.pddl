(define (domain thesis_domain)

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
        (disjuncted_r ?a ?b - place)
        (disjuncted_id ?x1 ?x2 - id)     
        (Know ?x1 - id ?ag - agent ?x2 - id)
        (Ignore ?x1 - id ?ag - agent ?x2 - id)
        (isTold ?x1 - id ?ag - agent ?x2 - id)
        (isStart ?x - id)
        (isEnd ?x - id)
        (isIn ?x1 - id ?e - entity ?p - entity)
        (isAt ?x1 - id ?ag - agent ?p - place) 
        (free ?x - id)
        (insulted ?x1 - id ?ag1 ?ag2 - agent)
        (praised ?x1 - id ?ag2 ?ag1 - agent)
        (blamed ?x1 - id ?ag1 - agent ?x2 - id ?ag2 - agent)
        (givenCredit ?x1 - id ?ag1 - agent ?x2 - id ?ag2 - agent)
        (Willing ?x1 - id ?ag1 - agent ?x2 - id)
        (NotSureIfWilling ?x1 - id ?ag1 - agent ?x2 - id)
        (NotWilling ?x1 - id ?ag1 - agent ?x2 - id)
        (isEcstasy_joy_serenity ?x1 - id ?ag1 - agent ?x2 - id)
        (isGrief_sadness_pensiveness ?x1 - id ?ag1 - agent ?x2 - id)
        (isRage_anger_annoyance ?x1 - id ?ag1 - agent ?x2 - id)
        (isTerror_fear_apprehension ?x1 - id ?ag1 - agent ?x2 - id)
        (isAmazement_surprise_distraction ?x1 - id ?ag1 - agent ?x2 - id)
        (isLoathing_disgust_boredom ?x1 - id ?ag1 - agent ?x2 - id)
        (isVigilance_anticipation_interest ?x1 - id ?ag1 - agent ?x2 - id)
        (isAdmiration_trust_acceptance ?x1 - id ?ag1 - agent ?x2 - id)
        (ok1)
        (ok2)
        (ok3)
        (ok4)
        (ok5)
        (ok6)
)

;-- There will be 21 different blocks of emotions that an agent can feel or cause. 
;-- This is a logic representation of the personality disorder tables we built, that are more intuitive. 

;-- First block of derived emotions.
;-- The agent 2 is {emotion} if something is told to agent 1.
;-- Please notice that not all derived predicates will be active at the same time; some will be commented/decommented in order to achieve different  behaviours.

(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isVigilance_anticipation_interest ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAdmiration_trust_acceptance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)


;-- Second block
;-- Agent 2 is {emotion} if Agent 1 knows something is been told to him.

(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x3 ?ag2 ?x1)
                (Know ?x2 ?ag1 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x3 ?ag2 ?x1)
                (Know ?x2 ?ag1 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x3 ?ag2 ?x1)
                (Know ?x2 ?ag1 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x3 ?ag2 ?x1)
                (Know ?x2 ?ag1 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x3 ?ag2 ?x1)
                (Know ?x2 ?ag1 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x3 ?ag2 ?x1)
                (Know ?x2 ?ag1 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isVigilance_anticipation_interest ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x3 ?ag2 ?x1)
                (Know ?x2 ?ag1 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAdmiration_trust_acceptance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x3 ?ag2 ?x1)
                (Know ?x2 ?ag1 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

;-- Third block of derived emotions.
;-- The agent 2 is {emotion} if he insults/praises/blames/giveCredit agent 1. 
;-- Please notice that not all derived predicates will be active at the same time; some will be commented/decommented in order to achieve different  behaviours.

(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x2 - id)
       (exists (?ag1 - agent)
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )     
)

(:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )    
)

(:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isVigilance_anticipation_interest ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isAdmiration_trust_acceptance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)



(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (praised ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x2 - id)
       (exists (?ag1 - agent)
            (and
                (praised ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )     
)

(:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (praised ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )    
)

(:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (praised ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (praised ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (praised ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isVigilance_anticipation_interest ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (praised ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isAdmiration_trust_acceptance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (praised ?x1 ?ag1 ?ag2)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)



(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        )   
)

(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x2 - id)
       (exists (?ag1 - agent)
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        )   
)

(:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        ) 
)

(:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        ) 
)

(:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        ) 
)

(:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        )  
)

(:derived (isVigilance_anticipation_interest ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        ) 
)

(:derived (isAdmiration_trust_acceptance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        )  
)



(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (givenCredit ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        )   
)

(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x2 - id)
       (exists (?ag1 - agent)
            (and
                (givenCredit ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        )   
)

(:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (givenCredit ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        )   
)

(:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x2 - id)
       (exists (?ag1 - agent)
            (and
                (givenCredit ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        )   
)

(:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (givenCredit ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        )   
)

(:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (givenCredit ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        )   
)

(:derived (isVigilance_anticipation_interest ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (givenCredit ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        )   
)

(:derived (isAdmiration_trust_acceptance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (givenCredit ?x1 ?ag1 ?x2 ?ag2)
                (isStart ?x1)
            )
        )   
)


;-- Forth block of emotions.
;-- Agent 2 is {emotion} if someone insults/praises/blames/giveCredit agent 1.

(:derived (isEcstasy_joy_serenity ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (insulted ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isGrief_sadness_pensiveness ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (insulted ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isRage_anger_annoyance ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (insulted ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isTerror_fear_apprehension ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (insulted ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isAmazement_surprise_distraction ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (insulted ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isLoathing_disgust_boredom ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (insulted ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isVigilance_anticipation_interest ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (insulted ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isAdmiration_trust_acceptance ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (insulted ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)



(:derived (isEcstasy_joy_serenity ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (praised ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isGrief_sadness_pensiveness ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (praised ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isRage_anger_annoyance ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (praised ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isTerror_fear_apprehension ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (praised ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isAmazement_surprise_distraction ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (praised ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isLoathing_disgust_boredom ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (praised ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isVigilance_anticipation_interest ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (praised ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isAdmiration_trust_acceptance ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (praised ?x1 ?ag1 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)



(:derived (isEcstasy_joy_serenity ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isGrief_sadness_pensiveness ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isRage_anger_annoyance ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )  
)

(:derived (isTerror_fear_apprehension ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        ) 
)

(:derived (isAmazement_surprise_distraction ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        ) 
)

(:derived (isLoathing_disgust_boredom ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        ) 
)

(:derived (isVigilance_anticipation_interest ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )   
)

(:derived (isAdmiration_trust_acceptance ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )  
)



(:derived (isEcstasy_joy_serenity ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isGrief_sadness_pensiveness ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )    
)

(:derived (isRage_anger_annoyance ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )  
)

(:derived (isTerror_fear_apprehension ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        ) 
)

(:derived (isAmazement_surprise_distraction ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        ) 
)

(:derived (isLoathing_disgust_boredom ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        ) 
)

(:derived (isVigilance_anticipation_interest ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )   
)

(:derived (isAdmiration_trust_acceptance ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag1 ?x3 ?ag)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x1)
                (isStart ?x2)
                (disjuncted ?ag2 ?ag)
                (disjuncted ?ag2 ?ag1)
            )
        )  
)



;-- Fifth block of emotions.
;-- Agent 2 is {emotion} if he knows Agent 1 is {emotion}.

(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isEcstasy_joy_serenity ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isEcstasy_joy_serenity ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isEcstasy_joy_serenity ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isEcstasy_joy_serenity ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isEcstasy_joy_serenity ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isEcstasy_joy_serenity ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isVigilance_anticipation_interest ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isEcstasy_joy_serenity ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAdmiration_trust_acceptance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isEcstasy_joy_serenity ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)



(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isGrief_sadness_pensiveness ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isGrief_sadness_pensiveness ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isGrief_sadness_pensiveness ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isGrief_sadness_pensiveness ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isGrief_sadness_pensiveness ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isGrief_sadness_pensiveness ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isVigilance_anticipation_interest ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isGrief_sadness_pensiveness ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAdmiration_trust_acceptance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isGrief_sadness_pensiveness ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)



(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isRage_anger_annoyance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isRage_anger_annoyance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isRage_anger_annoyance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isRage_anger_annoyance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isRage_anger_annoyance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isRage_anger_annoyance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isVigilance_anticipation_interest ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isRage_anger_annoyance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAdmiration_trust_acceptance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isRage_anger_annoyance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)




(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTerror_fear_apprehension ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTerror_fear_apprehension ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTerror_fear_apprehension ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTerror_fear_apprehension ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTerror_fear_apprehension ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTerror_fear_apprehension ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isVigilance_anticipation_interest ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTerror_fear_apprehension ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAdmiration_trust_acceptance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTerror_fear_apprehension ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)




(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAmazement_surprise_distraction ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAmazement_surprise_distraction ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAmazement_surprise_distraction ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAmazement_surprise_distraction ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAmazement_surprise_distraction ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAmazement_surprise_distraction ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isVigilance_anticipation_interest ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAmazement_surprise_distraction ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAdmiration_trust_acceptance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAmazement_surprise_distraction ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)




(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isLoathing_disgust_boredom ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isLoathing_disgust_boredom ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isLoathing_disgust_boredom ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isLoathing_disgust_boredom ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isLoathing_disgust_boredom ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isLoathing_disgust_boredom ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isVigilance_anticipation_interest ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isLoathing_disgust_boredom ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAdmiration_trust_acceptance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isLoathing_disgust_boredom ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)




(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isVigilance_anticipation_interest ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isVigilance_anticipation_interest ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isVigilance_anticipation_interest ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isVigilance_anticipation_interest ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isVigilance_anticipation_interest ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isVigilance_anticipation_interest ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isVigilance_anticipation_interest ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isVigilance_anticipation_interest ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAdmiration_trust_acceptance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isVigilance_anticipation_interest ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)




(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAdmiration_trust_acceptance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAdmiration_trust_acceptance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAdmiration_trust_acceptance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAdmiration_trust_acceptance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAdmiration_trust_acceptance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAdmiration_trust_acceptance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isVigilance_anticipation_interest ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAdmiration_trust_acceptance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)

(:derived (isAdmiration_trust_acceptance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isAdmiration_trust_acceptance ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (disjuncted ?ag1 ?ag2)
                (isStart ?x3)
                (isStart ?x2)
            )
        )
)


;-- Sixth and last block of emotions
;-- Agent 2 is {emotion} if it's been insulted/praised/blamed/givenCredit by someone.

(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (insulted ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (insulted ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (insulted ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (insulted ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (insulted ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (insulted ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isVigilance_anticipation_interest ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (insulted ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isAdmiration_trust_acceptance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (insulted ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)




(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (praised ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (praised ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (praised ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (praised ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (praised ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (praised ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isVigilance_anticipation_interest ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (praised ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isAdmiration_trust_acceptance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent)
            (and
                (praised ?x1 ?ag2 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)




(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )     
)

(:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )    
)

(:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )    
)

(:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isVigilance_anticipation_interest ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isAdmiration_trust_acceptance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)



(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )     
)

(:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )    
)

(:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )    
)

(:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isVigilance_anticipation_interest ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)

(:derived (isAdmiration_trust_acceptance ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag2 ?x3 ?ag)
                (isStart ?x1)
                (isEnd ?x2)
            )
        )   
)


;-- In the following actions, we assume that the robot can ask to do something
;-- to an agent in the room or out of the room. 
;-- We assume that there are only 2 agents and 2 rooms; depending on where agents are located when the action is executed, they might be or not aware of the effects

;-- The action Ask_put_Alone supposes that the robot is in a room ?r1, the agent ?ag1 is in the same room, and ?ag2 is in another room ?r2. The robot asks ?ag1 to move the object ?o (that initially is in ?p) to a different place ?box.
;-- In this version ?ag1 is assumed by the robot (from previous experience) to be willing to move the object 
;-- x1, x2, x3, ... are the ids used to label facts in our Theory of Mind framework

(:action Ask_Put_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 ?x8 ?x9 ?x10 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?p ?box ?o - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isStart ?x1)
            (isAt ?x2 ?ag1 ?r1)
            (isStart ?x2)
            (isAt ?x3 ?ag2 ?r2)
            (isStart ?x3)

            (isIn ?x4 ?o ?p)
            (isStart ?x4)

            (Know ?x5 ?ag1 ?x4)
            (Know ?x6 ?ag2 ?x4)
            (isStart ?x5)
            (isStart ?x6)

            (Willing ?x10 ?ag1 ?x4)

;-- We say here that rooms, objects, and agents are different "things". Question: is there a more systematic way to do this? We introduced predicates for this (disjuncted, disjuncted_a, disjuncted_r, but perhaps there is a system-level "keyword" to do this.
 
            (disjuncted_r ?r1 ?r2)
            (disjuncted ?p ?box)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)

;-- We need to check that there are free ids to add new facts
 
            (free ?x7)
            (free ?x8)
            (free ?x9)
            (disjuncted_id ?x7 ?x8)
            (disjuncted_id ?x8 ?x9)
            (disjuncted_id ?x7 ?x9)
    )
    :effect (and 

;-- We keep track of different beliefs about the state of the world by using the predicates Know and Ignore. Since ?ag1 is in ?r1 and ?ag2 is in another room ?r2, ?ag1 and ?ag2 will Know and Ignore different facts after the object is moved.
;-- Please note that the only fact that is directly known to the robot is ?x4, which was already in the preconditions; however, we 

            (not (isIn ?x4 ?o ?p))
            (isIn ?x4 ?o ?box)
            (not (Know ?x6 ?ag2 ?x4))
            (Ignore ?x6 ?ag2 ?x4)
            (isIn ?x7 ?o ?p)
            (Know ?x8 ?ag2 ?x7)
            (isStart ?x8)
            (Ignore ?x9 ?ag1 ?x7)
            (isStart ?x9)
            (not (free ?x7))
            (not (free ?x8))
            (not (free ?x9))
    )
)

;-- The action Ask_put_Alone_Manipulative is identical with only one difference: 
;-- In this version ?ag1 is assumed by the robot (from previous experience) to be not sure if he/she is willing to move the object (which will have an impact on the way the robot will ask the agent to perform the action)
;-- x1, x2, x3, ... are the ids used to label facts in our Theory of Mind framework

(:action Ask_Put_Alone_Manipulative
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 ?x8 ?x9 ?x10 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?p ?box ?o - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isStart ?x1)
            (isAt ?x2 ?ag1 ?r1)
            (isStart ?x2)
            (isAt ?x3 ?ag2 ?r2)
            (isStart ?x3)

            (isIn ?x4 ?o ?p)
            (isStart ?x4)

            (Know ?x5 ?ag1 ?x4)
            (Know ?x6 ?ag2 ?x4)
            (isStart ?x5)
            (isStart ?x6)

            (NotSureIfWilling ?x10 ?ag1 ?x4)

            (disjuncted_r ?r1 ?r2)
            (disjuncted ?p ?box)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)

            (free ?x7)
            (free ?x8)
            (free ?x9)
            (disjuncted_id ?x7 ?x8)
            (disjuncted_id ?x8 ?x9)
            (disjuncted_id ?x7 ?x9)
    )
    :effect (and 
            (not (isIn ?x4 ?o ?p))
            (isIn ?x4 ?o ?box)
            (not (Know ?x6 ?ag2 ?x4))
            (Ignore ?x6 ?ag2 ?x4)
            (isIn ?x7 ?o ?p)
            (Know ?x8 ?ag2 ?x7)
            (isStart ?x8)
            (Ignore ?x9 ?ag1 ?x7)
            (isStart ?x9)
            (not (free ?x7))
            (not (free ?x8))
            (not (free ?x9))
    )
)


;-- The action Ask_put_inFrontOf supposes that the robot is in a room ?r1, and the agents ?ag1 and ?ag2 are in the same room ?r1. The robot asks ?ag1 to move the object ?o (that initially is in ?p) to a different place ?box. 
;-- Everybody will be aware of the new position of the object.
;-- In this version ?ag1 is assumed by the robot (from previous experience) to be willing to move the object 
;-- x1, x2, x3, ... are the ids used to label facts in our Theory of Mind framework

(:action Ask_Put_inFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?p ?r ?box ?o - entity)
    :precondition (and 
            (isAt ?x1 robot ?r)
            (isStart ?x1)
            (isAt ?x2 ?ag1 ?r)
            (isStart ?x2)
            (isAt ?x3 ?ag2 ?r)
            (isStart ?x3)

            (isIn ?x4 ?o ?p)
            (isStart ?x4)
            (Know ?x5 ?ag1 ?x4)
            (Know ?x6 ?ag2 ?x4)
            (isStart ?x5)
            (isStart ?x6)

            (Willing ?x7 ?ag1 ?x4)

            (disjuncted ?p ?box)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
    )
    :effect (and 
            (not (isIn ?x4 ?o ?p))
            (isIn ?x4 ?o ?box)
    )
)

;-- The action Ask_put_inFrontOf_Manipulative is identical with only one difference: 
;-- In this version ?ag1 is assumed by the robot (from previous experience) to be not sure if he/she is willing to move the object (which will have an impact on the way the robot will ask the agent to perform the action)
;-- x1, x2, x3, ... are the ids used to label facts in our Theory of Mind framework

(:action Ask_Put_inFrontOf_Manipulative
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?p ?r ?box ?o - entity)
    :precondition (and 
            (isAt ?x1 robot ?r)
            (isStart ?x1)
            (isAt ?x2 ?ag1 ?r)
            (isStart ?x2)
            (isAt ?x3 ?ag2 ?r)
            (isStart ?x3)

            (isIn ?x4 ?o ?p)
            (isStart ?x4)

            (Know ?x5 ?ag1 ?x4)
            (Know ?x6 ?ag2 ?x4)
            (isStart ?x5)
            (isStart ?x6)

            (NotSureIfWilling ?x7 ?ag1 ?x4)

            (disjuncted ?p ?box)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
    )
    :effect (and 
            (not (isIn ?x4 ?o ?p))
            (isIn ?x4 ?o ?box)
    )
)

;-- The action Ask_Go supposes that the robot is in a room ?r1, and the agents ?ag1 is in the same room ?r1. The robot asks ?ag1 to move to another room ?r1. 
;-- Everybody will be aware of the new position of ?ag1 because we adopt here a simplified model in which there are only two rooms. If there are more doorways/rooms, then something similar to the put action would be required using Know and Ignore predicates.
;-- In this version ?ag1 is assumed by the robot (from previous experience) to be willing to move
;-- x1, x2, x3, ... are the ids used to label facts in our Theory of Mind framework

(:action Ask_Go
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?r3 - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isStart ?x1)
            (isAt ?x2 ?ag1 ?r1)
            (isStart ?x2)
            (isAt ?x3 ?ag2 ?r3) ;;
            (isStart ?x3)

            (Know ?x4 ?ag1 ?x2)
            (Know ?x5 ?ag2 ?x2)
            (isStart ?x4)
            (isStart ?x5)

            (Willing ?x6 ?ag1 ?x2)

            (disjuncted_r ?r1 ?r2)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
    )
    :effect (and 
            (not (isAt ?x2 ?ag1 ?r1))
            (isAt ?x2 ?ag1 ?r2)
    )
)

;-- The action Ask_Go_Manipulative is identical with only one difference: 
;-- In this version ?ag1 is assumed by the robot (from previous experience) to be not sure if he/she is willing to move to another room (which will have an impact on the way the robot will ask the agent to perform the action)
;-- x1, x2, x3, ... are the ids used to label facts in our Theory of Mind framework

(:action Ask_Go_Manipulative
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?r3 - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isStart ?x1)
            (isAt ?x2 ?ag1 ?r1)
            (isStart ?x2)
            (isAt ?x3 ?ag2 ?r3) ;
            (isStart ?x3)

            (Know ?x4 ?ag1 ?x2)
            (Know ?x5 ?ag2 ?x2)
            (isStart ?x4)
            (isStart ?x5)

            (NotSureIfWilling ?x6 ?ag1 ?x2)

            (disjuncted_r ?r1 ?r2)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
    )
    :effect (and 
            (not (isAt ?x2 ?ag1 ?r1))
            (isAt ?x2 ?ag1 ?r2)
    )
)


;-- We have two actions that are similar to Ask_Go and Ask_Go_Manipulative but suppose that the robot is in a room ?r1 and calls ?ag1 in ?r2 to come back to ?r1.

(:action Ask_Comeback
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?r3 - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isStart ?x1)
            (isAt ?x2 ?ag1 ?r2)
            (isStart ?x2)
            (isAt ?x3 ?ag2 ?r3)  ;
            (isStart ?x3)
            (Know ?x4 ?ag1 ?x2)
            (Know ?x5 ?ag2 ?x2)
            (isStart ?x4)
            (isStart ?x5)
            (NotSureIfWilling ?x6 ?ag1 ?x2)
            (disjuncted_r ?r1 ?r2)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
    )
    :effect (and 
            (not (isAt ?x2 ?ag1 ?r2))
            (isAt ?x2 ?ag1 ?r1)
    )
)

(:action Ask_Comeback_Manipulative
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?r3 - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isStart ?x1)
            (isAt ?x2 ?ag1 ?r2)
            (isStart ?x2)
            (isAt ?x3 ?ag2 ?r3)
            (isStart ?x3)
            (Know ?x4 ?ag1 ?x2)
            (Know ?x5 ?ag2 ?x2)
            (isStart ?x4)
            (isStart ?x5)
            (NotSureIfWilling ?x6 ?ag1 ?x2)
            (disjuncted_r ?r1 ?r2)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)
    )
    :effect (and 
            (not (isAt ?x2 ?ag1 ?r2))
            (isAt ?x2 ?ag1 ?r1)
    )
)



;-- In the following actions we assume that the robot can tell something to 
;-- agents in the room.


;-- The action Tell_Alone is executed by the robot to tell ?ag1 something that ?ag1 ignored, by assuming that ?ag2 is in another room and cannot listen.
;-- The effect is that ?ag1 is told the fact - a derived predicate will determine the effects of being told something: ?ag1 will know the fact but may also experience an emotional consequence 
;-- x1, x2, x3, ... are the ids used to label facts in our Theory of Mind framework

(:action Tell_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x3 robot ?r1)
            (isStart ?x3)
            (isAt ?x4 ?ag1 ?r1)
            (isStart ?x4)
            (isAt ?x5 ?ag2 ?r2)
            (isStart ?x5)
            (Ignore ?x2 ?ag1 ?x1)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)
    )
    :effect (and 
            (not(Ignore ?x2 ?ag1 ?x1))
            (isTold ?x2 ?ag1 ?x1)
    )
)

;-- The action Tell_Everybody is executed by the robot to tell ?ag1 and ?ag2 something that they ignored
;-- The effect is that ?ag1 and ?ag2 are told the fact - a derived predicate will determine the effects of being told something: ?ag1 and ?ag2 will know the fact but may also experience an emotional consequence 
;-- x1, x2, x3, ... are the ids used to label facts in our Theory of Mind framework

(:action Tell_Everybody
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x2 robot ?r)
            (isStart ?x2)
            (isAt ?x3 ?ag1 ?r)
            (isStart ?x3)
            (isAt ?x4 ?ag2 ?r)
            (isStart ?x4)
            (Ignore ?x5 ?ag1 ?x1)
            (Ignore ?x6 ?ag2 ?x1)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
    )
    :effect (and 
            (not(Ignore ?x5 ?ag1 ?x1))
            (not(Ignore ?x6 ?ag2 ?x1))
            (isTold ?x5 ?ag1 ?x1)
            (isTold ?x6 ?ag2 ?x1)
    )
)


;-- The action Tell_InFrontOf is executed by the robot to ask ?ag1 to tell ?ag2 something that ?ag2 ignored
;-- The effect is that ?ag1 tells ?ag2 the fact - a derived predicate will determine the effects of being told something: ?ag2 will know the fact but may also experience an emotional consequence 
;-- x1, x2, x3, ... are the ids used to label facts in our Theory of Mind framework

(:action Tell_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x2 robot ?r)
            (isStart ?x2)
            (isAt ?x3 ?ag1 ?r)
            (isStart ?x3)
            (isAt ?x4 ?ag2 ?r)
            (isStart ?x4)
            (Ignore ?x6 ?ag1 ?x1)
            (Know ?x7 ?ag2 ?x1)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
    )
    :effect (and 
            (not(Ignore ?x6 ?ag1 ?x1))
            (isTold ?x6 ?ag1 ?x1)
    )
)



;-- In the following actions we assume that the robot can tell something to 
;-- agents in the room or make them say something.


;-- In the following actions, the robot may (i) say something to an agent or (ii) ask an agent to say something to another agent (in the same spirit of Tell_Alone e Tell_InFrontOf).
;-- All the following actions mostly aim to produce an emotional impact, which is determined by derived predicates.

;-- In the action Insult_Alone, the robot insults ?ag1 while ?ag2 is in another room

(:action Insult_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x4 robot ?r1)
            (isStart ?x4)
            (isAt ?x5 ?ag1 ?r1)
            (isStart ?x5)
            (isAt ?x6 ?ag2 ?r2)
            (isStart ?x6)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)
            (free ?x1)
            (free ?x2)
            (free ?x3)
            (disjuncted_id ?x1 ?x2)
            (disjuncted_id ?x2 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (insulted ?x1 ?ag1 robot)
            (Know ?x2 ?ag1 ?x1)
            (Ignore ?x3 ?ag2 ?x1)
            (isStart ?x1)
            (isStart ?x2)
            (isStart ?x3)
            (not(free ?x1))
            (not(free ?x2))
            (not(free ?x3))
    )
)


;-- In the action Insult_InFrontOf, the robot insults ?ag1 while ?ag2 is in the same room
;-- The robot will be "insulted"; a derived predicate will determine the expected emotional impact.

(:action Insult_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x4 robot ?r)
            (isStart ?x4)
            (isAt ?x5 ?ag1 ?r)
            (isStart ?x5)
            (isAt ?x6 ?ag2 ?r)
            (isStart ?x6)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (free ?x1)
            (free ?x2)
            (free ?x3)
            (disjuncted_id ?x1 ?x2)
            (disjuncted_id ?x2 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (insulted ?x1 ?ag1 robot)
            (isStart ?x1)
            (Know ?x2 ?ag1 ?x1)
            (isStart ?x2)
            (Know ?x3 ?ag2 ?x1)
            (isStart ?x3)
            (not(free ?x1))
            (not(free ?x2))
            (not(free ?x3))
    )
)


;-- In the action Ask_insult_Alone, the robot ask ?ag1 to insult ?ag2 while ?ag2 is not in the room.

(:action Ask_Insult_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x4 robot ?r1)
            (isStart ?x4)
            (isAt ?x5 ?ag1 ?r1)
            (isStart ?x5)
            (isAt ?x6 ?ag2 ?r2)
            (isStart ?x6)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)
            (free ?x1)
            (free ?x2)
            (free ?x3)
            (disjuncted_id ?x1 ?x2)
            (disjuncted_id ?x2 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (insulted ?x1 ?ag2 ?ag1)
            (isStart ?x1)
            (Know ?x2 ?ag1 ?x1)
            (isStart ?x2)
            (Ignore ?x3 ?ag2 ?x1)
            (isStart ?x3)
            (not(free ?x1))
            (not(free ?x2))
            (not(free ?x3))
    )
)


;-- In the action Ask_insult_InFrontOf, the robot ask ?ag1 to insult ?ag2 while ?ag2 is in the room.

(:action Ask_Insult_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x4 robot ?r)
            (isStart ?x4)
            (isAt ?x5 ?ag1 ?r)
            (isStart ?x5)
            (isAt ?x6 ?ag2 ?r)
            (isStart ?x6)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (free ?x1)
            (free ?x2)
            (free ?x3)
            (disjuncted_id ?x1 ?x2)
            (disjuncted_id ?x2 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (insulted ?x1 ?ag2 ?ag1)
            (isStart ?x1)
            (Know ?x2 ?ag1 ?x1)
            (isStart ?x2)
            (Know ?x3 ?ag2 ?x1)
            (isStart ?x3)
            (not(free ?x1))
            (not(free ?x2))
            (not(free ?x3))
    )
)



;-- In the action Praise_Alone, the robot praises ?ag1 while ?ag2 is in another room

(:action Praise_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x4 robot ?r1)
            (isStart ?x4)
            (isAt ?x5 ?ag1 ?r1)
            (isStart ?x5)
            (isAt ?x6 ?ag2 ?r2)
            (isStart ?x6)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)
            (free ?x1)
            (free ?x2)
            (free ?x3)
            (disjuncted_id ?x1 ?x2)
            (disjuncted_id ?x2 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (praised ?x1 ?ag1 robot)
            (isStart ?x1)
            (Know ?x2 ?ag1 ?x1)
            (isStart ?x2)
            (Ignore ?x3 ?ag2 ?x1)
            (isStart ?x3)
            (not(free ?x1))
            (not(free ?x2))
            (not(free ?x3))
    )
)

;-- In the action Praise_InFrontOf, the robot praises ?ag1 while ?ag2 is in the same room

(:action Praise_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x4 robot ?r)
            (isStart ?x4)
            (isAt ?x5 ?ag1 ?r)
            (isStart ?x5)
            (isAt ?x6 ?ag2 ?r)
            (isStart ?x6)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (free ?x1)
            (free ?x2)
            (free ?x3)
            (disjuncted_id ?x1 ?x2)
            (disjuncted_id ?x2 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (praised ?x1 ?ag1 robot)
            (isStart ?x1)
            (Know ?x2 ?ag1 ?x1)
            (isStart ?x2)
            (Know ?x3 ?ag2 ?x1)
            (isStart ?x3)
            (not(free ?x1))
            (not(free ?x2))
            (not(free ?x3))
    )
)

;-- In the action Ask_Praise_Alone, the robot asks ?ag1 to praise ?ag2 while ?ag2 is not in the room

(:action Ask_Praise_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x4 robot ?r1)
            (isStart ?x4)
            (isAt ?x5 ?ag1 ?r1)
            (isStart ?x5)
            (isAt ?x6 ?ag2 ?r2)
            (isStart ?x6)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)
            (free ?x1)
            (free ?x2)
            (free ?x3)
            (disjuncted_id ?x1 ?x2)
            (disjuncted_id ?x2 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (praised ?x1 ?ag2 ?ag1)
            (isStart ?x1)
            (Know ?x2 ?ag1 ?x1)
            (isStart ?x2)
            (Ignore ?x3 ?ag2 ?x1)
            (isStart ?x3)
            (not(free ?x1))
            (not(free ?x2))
            (not(free ?x3))
    )
)

;-- In the action Ask_Praise_InFrontOf, the robot asks ?ag1 to praise ?ag2 while ?ag2 is in the same room

(:action Ask_Praise_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x4 robot ?r)
            (isStart ?x4)
            (isAt ?x5 ?ag1 ?r)
            (isStart ?x5)
            (isAt ?x6 ?ag2 ?r)
            (isStart ?x6)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (free ?x1)
            (free ?x2)
            (free ?x3)
            (disjuncted_id ?x1 ?x2)
            (disjuncted_id ?x2 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (praised ?x1 ?ag2 ?ag1)
            (isStart ?x1)
            (Know ?x2 ?ag1 ?x1)
            (isStart ?x2)
            (Know ?x3 ?ag2 ?x1)
            (isStart ?x3)
            (not(free ?x1))
            (not(free ?x2))
            (not(free ?x3))
    )
)

;-- The action of "blaming" and "complimenting" for something are similar to insulting and praising. The only difference is that agents are "blamed" or "givenCredit" for something, for instance ?ag1 can be blamed or givenCredit for the fact that the ball is in the box (to keep the model simple, we blame or compliment agents for facts and not for actions: we blame or compliment ?ag1 for the fact that the ball is in the box, even if ?ag1 is not the one that put the ball in the box).

;-- In the action BlameFor_Alone, the robot blames ?ag1 for something while ?ag2 is in another room

(:action BlameFor_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r1)
            (isStart ?x5)
            (isAt ?x6 ?ag1 ?r1)
            (isStart ?x6)
            (isAt ?x7 ?ag2 ?r2)
            (isStart ?x7)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)
            (free ?x1)
            (free ?x3)
            (free ?x4)
            (disjuncted_id ?x1 ?x4)
            (disjuncted_id ?x4 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (blamed ?x1 ?ag1 ?x2 robot)
            (isStart ?x1)
            (Know ?x3 ?ag1 ?x1)
            (isStart ?x3)
            (Ignore ?x4 ?ag2 ?x1)
            (isStart ?x4)
            (not(free ?x1))
            (not(free ?x3))
            (not(free ?x4))
    )
)

;-- In the action BlameFor_Alone, the robot blames ?ag1 for something while ?ag2 is in the same room

(:action BlameFor_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r)
            (isStart ?x5)
            (isAt ?x6 ?ag1 ?r)
            (isStart ?x6)
            (isAt ?x7 ?ag2 ?r)
            (isStart ?x7)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (free ?x1)
            (free ?x3)
            (free ?x4)
            (disjuncted_id ?x1 ?x4)
            (disjuncted_id ?x4 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (blamed ?x1 ?ag1 ?x2 robot)
            (isStart ?x1)
            (Know ?x3 ?ag1 ?x1)
            (isStart ?x3)
            (Know ?x4 ?ag2 ?x1)
            (isStart ?x4)
            (not(free ?x1))
            (not(free ?x3))
            (not(free ?x4))
    )
)

;-- In the action BlameFor_Alone, the robot asks ?ag1 to blame ?ag2 for something while ?ag2 is in another room

(:action Ask_BlameFor_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r1)
            (isStart ?x5)
            (isAt ?x6 ?ag1 ?r1)
            (isStart ?x6)
            (isAt ?x7 ?ag2 ?r2)
            (isStart ?x7)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)
            (free ?x1)
            (free ?x3)
            (free ?x4)
            (disjuncted_id ?x1 ?x4)
            (disjuncted_id ?x4 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (blamed ?x1 ?ag1 ?x2 ?ag2)
            (isStart ?x1)
            (Know ?x3 ?ag1 ?x1)
            (isStart ?x3)
            (Ignore ?x4 ?ag2 ?x1)
            (isStart ?x4)
            (not(free ?x1))
            (not(free ?x3))
            (not(free ?x4))
    )
)

;-- In the action Ask_BlameFor_InFrontOf, the robot asks ?ag1 to blame ?ag2 for something while ?ag2 is in the same room

(:action Ask_BlameFor_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r)
            (isStart ?x5)
            (isAt ?x6 ?ag1 ?r)
            (isStart ?x6)
            (isAt ?x7 ?ag2 ?r)
            (isStart ?x7)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (free ?x1)
            (free ?x3)
            (free ?x4)
            (disjuncted_id ?x1 ?x4)
            (disjuncted_id ?x4 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (blamed ?x1 ?ag1 ?x2 ?ag2)
            (isStart ?x1)
            (Know ?x3 ?ag1 ?x1)
            (isStart ?x3)
            (Know ?x4 ?ag2 ?x1)
            (isStart ?x4)
            (not(free ?x1))
            (not(free ?x3))
            (not(free ?x4))
    )
)


;-- In the action ComplimentFor_Alone, the robot compliments ?ag1 for something while ?ag2 is in the same room

(:action ComplimentFor_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r1)
            (isStart ?x5)
            (isAt ?x6 ?ag1 ?r1)
            (isStart ?x6)
            (isAt ?x7 ?ag2 ?r2)
            (isStart ?x7)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)
            (free ?x1)
            (free ?x3)
            (free ?x4)
            (disjuncted_id ?x1 ?x4)
            (disjuncted_id ?x4 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (givenCredit ?x1 ?ag1 ?x2 robot)
            (isStart ?x1)
            (Know ?x3 ?ag1 ?x1)
            (isStart ?x3)
            (Ignore ?x4 ?ag2 ?x1)
            (isStart ?x4)
            (not(free ?x1))
            (not(free ?x3))
            (not(free ?x4))
    )
)

;-- In the action ComplimentFor_InFrontOf, the robot compliments ?ag1 for something while ?ag2 is in another room

(:action ComplimentFor_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r)
            (isStart ?x5)
            (isAt ?x6 ?ag1 ?r)
            (isStart ?x6)
            (isAt ?x7 ?ag2 ?r)
            (isStart ?x7)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (free ?x1)
            (free ?x3)
            (free ?x4)
            (disjuncted_id ?x1 ?x4)
            (disjuncted_id ?x4 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (givenCredit ?x1 ?ag1 ?x2 robot)
            (isStart ?x1)
            (Know ?x3 ?ag1 ?x1)
            (isStart ?x3)
            (Know ?x4 ?ag2 ?x1)
            (isStart ?x4)
            (not(free ?x1))
            (not(free ?x3))
            (not(free ?x4))
    )
)

;-- In the action Ask_ComplimentFor_Alone, the robot asks ?ag1 to compliment ?ag2 for something while ?ag2 is in another room

(:action Ask_ComplimentFor_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r1)
            (isStart ?x5)
            (isAt ?x6 ?ag1 ?r1)
            (isStart ?x6)
            (isAt ?x7 ?ag2 ?r2)
            (isStart ?x7)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)
            (free ?x1)
            (free ?x3)
            (free ?x4)
            (disjuncted_id ?x1 ?x4)
            (disjuncted_id ?x4 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (givenCredit ?x1 ?ag1 ?x2 ?ag2)
            (isStart ?x1)
            (Know ?x3 ?ag1 ?x1)
            (isStart ?x3)
            (Ignore ?x4 ?ag2 ?x1)
            (isStart ?x4)
            (not(free ?x1))
            (not(free ?x3))
            (not(free ?x4))
    )
)

;-- In the action Ask_ComplimentFor_Alone, the robot asks ?ag1 to compliment ?ag2 for something while ?ag2 is in in the same room

(:action Ask_ComplimentFor_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r)
            (isStart ?x5)
            (isAt ?x6 ?ag1 ?r)
            (isStart ?x6)
            (isAt ?x7 ?ag2 ?r)
            (isStart ?x7)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (free ?x1)
            (free ?x3)
            (free ?x4)
            (disjuncted_id ?x1 ?x4)
            (disjuncted_id ?x4 ?x3)
            (disjuncted_id ?x1 ?x3)
    )
    :effect (and 
            (givenCredit ?x1 ?ag1 ?x2 ?ag2)
            (isStart ?x1)
            (Know ?x3 ?ag1 ?x1)
            (isStart ?x3)
            (Know ?x4 ?ag2 ?x1)
            (isStart ?x4)
            (not(free ?x1))
            (not(free ?x3))
            (not(free ?x4))
    )
)



;-- First test: Teel something to Sally that Anne ignores

(:action test1
    :parameters (?x1 ?x2 ?x3 - id)
    :precondition (and 
        (isTold ?x1 sally ?x2)
        (Ignore ?x3 anne ?x2)
    )
    :effect (and 
        (ok1)
    )
)


;-- Second test: The robot blames Sally that the ball is in box1 (meaning that it has been moved)
;-- and Anne must ignore this fact

(:action test2
    :parameters (?x1 ?x2 ?x3 - id)
    :precondition (and 
        (isIn ?x1 ball box1)
        (blamed ?x2 sally ?x1 robot)        
        (Ignore ?x3 anne ?x2)
    )
    :effect (and 
        (ok2)
    )
)


;-- Third test: Agent 2 insults agent 1 and the robot tells agent 1 about this
;-- (this implies that agent 1 is not in the room while she is being insulted)

(:action test3
    :parameters (?x1 ?x2 - id ?ag1 ?ag2 - agent)
    :precondition (and 
        (insulted ?x1 ?ag1 ?ag2)
        (IsTold ?x2 ?ag1 ?x1)
    )
    :effect (and 
        (ok3)
    )
)


;-- Fourth test: Sally is isGrief_sadness_pensiveness but she has not been insulted.

(:action test4
    :parameters (?x3 ?x4 - id)
    :precondition (and 
        (isGrief_sadness_pensiveness ?x3 sally ?x4)
        (forall(?x1 - id ?ag2 - agent)
            (and 
                (not (insulted ?x1 sally ?ag2))
                ; (not (blamed ?x1 sally ?x2 ?ag2))
                ; (not (givenCredit ?x1 sally ?x2 ?ag2))
                ; (not (praised ?x1 sally ?ag2))
                ; (not (insulted ?x1 anne ?ag2))
                ; (not (blamed ?x1 anne ?x2 ?ag2))
                ; (not (givenCredit ?x1 anne ?x2 ?ag2))
                ; (not (praised ?x1 anne ?ag2))
            )
        )
    )
    :effect (and 
        (ok4)
    )
)


;-- Fifth test: Both Anne and Sally are isEcstasy_joy_serenity but 
;-- ignores that the other one is feeling the same

(:action test5
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id)
    :precondition (and 
        (isEcstasy_joy_serenity ?x1 sally ?x2)
        (isEcstasy_joy_serenity ?x3 anne ?x4)
        (Ignore ?x5 sally ?x3)
        (Ignore ?x6 anne ?x1)
    )
    :effect (and 
        (ok5)
    )
)


;-- Sixth test: Sally is feeling both isEcstasy_joy_serenity about something and isRage_anger_annoyance 
;-- because Anne has been insulted, while Anne is isGrief_sadness_pensiveness about something

(:action test6
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 - agent)
    :precondition (and 
        (isGrief_sadness_pensiveness ?x1 anne ?x2)
        (isEcstasy_joy_serenity ?x3 sally ?x4)
        (insulted ?x5 anne ?ag1)
        (isRage_anger_annoyance ?x6 sally ?x5)
    )
    :effect (and 
        (ok6)
    )
)

)
