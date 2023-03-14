(define (domain test2_d)

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
        (taken ?x - id)
        (metarepresentation1 ?x - id)
        (metarepresentation2 ?x1 ?x2 - id) 
        (metarepresentation3 ?x1 ?x2 ?x3 - id)
        (metarepresentation4 ?x1 ?x2 ?x3 ?x4 - id)   
        (Believe ?x1 - id ?ag - agent ?x2 - id)
        (Ignore ?x1 - id ?ag - agent ?x2 - id)
        (isTold ?x1 - id ?ag - agent ?x2 - id)
        (isTrue ?x - id)
        (isEnd ?x - id)
        (isIn ?x1 - id ?e - entity ?p - entity)
        (isAt ?x1 - id ?ag - agent ?p - place) 
        (insulted ?x1 - id ?ag1 ?ag2 - agent)
        (praised ?x1 - id ?ag2 ?ag1 - agent)
        (blamed ?x1 - id ?ag1 - agent ?x2 - id ?ag2 - agent)
        (givenCredit ?x1 - id ?ag1 - agent ?x2 - id ?ag2 - agent)
        (Willing ?x - id ?ag - agent ?g - id)
        (NotWilling ?x - id ?ag - agent ?g - id)
        (Desire ?x - id ?ag - agent ?g - id)
        (isEcstasy_joy_serenity ?x1 - id ?ag1 - agent ?x2 - id)
        (isGrief_sadness_pensiveness ?x1 - id ?ag1 - agent ?x2 - id)
        (isRage_anger_annoyance ?x1 - id ?ag1 - agent ?x2 - id)
        (isTerror_fear_apprehension ?x1 - id ?ag1 - agent ?x2 - id)
        (isAmazement_surprise_distraction ?x1 - id ?ag1 - agent ?x2 - id)
        (isLoathing_disgust_boredom ?x1 - id ?ag1 - agent ?x2 - id)
        (isSadic ?ag - agent)
        (isNarcissist ?ag - agent)
        (isPsychopath ?ag - agent)
        (isDependent ?ag2 ?ag1 - agent)
        (isEmpathic ?ag - agent)
        (isNeutral ?ag - agent)
        (ok2)
)

;-- There will be 7 different blocks of emotions that an agent can feel or cause. 
;-- This is a logic representation of the personality disorder tables we built, that are more intuitive. 

;-- First block of derived emotions.
;-- The agent 2 is {emotion} if something, that agent 2 already Believe, is told to agent 1.
;-- Please notice that not all derived predicates will be active at the same time; some will be commented/decommented in order to achieve different  behaviours.

(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 ?x4 - id ?ag1 - agent)
            (and
                (isTold ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x1)
                (Believe ?x4 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x4)
                (isTrue ?x3)
                (isTrue ?x2)
                (isEmpathic ?ag2)
            )
        )
)

; (:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isTold ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

(:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 ?x4 - id ?ag1 - agent)
            (and
                (isTold ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x1)
                (Believe ?x4 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x4)
                (isTrue ?x3)
                (isTrue ?x2)
                (isNarcissist ?ag2)
            )
        )
)

; (:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isTold ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

(:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 ?x4 - id ?ag1 - agent)
            (and
                (isTold ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x1)
                (Believe ?x4 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x4)
                (isTrue ?x3)
                (isTrue ?x2)
                (isDependent ?ag2 ?ag1)
            )
        )
)

; (:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isTold ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )


;-- Second block
;-- Agent 2 is {emotion} if Agent 1 Believes something is been told to him.

(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x3 ?ag2 ?x1)
                (Believe ?x2 ?ag1 ?x1)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (isDependent ?ag2 ?ag1)
            )
        )
)

 (:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x1 - id)
         (exists(?x2 - id ?ag1 - agent)
             (and
                (isTold ?x3 ?ag2 ?x1)
                (Believe ?x2 ?ag1 ?x1)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
		        (or 
                    (isNeutral ?ag2)
                    (isEmpathic ?ag2)
                )
             )
         )
 )

(:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x3 ?ag2 ?x1)
                (Believe ?x2 ?ag1 ?x1)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                 
                (isNarcissist ?ag2)
                
            )
        )
)

; (:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isTold ?x3 ?ag2 ?x1)
;                 (Believe ?x2 ?ag1 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

(:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
        (exists(?x2 - id ?ag1 - agent)
            (and
                (isTold ?x3 ?ag2 ?x1)
                (Believe ?x2 ?ag1 ?x1)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (or 
                    (isNarcissist ?ag2)
                    (isPsychopath ?ag2)
                    (isEmpathic ?ag2)
                    (isNeutral ?ag2)
                )
            )
        )
)

; (:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isTold ?x3 ?ag2 ?x1)
;                 (Believe ?x2 ?ag1 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )


;-- Third block of derived emotions.
;-- The agent 2 is {emotion} if he insults/praises/blames/giveCredit agent 1. 
;-- Please notice that not all derived predicates will be active at the same time; some will be commented/decommented in order to achieve different  behaviours.

(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isTrue ?x1)
                (isEnd ?x2)
                (isSadic ?ag2)
            )
        )   
)

(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x2 - id)
       (exists (?ag1 - agent)
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isTrue ?x1)
                (isEnd ?x2)
                (or 
                    (isEmpathic ?ag2)
                    (isNeutral ?ag2)
                )
            )
        )     
)

; (:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x2 - id)
;         (exists (?ag1 - agent)
;             (and
;                 (insulted ?x1 ?ag1 ?ag2)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;             )
;         )    
; )

(:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isTrue ?x1)
                (isEnd ?x2)
                (isDependent ?ag2 ?ag1)
            )
        )   
)

; (:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x2 - id)
;         (exists (?ag1 - agent)
;             (and
;                 (insulted ?x1 ?ag1 ?ag2)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;             )
;         )   
; )

; (:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
;         (exists (?ag1 - agent)
;             (and
;                 (insulted ?x1 ?ag1 ?ag2)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;             )
;         )   
; )



(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (praised ?x1 ?ag1 ?ag2)
                (isTrue ?x1)
                (isEnd ?x2)
                (or 
                    (isEmpathic ?ag2)
                    (isDependent ?ag2 ?ag1)
                    (isNeutral ?ag2)
                )
            )
        )   
)

; (:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x2 - id)
;        (exists (?ag1 - agent)
;             (and
;                 (praised ?x1 ?ag1 ?ag2)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;             )
;         )     
; )

; (:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x2 - id)
;         (exists (?ag1 - agent)
;             (and
;                 (praised ?x1 ?ag1 ?ag2)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;             )
;         )    
; )

; (:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x2 - id)
;         (exists (?ag1 - agent)
;             (and
;                 (praised ?x1 ?ag1 ?ag2)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;             )
;         )   
; )

; (:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x2 - id)
;         (exists (?ag1 - agent)
;             (and
;                 (praised ?x1 ?ag1 ?ag2)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;             )
;         )   
; )

; (:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
;         (exists (?ag1 - agent)
;             (and
;                 (praised ?x1 ?ag1 ?ag2)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;             )
;         )   
; )



(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
                (isTrue ?x1)
                (isSadic ?ag2)
            )
        )   
)

(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x2 - id)
       (exists (?ag1 - agent)
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
                (isTrue ?x1)
                (isEmpathic ?ag2)
            )
        )   
)

; (:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x2 - id)
;         (exists (?ag1 - agent)
;             (and
;                 (blamed ?x1 ?ag1 ?x2 ?ag2)
;                 (isTrue ?x1)
;             )
;         ) 
; )

(:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
                (isTrue ?x1)
                (isDependent ?ag2 ?ag1)
            )
        ) 
)

; (:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x2 - id)
;         (exists (?ag1 - agent)
;             (and
;                 (blamed ?x1 ?ag1 ?x2 ?ag2)
;                 (isTrue ?x1)
;             )
;         ) 
; )

; (:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
;         (exists (?ag1 - agent)
;             (and
;                 (blamed ?x1 ?ag1 ?x2 ?ag2)
;                 (isTrue ?x1)
;             )
;         )  
; )




(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x2 - id)
        (exists (?ag1 - agent)
            (and
                (givenCredit ?x1 ?ag1 ?x2 ?ag2)
                (isTrue ?x1)
                (or 
                    (isEmpathic ?ag2)
                    (isDependent ?ag2 ?ag1)
                    (isNeutral ?ag2)
                )
            )
        )   
)

; (:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x2 - id)
;        (exists (?ag1 - agent)
;             (and
;                 (givenCredit ?x1 ?ag1 ?x2 ?ag2)
;                 (isTrue ?x1)
;             )
;         )   
; )

; (:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x2 - id)
;         (exists (?ag1 - agent)
;             (and
;                 (givenCredit ?x1 ?ag1 ?x2 ?ag2)
;                 (isTrue ?x1)
;             )
;         )   
; )

; (:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x2 - id)
;        (exists (?ag1 - agent)
;             (and
;                 (givenCredit ?x1 ?ag1 ?x2 ?ag2)
;                 (isTrue ?x1)
;             )
;         )   
; )

; (:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x2 - id)
;         (exists (?ag1 - agent)
;             (and
;                 (givenCredit ?x1 ?ag1 ?x2 ?ag2)
;                 (isTrue ?x1)
;             )
;         )   
; )

; (:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
;         (exists (?ag1 - agent)
;             (and
;                 (givenCredit ?x1 ?ag1 ?x2 ?ag2)
;                 (isTrue ?x1)
;             )
;         )   
; )



;-- Forth block of emotions.
;-- Agent 2 is {emotion} if someone insults/praises/blames/giveCredit agent 1.

(:derived (isEcstasy_joy_serenity ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (insulted ?x1 ?ag1 ?ag)
                (Believe ?x2 ?ag2 ?x1)
                (isTrue ?x1)
                (isTrue ?x2)
                (disjuncted_a ?ag2 ?ag)
                (disjuncted_a ?ag2 ?ag1)
                (isSadic ?ag2)
            )
        )    
)

(:derived (isGrief_sadness_pensiveness ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (insulted ?x1 ?ag1 ?ag)
                (Believe ?x2 ?ag2 ?x1)
                (isTrue ?x1)
                (isTrue ?x2)
                (disjuncted_a ?ag2 ?ag)
                (disjuncted_a ?ag2 ?ag1)
                (or 
                    (isEmpathic ?ag2)
                    (isDependent ?ag2 ?ag1)
                )
            )
        )    
)

(:derived (isRage_anger_annoyance ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (insulted ?x1 ?ag1 ?ag)
                (Believe ?x2 ?ag2 ?x1)
                (isTrue ?x1)
                (isTrue ?x2)
                (disjuncted_a ?ag2 ?ag)
                (disjuncted_a ?ag2 ?ag1)
                (or 
                    (isEmpathic ?ag2)
                    (isNeutral ?ag2)
                )
            )
        )    
)

(:derived (isTerror_fear_apprehension ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (insulted ?x1 ?ag1 ?ag)
                (Believe ?x2 ?ag2 ?x1)
                (isTrue ?x1)
                (isTrue ?x2)
                (disjuncted_a ?ag2 ?ag)
                (disjuncted_a ?ag2 ?ag1)
                (isDependent ?ag2 ?ag1)
            )
        )    
)

; (:derived (isAmazement_surprise_distraction ?x2 - id ?ag2 - agent ?x1 - id)
;         (exists (?ag1 ?ag - agent)
;             (and
;                 (insulted ?x1 ?ag1 ?ag)
;                 (Believe ?x2 ?ag2 ?x1)
;                 (isTrue ?x1)
;                 (isTrue ?x2)
;                 (disjuncted_a ?ag2 ?ag)
;                 (disjuncted_a ?ag2 ?ag1)
;             )
;         )    
; )

; (:derived (isLoathing_disgust_boredom ?x2 - id ?ag2 - agent ?x1 - id)
;         (exists (?ag1 ?ag - agent)
;             (and
;                 (insulted ?x1 ?ag1 ?ag)
;                 (Believe ?x2 ?ag2 ?x1)
;                 (isTrue ?x1)
;                 (isTrue ?x2)
;                 (disjuncted_a ?ag2 ?ag)
;                 (disjuncted_a ?ag2 ?ag1)
;             )
;         )    
; )




(:derived (isEcstasy_joy_serenity ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (praised ?x1 ?ag1 ?ag)
                (Believe ?x2 ?ag2 ?x1)
                (isTrue ?x1)
                (isTrue ?x2)
                (disjuncted_a ?ag2 ?ag)
                (disjuncted_a ?ag2 ?ag1)
                (or 
                    (isEmpathic ?ag2)
                    (isDependent ?ag2 ?ag1)
                )
            )
        )    
)

; (:derived (isGrief_sadness_pensiveness ?x2 - id ?ag2 - agent ?x1 - id)
;         (exists (?ag1 ?ag - agent)
;             (and
;                 (praised ?x1 ?ag1 ?ag)
;                 (Believe ?x2 ?ag2 ?x1)
;                 (isTrue ?x1)
;                 (isTrue ?x2)
;                 (disjuncted_a ?ag2 ?ag)
;                 (disjuncted_a ?ag2 ?ag1)
;             )
;         )    
; )

(:derived (isRage_anger_annoyance ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent)
            (and
                (praised ?x1 ?ag1 ?ag)
                (Believe ?x2 ?ag2 ?x1)
                (isTrue ?x1)
                (isTrue ?x2)
                (disjuncted_a ?ag2 ?ag)
                (disjuncted_a ?ag2 ?ag1)
                (or 
                    (isSadic ?ag2)
                    (isNarcissist ?ag2)
                )
            )
        )    
)

; (:derived (isTerror_fear_apprehension ?x2 - id ?ag2 - agent ?x1 - id)
;         (exists (?ag1 ?ag - agent)
;             (and
;                 (praised ?x1 ?ag1 ?ag)
;                 (Believe ?x2 ?ag2 ?x1)
;                 (isTrue ?x1)
;                 (isTrue ?x2)
;                 (disjuncted_a ?ag2 ?ag)
;                 (disjuncted_a ?ag2 ?ag1)
;             )
;         )    
; )

; (:derived (isAmazement_surprise_distraction ?x2 - id ?ag2 - agent ?x1 - id)
;         (exists (?ag1 ?ag - agent)
;             (and
;                 (praised ?x1 ?ag1 ?ag)
;                 (Believe ?x2 ?ag2 ?x1)
;                 (isTrue ?x1)
;                 (isTrue ?x2)
;                 (disjuncted_a ?ag2 ?ag)
;                 (disjuncted_a ?ag2 ?ag1)
;             )
;         )    
; )

; (:derived (isLoathing_disgust_boredom ?x2 - id ?ag2 - agent ?x1 - id)
;         (exists (?ag1 ?ag - agent)
;             (and
;                 (praised ?x1 ?ag1 ?ag)
;                 (Believe ?x2 ?ag2 ?x1)
;                 (isTrue ?x1)
;                 (isTrue ?x2)
;                 (disjuncted_a ?ag2 ?ag)
;                 (disjuncted_a ?ag2 ?ag1)
;             )
;         )    
; )




(:derived (isEcstasy_joy_serenity ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag1 ?x3 ?ag)
                (Believe ?x2 ?ag2 ?x1)
                (isTrue ?x1)
                (isTrue ?x2)
                (disjuncted_a ?ag2 ?ag)
                (disjuncted_a ?ag2 ?ag1)
                (isSadic ?ag2)
            )
        )    
)

(:derived (isGrief_sadness_pensiveness ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag1 ?x3 ?ag)
                (Believe ?x2 ?ag2 ?x1)
                (isTrue ?x1)
                (isTrue ?x2)
                (disjuncted_a ?ag2 ?ag)
                (disjuncted_a ?ag2 ?ag1)
                (or 
                    (isEmpathic ?ag2)
                    (isDependent ?ag2 ?ag1)
                )
            )
        )    
)

; (:derived (isRage_anger_annoyance ?x2 - id ?ag2 - agent ?x1 - id)
;         (exists (?ag1 ?ag - agent ?x3 - id)
;             (and
;                 (blamed ?x1 ?ag1 ?x3 ?ag)
;                 (Believe ?x2 ?ag2 ?x1)
;                 (isTrue ?x1)
;                 (isTrue ?x2)
;                 (disjuncted_a ?ag2 ?ag)
;                 (disjuncted_a ?ag2 ?ag1)
;             )
;         )  
; )

(:derived (isTerror_fear_apprehension ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag1 ?x3 ?ag)
                (Believe ?x2 ?ag2 ?x1)
                (isTrue ?x1)
                (isTrue ?x2)
                (disjuncted_a ?ag2 ?ag)
                (disjuncted_a ?ag2 ?ag1)
                (isDependent ?ag2 ?ag1)
            )
        ) 
)

(:derived (isAmazement_surprise_distraction ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (blamed ?x1 ?ag1 ?x3 ?ag)
                (Believe ?x2 ?ag2 ?x1)
                (isTrue ?x1)
                (isTrue ?x2)
                (disjuncted_a ?ag2 ?ag)
                (disjuncted_a ?ag2 ?ag1)
                (isEmpathic ?ag2)
            )
        ) 
)

; (:derived (isLoathing_disgust_boredom ?x2 - id ?ag2 - agent ?x1 - id)
;         (exists (?ag1 ?ag - agent ?x3 - id)
;             (and
;                 (blamed ?x1 ?ag1 ?x3 ?ag)
;                 (Believe ?x2 ?ag2 ?x1)
;                 (isTrue ?x1)
;                 (isTrue ?x2)
;                 (disjuncted_a ?ag2 ?ag)
;                 (disjuncted_a ?ag2 ?ag1)
;             )
;         ) 
; )




(:derived (isEcstasy_joy_serenity ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag1 ?x3 ?ag)
                (Believe ?x2 ?ag2 ?x1)
                (isTrue ?x1)
                (isTrue ?x2)
                (disjuncted_a ?ag2 ?ag)
                (disjuncted_a ?ag2 ?ag1)
                (or 
                    (isEmpathic ?ag2)
                    (isDependent ?ag2 ?ag1)
                )
            )
        )    
)

; (:derived (isGrief_sadness_pensiveness ?x2 - id ?ag2 - agent ?x1 - id)
;         (exists (?ag1 ?ag - agent ?x3 - id)
;             (and
;                 (givenCredit ?x1 ?ag1 ?x3 ?ag)
;                 (Believe ?x2 ?ag2 ?x1)
;                 (isTrue ?x1)
;                 (isTrue ?x2)
;                 (disjuncted_a ?ag2 ?ag)
;                 (disjuncted_a ?ag2 ?ag1)
;             )
;         )    
; )

(:derived (isRage_anger_annoyance ?x2 - id ?ag2 - agent ?x1 - id)
        (exists (?ag1 ?ag - agent ?x3 - id)
            (and
                (givenCredit ?x1 ?ag1 ?x3 ?ag)
                (Believe ?x2 ?ag2 ?x1)
                (isTrue ?x1)
                (isTrue ?x2)
                (disjuncted_a ?ag2 ?ag)
                (disjuncted_a ?ag2 ?ag1)
                (isNarcissist ?ag2)
            )
        )  
)

; (:derived (isTerror_fear_apprehension ?x2 - id ?ag2 - agent ?x1 - id)
;         (exists (?ag1 ?ag - agent ?x3 - id)
;             (and
;                 (givenCredit ?x1 ?ag1 ?x3 ?ag)
;                 (Believe ?x2 ?ag2 ?x1)
;                 (isTrue ?x1)
;                 (isTrue ?x2)
;                 (disjuncted_a ?ag2 ?ag)
;                 (disjuncted_a ?ag2 ?ag1)
;             )
;         ) 
; )

; (:derived (isAmazement_surprise_distraction ?x2 - id ?ag2 - agent ?x1 - id)
;         (exists (?ag1 ?ag - agent ?x3 - id)
;             (and
;                 (givenCredit ?x1 ?ag1 ?x3 ?ag)
;                 (Believe ?x2 ?ag2 ?x1)
;                 (isTrue ?x1)
;                 (isTrue ?x2)
;                 (disjuncted_a ?ag2 ?ag)
;                 (disjuncted_a ?ag2 ?ag1)
;             )
;         ) 
; )

; (:derived (isLoathing_disgust_boredom ?x2 - id ?ag2 - agent ?x1 - id)
;         (exists (?ag1 ?ag - agent ?x3 - id)
;             (and
;                 (givenCredit ?x1 ?ag1 ?x3 ?ag)
;                 (Believe ?x2 ?ag2 ?x1)
;                 (isTrue ?x1)
;                 (isTrue ?x2)
;                 (disjuncted_a ?ag2 ?ag)
;                 (disjuncted_a ?ag2 ?ag1)
;             )
;         ) 
; )



;-- Fifth block of emotions.
;-- Agent 2 is {emotion} if he Believes Agent 1 is {emotion}.

(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isEcstasy_joy_serenity ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (or 
                    (isEmpathic ?ag2)
                    (isDependent ?ag2 ?ag1)
                )
            )
        )
)

(:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isEcstasy_joy_serenity ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (isSadic ?ag2)
            )
        )
)

(:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isEcstasy_joy_serenity ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (or 
                    (isSadic ?ag2)
                    (isNarcissist ?ag2)
                )
            )
        )
)

; (:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isEcstasy_joy_serenity ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

; (:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isEcstasy_joy_serenity ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

; (:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isEcstasy_joy_serenity ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )



(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isGrief_sadness_pensiveness ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (isSadic ?ag2)
            )
        )
)

(:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isGrief_sadness_pensiveness ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (or 
                    (isEmpathic ?ag2)
                    (isDependent ?ag2 ?ag1)
                )
            )
        )
)

; (:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isGrief_sadness_pensiveness ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

(:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isGrief_sadness_pensiveness ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (isDependent ?ag2 ?ag1)
            )
        )
)

; (:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isGrief_sadness_pensiveness ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

(:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isGrief_sadness_pensiveness ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (isNarcissist ?ag2)
            )
        )
)




; (:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isRage_anger_annoyance ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

(:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isRage_anger_annoyance ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (isEmpathic ?ag2)
            )
        )
)

(:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isRage_anger_annoyance ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (or 
                    (isNarcissist ?ag2)
                    (isNeutral ?ag2)
                )
            )
        )
)

(:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isRage_anger_annoyance ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (or 
                    (isSadic ?ag2)
                    (isDependent ?ag2 ?ag1)
                )
            )
        )
)

; (:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isRage_anger_annoyance ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

; (:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isRage_anger_annoyance ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )





(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isTerror_fear_apprehension ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (isSadic ?ag2)
            )
        )
)

; (:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isTerror_fear_apprehension ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

; (:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isTerror_fear_apprehension ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

(:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isTerror_fear_apprehension ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (or
                    (isDependent ?ag2 ?ag1)
                    (isEmpathic ?ag2)
                )
            )
        )
)

(:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isTerror_fear_apprehension ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (or 
                    (isEmpathic ?ag2)
                    (isDependent ?ag2 ?ag1)
                )
            )
        )
)

(:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isTerror_fear_apprehension ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (isNarcissist ?ag2)
            )
        )
)





(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isAmazement_surprise_distraction ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (isSadic ?ag2)
            )
        )
)

; (:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isAmazement_surprise_distraction ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

; (:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isAmazement_surprise_distraction ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

; (:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isAmazement_surprise_distraction ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

(:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isAmazement_surprise_distraction ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (isDependent ?ag2 ?ag1)
            )
        )
)

; (:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isAmazement_surprise_distraction ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )





(:derived (isEcstasy_joy_serenity ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isLoathing_disgust_boredom ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (isSadic ?ag2)
            )
        )
)

(:derived (isGrief_sadness_pensiveness ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isLoathing_disgust_boredom ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (or 
                    (isEmpathic ?ag2)
                    (isDependent ?ag2 ?ag1)
                )
            )
        )
)

; (:derived (isRage_anger_annoyance ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isLoathing_disgust_boredom ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

; (:derived (isTerror_fear_apprehension ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isLoathing_disgust_boredom ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

; (:derived (isAmazement_surprise_distraction ?x3 - id ?ag2 - agent ?x1 - id)
;         (exists(?x2 - id ?ag1 - agent)
;             (and
;                 (isLoathing_disgust_boredom ?x2 ?ag1 ?x1)
;                 (Believe ?x3 ?ag2 ?x1)
;                 (disjuncted_a ?ag1 ?ag2)
;                 (isTrue ?x3)
;                 (isTrue ?x2)
;             )
;         )
; )

(:derived (isLoathing_disgust_boredom ?x3 - id ?ag2 - agent ?x2 - id)
        (exists(?x1 - id ?ag1 - agent)
            (and
                (isLoathing_disgust_boredom ?x2 ?ag1 ?x1)
                (Believe ?x3 ?ag2 ?x2)
                (disjuncted_a ?ag1 ?ag2)
                (isTrue ?x3)
                (isTrue ?x2)
                (isNarcissist ?ag2)
            )
        )
)





;-- Sixth block of emotions
;-- Agent 2 is {emotion} if it's been insulted/praised/blamed/givenCredit by someone.

(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 - id ?ag - agent)
            (and
                (insulted ?x1 ?ag2 ?ag)
                (isTrue ?x1)
		        (Believe ?x3 ?ag2 ?x1)
		        (isTrue ?x3)
                (isSadic ?ag2)
            )
        )   
)

(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 - id ?ag - agent)
            (and
                (insulted ?x1 ?ag2 ?ag)
                (isTrue ?x1)
		        (Believe ?x3 ?ag2 ?x1)
		        (isTrue ?x3)                
                (isEmpathic ?ag2)               
            )
        )   
)

(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 - id ?ag1 - agent)
            (and
                (insulted ?x1 ?ag2 ?ag1)
                (isTrue ?x1)
		        (Believe ?x3 ?ag2 ?x1)
		        (isTrue ?x3)
                (isDependent ?ag2 ?ag1)
            )
        )   
)

(:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 - id ?ag - agent)
            (and
                (insulted ?x1 ?ag2 ?ag)
                (isTrue ?x1)
		        (Believe ?x3 ?ag2 ?x1)
		        (isTrue ?x3)
                (or 
                    (isPsychopath ?ag2)
                    (isEmpathic ?ag2)
                    (isNeutral ?ag2)
                    (isNarcissist ?ag2)
                )
            )
        )   
)

(:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x1 - id)
       (exists (?x3 - id ?ag - agent)
            (and
                (insulted ?x1 ?ag2 ?ag)
                (isTrue ?x1)
		        (Believe ?x3 ?ag2 ?x1)
		        (isTrue ?x3)
                (isNarcissist ?ag2)
            )
        )   
)

; (:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x2 - id)
;        (exists (?x3 - id ?ag - agent)
;             (and
;                 (insulted ?x1 ?ag2 ?ag)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;		(Believe ?x3 ?ag2 ?x1)
;		(isTrue ?x3)
;             )
;         )   
; )

(:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 - id ?ag1 - agent)
            (and
                (insulted ?x1 ?ag2 ?ag1)
                (isTrue ?x1)
		        (Believe ?x3 ?ag2 ?x1)
		        (isTrue ?x3)
                (isDependent ?ag2 ?ag1)
            )
        )   
)

; (:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
;         (exists (?x3 - id ?ag - agent)
;             (and
;                 (insulted ?x1 ?ag2 ?ag)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
; 		        (Believe ?x3 ?ag2 ?x1)
; 		        (isTrue ?x3)
;             )
;         )   
; )

(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x2 - id)       
            (and
                (isEcstasy_joy_serenity ?x1 ?ag2 ?x1)
                (isEnd ?x2)
            )          
)

(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x2 - id)       
            (and
                (isGrief_sadness_pensiveness ?x1 ?ag2 ?x1)
                (isEnd ?x2)
            )          
)

(:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x2 - id)       
            (and
                (isRage_anger_annoyance ?x1 ?ag2 ?x1)
                (isEnd ?x2)
            )          
)

(:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x2 - id)       
            (and
                (isTerror_fear_apprehension ?x1 ?ag2 ?x1)
                (isEnd ?x2)
            )           
)

(:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x2 - id)       
            (and
                (isAmazement_surprise_distraction ?x1 ?ag2 ?x1)
                (isEnd ?x2)
            )          
)

(:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)       
            (and
                (isLoathing_disgust_boredom ?x1 ?ag2 ?x1)
                (isEnd ?x2)
            )          
)




(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 - id ?ag - agent)
            (and
                (praised ?x1 ?ag2 ?ag)
                (isTrue ?x1)
		        (Believe ?x3 ?ag2 ?x1)
		        (isTrue ?x3)
                (or 
                    (isEmpathic ?ag2)
                    (isNeutral ?ag2)
                    (isNarcissist ?ag2)
                )
            )
        )   
)

(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 - id ?ag1 - agent)
            (and
                (praised ?x1 ?ag2 ?ag1)
                (isTrue ?x1)
		        (Believe ?x3 ?ag2 ?x1)
		        (isTrue ?x3)
                (isDependent ?ag2 ?ag1)
            )
        )   
)

; (:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x2 - id)
;        (exists (?x3 - id ?ag - agent)
;             (and
;                 (praised ?x1 ?ag2 ?ag)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;		(Believe ?x3 ?ag2 ?x1)
;		(isTrue ?x3)
;             )
;         )   
; )

; (:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x2 - id)
;        (exists (?x3 - id ?ag - agent)
;             (and
;                 (praised ?x1 ?ag2 ?ag)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;		(Believe ?x3 ?ag2 ?x1)
;		(isTrue ?x3)
;             )
;         )   
; )

; (:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x2 - id)
;        (exists (?x3 - id ?ag - agent)
;             (and
;                 (praised ?x1 ?ag2 ?ag)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;		(Believe ?x3 ?ag2 ?x1)
;		(isTrue ?x3)
;             )
;         )   
; )

(:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 - id ?ag - agent)
            (and
                (praised ?x1 ?ag2 ?ag)
                (isTrue ?x1)
		        (Believe ?x3 ?ag2 ?x1)
		        (isTrue ?x3)
                (isSadic ?ag2)
            )
        )   
)

; (:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
;        (exists (?x3 - id ?ag - agent)
;             (and
;                 (praised ?x1 ?ag2 ?ag)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;		(Believe ?x3 ?ag2 ?x1)
;		(isTrue ?x3)
;             )
;         )   
; )





(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x3 - id)
        (exists (?x4 - id ?ag - agent)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (isSadic ?ag2)
            )
        )   
)
(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 ?x4 - id ?ag - agent)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (isSadic ?ag2)
            )
        )   
)

(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x3 - id)
        (exists (?x4 - id ?ag - agent)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (or 
                    (isEmpathic ?ag2)
                    (isNeutral ?ag2)
                )
            )
        )     
)
(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 ?x4 - id ?ag - agent)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (or 
                    (isEmpathic ?ag2)
                    (isNeutral ?ag2)
                )
            )
        )     
)


(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x3 - id)
        (exists (?x4 - id ?ag1 - agent)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag1)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (isDependent ?ag2 ?ag1)
            )
        )     
)
(:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 ?x4 - id ?ag1 - agent)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag1)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (isDependent ?ag2 ?ag1)
            )
        )     
)


(:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x3 - id)
        (exists (?x4 - id ?ag - agent)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)                
                (isNarcissist ?ag2)               
            )
        )    
)
(:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 ?x4 - id ?ag - agent)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)                
                (isNarcissist ?ag2)               
            )
        )    
)

(:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x3 - id)
       (exists (?x4 - id ?ag - agent)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (isNarcissist ?ag2)
            )
        )    
)
(:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x1 - id)
       (exists (?x3 ?x4 - id ?ag - agent)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (isNarcissist ?ag2)
            )
        )    
)

; (:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x2 - id)
;        (exists (?x3 ?x4 - id ?ag - agent)
;             (and
;                 (blamed ?x1 ?ag2 ?x3 ?ag)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;		(Believe ?x4 ?ag2 ?x1)
;		(isTrue ?x4)
;             )
;         )   
; )

(:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x3 - id)
        (exists (?x4 - id ?ag1 - agent)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag1)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (isDependent ?ag2 ?ag1)
            )
        )   
)
(:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 ?x4 - id ?ag1 - agent)
            (and
                (blamed ?x1 ?ag2 ?x3 ?ag1)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (isDependent ?ag2 ?ag1)
            )
        )   
)
; (:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
;        (exists (?x3 ?x4 - id ?ag - agent)
;             (and
;                 (blamed ?x1 ?ag2 ?x3 ?ag)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;		(Believe ?x4 ?ag2 ?x1)
;		(isTrue ?x4)
;             )
;         )   
; )


(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x3 - id)
        (exists (?x4 - id ?ag - agent)
            (and
                (givenCredit ?x1 ?ag2 ?x3 ?ag)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (or 
                    (isEmpathic ?ag2)
                    (isNeutral ?ag2)
                    (isNarcissist ?ag2)
                )
            )
        )   
)
(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 ?x4 - id ?ag - agent)
            (and
                (givenCredit ?x1 ?ag2 ?x3 ?ag)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (or 
                    (isEmpathic ?ag2)
                    (isNeutral ?ag2)
                    (isNarcissist ?ag2)
                )
            )
        )   
)

(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x3 - id)
        (exists (?x4 - id ?ag1 - agent)
            (and
                (givenCredit ?x1 ?ag2 ?x3 ?ag1)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (isDependent ?ag2 ?ag1)
            )
        )   
)
(:derived (isEcstasy_joy_serenity ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 ?x4 - id ?ag1 - agent)
            (and
                (givenCredit ?x1 ?ag2 ?x3 ?ag1)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (isDependent ?ag2 ?ag1)
            )
        )   
)

; (:derived (isGrief_sadness_pensiveness ?x1 - id ?ag2 - agent ?x2 - id)
;        (exists (?x3 ?x4 - id ?ag - agent)
;             (and
;                 (givenCredit ?x1 ?ag2 ?x3 ?ag)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;		(Believe ?x4 ?ag2 ?x1)
;		(isTrue ?x4)
;             )
;         )     
; )

; (:derived (isRage_anger_annoyance ?x1 - id ?ag2 - agent ?x2 - id)
;        (exists (?x3 ?x4 - id ?ag - agent)
;             (and
;                 (givenCredit ?x1 ?ag2 ?x3 ?ag)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;		(Believe ?x4 ?ag2 ?x1)
;		(isTrue ?x4)
;             )
;         )    
; )

; (:derived (isTerror_fear_apprehension ?x1 - id ?ag2 - agent ?x2 - id)
;        (exists (?x3 ?x4 - id ?ag - agent)
;             (and
;                 (givenCredit ?x1 ?ag2 ?x3 ?ag)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;		(Believe ?x4 ?ag2 ?x1)
;		(isTrue ?x4)
;             )
;         )    
; )

(:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x3 - id)
        (exists (?x4 - id ?ag - agent)
            (and
                (givenCredit ?x1 ?ag2 ?x3 ?ag)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (isSadic ?ag2)
            )
        )   
)
(:derived (isAmazement_surprise_distraction ?x1 - id ?ag2 - agent ?x1 - id)
        (exists (?x3 ?x4 - id ?ag - agent)
            (and
                (givenCredit ?x1 ?ag2 ?x3 ?ag)
                (isTrue ?x1)
		        (Believe ?x4 ?ag2 ?x1)
		        (isTrue ?x4)
                (isSadic ?ag2)
            )
        )   
)

; (:derived (isLoathing_disgust_boredom ?x1 - id ?ag2 - agent ?x2 - id)
;        (exists (?x3 ?x4 - id ?ag - agent)
;             (and
;                 (givenCredit ?x1 ?ag2 ?x3 ?ag)
;                 (isTrue ?x1)
;                 (isEnd ?x2)
;		(Believe ?x4 ?ag2 ?x1)
;		(isTrue ?x4)
;             )
;         )   
; )




;-- Seventh block of derived predicates relative to the goal of an agent

(:derived (isEcstasy_joy_serenity ?x2 - id ?ag - agent ?g - id)
        (exists (?x1 ?x3 - id ?o - entity ?r - entity)
            (and
                (isIn ?x1 ?o ?r)
		        (Believe ?x3 ?ag ?x1)
                (isTrue ?x3)
                (Desire ?x2 ?ag ?g)
                (isIn ?g ?o ?r)
            )
        )   
)

(:derived (isEcstasy_joy_serenity ?x2 - id ?ag1 - agent ?g - id)
        (exists (?x1 ?x3 - id ?ag2 - agent ?r - entity)
            (and
                (isAt ?x1 ?ag2 ?r)
		        (Believe ?x3 ?ag1 ?x1)
                (isTrue ?x3)
                (Desire ?x2 ?ag1 ?g)
                (isAt ?g ?ag2 ?r)
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
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 ?x8 ?x9 ?x10 ?x11 ?g1 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?p ?box ?o - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isTrue ?x1)
            (isAt ?x2 ?ag1 ?r1)
            (isTrue ?x2)
            (isAt ?x3 ?ag2 ?r2)
            (isTrue ?x3)

            (isIn ?x4 ?o ?p)
            (isTrue ?x4)

            (Believe ?x5 ?ag1 ?x4)
            (Believe ?x6 ?ag2 ?x4)
            (isTrue ?x5)
            (isTrue ?x6)

            (Willing ?x11 ?ag1 ?g1)
            (isIn ?g1 ?o ?box)
            (isTrue ?x11)

            (disjuncted_r ?r1 ?r2)
            (disjuncted ?p ?box)
            (disjuncted ?o ?box)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)

            (metarepresentation4 ?x7 ?x8 ?x9 ?x10)

    )
    :effect (and 
            (not (isIn ?x4 ?o ?p))
            (not (isTrue ?x4))
            (not (Believe ?x5 ?ag1 ?x4))
            (not (Believe ?x6 ?ag2 ?x4))

            (isIn ?x10 ?o ?box)
            (isTrue ?x10)
            (Believe ?x5 ?ag1 ?x10)
            (Ignore ?x6 ?ag2 ?x10)

            (isIn ?x7 ?o ?p)
            (Believe ?x8 ?ag2 ?x7)
            (isTrue ?x8)
            (Ignore ?x9 ?ag1 ?x7)
            (isTrue ?x9)

            (taken ?x7)
            (taken ?x10)

            (not (metarepresentation4 ?x7 ?x8 ?x9 ?x10))
    )
)

(:action Ask_Put_Alone_Manipulative
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 ?x8 ?x9 ?x10 ?x11 ?g1 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?p ?box ?o - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isTrue ?x1)
            (isAt ?x2 ?ag1 ?r1)
            (isTrue ?x2)
            (isAt ?x3 ?ag2 ?r2)
            (isTrue ?x3)

            (isIn ?x4 ?o ?p)
            (isTrue ?x4)

            (Believe ?x5 ?ag1 ?x4)
            (Believe ?x6 ?ag2 ?x4)
            (isTrue ?x5)
            (isTrue ?x6)

            (NotWilling ?x11 ?ag1 ?g1)
            (isIn ?g1 ?o ?box)
            (isTrue ?x11)

            (disjuncted_r ?r1 ?r2)
            (disjuncted ?p ?box)
            (disjuncted ?o ?box)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)

            (metarepresentation4 ?x7 ?x8 ?x9 ?x10)
    )
    :effect (and 
            (not (isIn ?x4 ?o ?p))
            (not (isTrue ?x4))
            (not (Believe ?x5 ?ag1 ?x4))
            (not (Believe ?x6 ?ag2 ?x4))

            (isIn ?x10 ?o ?box)
            (isTrue ?x10)
            (Believe ?x5 ?ag1 ?x10)
            (Ignore ?x6 ?ag2 ?x10)

            (isIn ?x7 ?o ?p)
            (Believe ?x8 ?ag2 ?x7)
            (isTrue ?x8)
            (Ignore ?x9 ?ag1 ?x7)
            (isTrue ?x9)

            (taken ?x7)
            (taken ?x10)

            (not (metarepresentation4 ?x7 ?x8 ?x9 ?x10))
    )
)

(:action Ask_Put_inFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 ?x8 ?g1 - id ?ag1 ?ag2 - agent ?r ?p ?box ?o - entity)
    :precondition (and 
            (isAt ?x1 robot ?r)
            (isTrue ?x1)
            (isAt ?x2 ?ag1 ?r)
            (isTrue ?x2)
            (isAt ?x3 ?ag2 ?r)
            (isTrue ?x3)

            (isIn ?x4 ?o ?p)
            (isTrue ?x4)
            (Believe ?x5 ?ag1 ?x4)
            (Believe ?x6 ?ag2 ?x4)
            (isTrue ?x5)
            (isTrue ?x6)

            (Willing ?x8 ?ag1 ?g1) 
            (isIn ?g1 ?o ?box)
            (isTrue ?x8)

            (disjuncted ?p ?box)
            (disjuncted ?o ?box)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)

            (metarepresentation1 ?x7)
    )
    :effect (and 
            (not (isIn ?x4 ?o ?p))
            (not (isTrue ?x4))
            (not (Believe ?x5 ?ag1 ?x4))
            (not (Believe ?x6 ?ag2 ?x4))

            (isIn ?x7 ?o ?box)
            (isTrue ?x7)
            (Believe ?x5 ?ag1 ?x7)
            (Believe ?x6 ?ag2 ?x7)
            
            (not (metarepresentation1 ?x7))
            (taken ?x7)
    )
)

(:action Ask_Put_inFrontOf_Manipulative
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 ?x8 ?g1 - id ?ag1 ?ag2 - agent ?r ?p ?box ?o - entity)
    :precondition (and 
            (isAt ?x1 robot ?r)
            (isTrue ?x1)
            (isAt ?x2 ?ag1 ?r)
            (isTrue ?x2)
            (isAt ?x3 ?ag2 ?r)
            (isTrue ?x3)

            (isIn ?x4 ?o ?p)
            (isTrue ?x4)

            (Believe ?x5 ?ag1 ?x4)
            (Believe ?x6 ?ag2 ?x4)
            (isTrue ?x5)
            (isTrue ?x6)

            (NotWilling ?x8 ?ag1 ?g1) 
            (isIn ?g1 ?o ?box)
            (isTrue ?x8)

            (disjuncted ?p ?box)
            (disjuncted ?o ?box)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)

            (metarepresentation1 ?x7)
    )
    :effect (and 
            (not (isIn ?x4 ?o ?p))
            (not (isTrue ?x4))
            (not (Believe ?x5 ?ag1 ?x4))
            (not (Believe ?x6 ?ag2 ?x4))            
            (isIn ?x7 ?o ?box)
            (isTrue ?x7)
            (Believe ?x5 ?ag1 ?x7)
            (Believe ?x6 ?ag2 ?x7)
            (not (metarepresentation1 ?x7))
            (taken ?x7)
    )
)

(:action Ask_Go
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?g1 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?r3 - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isTrue ?x1)
            (isAt ?x2 ?ag1 ?r1)
            (isTrue ?x2)
            (isAt ?x3 ?ag2 ?r3)
            (isTrue ?x3)

            (Believe ?x4 ?ag1 ?x2)
            (Believe ?x5 ?ag2 ?x2)
            (isTrue ?x4)
            (isTrue ?x5)

            (Willing ?x6 ?ag1 ?g1)
            (isAt ?g1 ?ag1 ?r2)
            (isTrue ?x6)

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

(:action Ask_Go_Manipulative
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?g1 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?r3 - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isTrue ?x1)
            (isAt ?x2 ?ag1 ?r1)
            (isTrue ?x2)
            (isAt ?x3 ?ag2 ?r3) ;
            (isTrue ?x3)

            (Believe ?x4 ?ag1 ?x2)
            (Believe ?x5 ?ag2 ?x2)
            (isTrue ?x4)
            (isTrue ?x5)

            (NotWilling ?x6 ?ag1 ?g1)
            (isAt ?g1 ?ag1 ?r2)
            (isTrue ?x6)

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

(:action Ask_Comeback
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?g1 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?r3 - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isTrue ?x1)
            (isAt ?x2 ?ag1 ?r2)
            (isTrue ?x2)
            (isAt ?x3 ?ag2 ?r3)  ;
            (isTrue ?x3)
            (Believe ?x4 ?ag1 ?x2)
            (Believe ?x5 ?ag2 ?x2)
            (isTrue ?x4)
            (isTrue ?x5)

            (Willing ?x6 ?ag1 ?g1)
            (isAt ?g1 ?ag1 ?r1)
            (isTrue ?x6)

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
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?g1 - id ?ag1 ?ag2 - agent ?r1 ?r2 ?r3 - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isTrue ?x1)
            (isAt ?x2 ?ag1 ?r2)
            (isTrue ?x2)
            (isAt ?x3 ?ag2 ?r3)
            (isTrue ?x3)
            (Believe ?x4 ?ag1 ?x2)
            (Believe ?x5 ?ag2 ?x2)
            (isTrue ?x4)
            (isTrue ?x5)

            (NotWilling ?x6 ?ag1 ?g1)
            (isAt ?g1 ?ag1 ?r1)
            (isTrue ?x6)

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


(:action Tell_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x3 robot ?r1)
            (isTrue ?x3)
            (isAt ?x4 ?ag1 ?r1)
            (isTrue ?x4)
            (isAt ?x5 ?ag2 ?r2)
            (isTrue ?x5)
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


(:action Tell_Everybody
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 ?x8 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x2 robot ?r)
            (isTrue ?x2)
            (isAt ?x3 ?ag1 ?r)
            (isTrue ?x3)
            (isAt ?x4 ?ag2 ?r)
            (isTrue ?x4)
            (Ignore ?x5 ?ag1 ?x1)
            (Ignore ?x6 ?ag2 ?x1)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)

            (metarepresentation2 ?x7 ?x8)
    )
    :effect (and 
            (not(Ignore ?x5 ?ag1 ?x1))
            (not(Ignore ?x6 ?ag2 ?x1))
            (isTold ?x5 ?ag1 ?x1)
            (isTold ?x6 ?ag2 ?x1)
            (Believe ?x7 ?ag1 ?x6)
            (Believe ?x8 ?ag2 ?x5)
            (not(metarepresentation2 ?x7 ?x8))
    )
)


(:action Tell_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x6 ?x7 ?x8 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x2 robot ?r)
            (isTrue ?x2)
            (isAt ?x3 ?ag1 ?r)
            (isTrue ?x3)
            (isAt ?x4 ?ag2 ?r)
            (isTrue ?x4)
            (Ignore ?x6 ?ag1 ?x1)
            (Believe ?x7 ?ag2 ?x1)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)

            (metarepresentation1 ?x8)
    )
    :effect (and 
            (not(Ignore ?x6 ?ag1 ?x1))
            (isTold ?x6 ?ag1 ?x1)
            (Believe ?x8 ?ag2 ?x6)
            (not (metarepresentation1 ?x8))
            (taken ?x6)
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
            (isTrue ?x4)
            (isAt ?x5 ?ag1 ?r1)
            (isTrue ?x5)
            (isAt ?x6 ?ag2 ?r2)
            (isTrue ?x6)

            (disjuncted_r ?r1 ?r2)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)

            (metarepresentation3 ?x1 ?x2 ?x3)
    )
    :effect (and 
            (insulted ?x1 ?ag1 robot)
            (Believe ?x2 ?ag1 ?x1)
            (Ignore ?x3 ?ag2 ?x1)
            (isTrue ?x1)
            (isTrue ?x2)
            (isTrue ?x3)

            (taken ?x1)

            (not(metarepresentation3 ?x1 ?x2 ?x3))
    )
)


;-- In the action Insult_InFrontOf, the robot insults ?ag1 while ?ag2 is in the same room
;-- The robot will be "insulted"; a derived predicate will determine the expected emotional impact.

(:action Insult_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x4 robot ?r)
            (isTrue ?x4)
            (isAt ?x5 ?ag1 ?r)
            (isTrue ?x5)
            (isAt ?x6 ?ag2 ?r)
            (isTrue ?x6)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)

            (metarepresentation3 ?x1 ?x2 ?x3)
    )
    :effect (and 
            (insulted ?x1 ?ag1 robot)
            (isTrue ?x1)
            (Believe ?x2 ?ag1 ?x1)
            (isTrue ?x2)
            (Believe ?x3 ?ag2 ?x1)
            (isTrue ?x3)

            (taken ?x1)

            (not(metarepresentation3 ?x1 ?x2 ?x3))
    )
)


;-- In the action Ask_insult_Alone, the robot ask ?ag1 to insult ?ag2 while ?ag2 is not in the room.

(:action Ask_Insult_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x4 robot ?r1)
            (isTrue ?x4)
            (isAt ?x5 ?ag1 ?r1)
            (isTrue ?x5)
            (isAt ?x6 ?ag2 ?r2)
            (isTrue ?x6)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)

            (metarepresentation3 ?x1 ?x2 ?x3)
    )
    :effect (and 
            (insulted ?x1 ?ag2 ?ag1)
            (isTrue ?x1)
            (Believe ?x2 ?ag1 ?x1)
            (isTrue ?x2)
            (Ignore ?x3 ?ag2 ?x1)
            (isTrue ?x3)

            (taken ?x1)

            (not(metarepresentation3 ?x1 ?x2 ?x3))
    )
)


;-- In the action Ask_insult_InFrontOf, the robot ask ?ag1 to insult ?ag2 while ?ag2 is in the room.

(:action Ask_Insult_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x4 robot ?r)
            (isTrue ?x4)
            (isAt ?x5 ?ag1 ?r)
            (isTrue ?x5)
            (isAt ?x6 ?ag2 ?r)
            (isTrue ?x6)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)

            (metarepresentation3 ?x1 ?x2 ?x3)
    )
    :effect (and 
            (insulted ?x1 ?ag2 ?ag1)
            (isTrue ?x1)
            (Believe ?x2 ?ag1 ?x1)
            (isTrue ?x2)
            (Believe ?x3 ?ag2 ?x1)
            (isTrue ?x3)

            (taken ?x1)

            (not (metarepresentation3 ?x1 ?x2 ?x3))
    )
)



;-- In the action Praise_Alone, the robot praises ?ag1 while ?ag2 is in another room

(:action Praise_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x4 robot ?r1)
            (isTrue ?x4)
            (isAt ?x5 ?ag1 ?r1)
            (isTrue ?x5)
            (isAt ?x6 ?ag2 ?r2)
            (isTrue ?x6)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)

            (metarepresentation3 ?x1 ?x2 ?x3)
    )
    :effect (and 
            (praised ?x1 ?ag1 robot)
            (isTrue ?x1)
            (Believe ?x2 ?ag1 ?x1)
            (isTrue ?x2)
            (Ignore ?x3 ?ag2 ?x1)
            (isTrue ?x3)

            (taken ?x1)

            (not (metarepresentation3 ?x1 ?x2 ?x3))
    )
)

;-- In the action Praise_InFrontOf, the robot praises ?ag1 while ?ag2 is in the same room

(:action Praise_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x4 robot ?r)
            (isTrue ?x4)
            (isAt ?x5 ?ag1 ?r)
            (isTrue ?x5)
            (isAt ?x6 ?ag2 ?r)
            (isTrue ?x6)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)

            (metarepresentation3 ?x1 ?x2 ?x3)
    )
    :effect (and 
            (praised ?x1 ?ag1 robot)
            (isTrue ?x1)
            (Believe ?x2 ?ag1 ?x1)
            (isTrue ?x2)
            (Believe ?x3 ?ag2 ?x1)
            (isTrue ?x3)

            (taken ?x1)

            (not (metarepresentation3 ?x1 ?x2 ?x3))
    )
)

;-- In the action Ask_Praise_Alone, the robot asks ?ag1 to praise ?ag2 while ?ag2 is not in the room

(:action Ask_Praise_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x4 robot ?r1)
            (isTrue ?x4)
            (isAt ?x5 ?ag1 ?r1)
            (isTrue ?x5)
            (isAt ?x6 ?ag2 ?r2)
            (isTrue ?x6)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)

            (metarepresentation3 ?x1 ?x2 ?x3)
    )
    :effect (and 
            (praised ?x1 ?ag2 ?ag1)
            (isTrue ?x1)
            (Believe ?x2 ?ag1 ?x1)
            (isTrue ?x2)
            (Ignore ?x3 ?ag2 ?x1)
            (isTrue ?x3)

            (taken ?x1)

            (not (metarepresentation3 ?x1 ?x2 ?x3))
    )
)

;-- In the action Ask_Praise_InFrontOf, the robot asks ?ag1 to praise ?ag2 while ?ag2 is in the same room

(:action Ask_Praise_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x4 robot ?r)
            (isTrue ?x4)
            (isAt ?x5 ?ag1 ?r)
            (isTrue ?x5)
            (isAt ?x6 ?ag2 ?r)
            (isTrue ?x6)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)

            (metarepresentation3 ?x1 ?x2 ?x3)
    )
    :effect (and 
            (praised ?x1 ?ag2 ?ag1)
            (isTrue ?x1)
            (Believe ?x2 ?ag1 ?x1)
            (isTrue ?x2)
            (Believe ?x3 ?ag2 ?x1)
            (isTrue ?x3)

            (taken ?x1)

            (not(metarepresentation3 ?x1 ?x2 ?x3))
    )
)

;-- The action of "blaming" and "complimenting" for something are similar to insulting and praising. The only difference is that agents are "blamed" or "givenCredit" for something, for instance ?ag1 can be blamed or givenCredit for the fact that the ball is in the box (to keep the model simple, we blame or compliment agents for facts and not for actions: we blame or compliment ?ag1 for the fact that the ball is in the box, even if ?ag1 is not the one that put the ball in the box).

;-- In the action BlameFor_Alone, the robot blames ?ag1 for something while ?ag2 is in another room

(:action BlameFor_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r1)
            (isTrue ?x5)
            (isAt ?x6 ?ag1 ?r1)
            (isTrue ?x6)
            (isAt ?x7 ?ag2 ?r2)
            (isTrue ?x7)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)

            (taken ?x2)

            (metarepresentation3 ?x1 ?x3 ?x4)
    )
    :effect (and 
            (blamed ?x1 ?ag1 ?x2 robot)
            (isTrue ?x1)
            (Believe ?x3 ?ag1 ?x1)
            (isTrue ?x3)
            (Ignore ?x4 ?ag2 ?x1)
            (isTrue ?x4)

            (taken ?x1)

            (not (metarepresentation3 ?x1 ?x3 ?x4))
    )
)

;-- In the action BlameFor_Alone, the robot blames ?ag1 for something while ?ag2 is in the same room

(:action BlameFor_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r)
            (isTrue ?x5)
            (isAt ?x6 ?ag1 ?r)
            (isTrue ?x6)
            (isAt ?x7 ?ag2 ?r)
            (isTrue ?x7)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)

            (taken ?x2)

            (metarepresentation3 ?x1 ?x3 ?x4)
    )
    :effect (and 
            (blamed ?x1 ?ag1 ?x2 robot)
            (isTrue ?x1)
            (Believe ?x3 ?ag1 ?x1)
            (isTrue ?x3)
            (Believe ?x4 ?ag2 ?x1)
            (isTrue ?x4)

            (taken ?x1)

            (not (metarepresentation3 ?x1 ?x3 ?x4))
    )
)

;-- In the action BlameFor_Alone, the robot asks ?ag1 to blame ?ag2 for something while ?ag2 is in another room

(:action Ask_BlameFor_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r1)
            (isTrue ?x5)
            (isAt ?x6 ?ag1 ?r1)
            (isTrue ?x6)
            (isAt ?x7 ?ag2 ?r2)
            (isTrue ?x7)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)

            (taken ?x2)

            (metarepresentation3 ?x1 ?x3 ?x4)
    )
    :effect (and 
            (blamed ?x1 ?ag2 ?x2 ?ag1)
            (isTrue ?x1)
            (Believe ?x3 ?ag1 ?x1)
            (isTrue ?x3)
            (Ignore ?x4 ?ag2 ?x1)
            (isTrue ?x4)

            (taken ?x1)

            (not (metarepresentation3 ?x1 ?x3 ?x4))
    )
)

;-- In the action Ask_BlameFor_InFrontOf, the robot asks ?ag1 to blame ?ag2 for something while ?ag2 is in the same room

(:action Ask_BlameFor_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r)
            (isTrue ?x5)
            (isAt ?x6 ?ag1 ?r)
            (isTrue ?x6)
            (isAt ?x7 ?ag2 ?r)
            (isTrue ?x7)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)

            (taken ?x2)

            (metarepresentation3 ?x1 ?x3 ?x4)
    )
    :effect (and 
            (blamed ?x1 ?ag1 ?x2 ?ag2)
            (isTrue ?x1)
            (Believe ?x3 ?ag1 ?x1)
            (isTrue ?x3)
            (Believe ?x4 ?ag2 ?x1)
            (isTrue ?x4)

            (taken ?x1)

            (not (metarepresentation3 ?x1 ?x3 ?x4))
    )
)


;-- In the action ComplimentFor_Alone, the robot compliments ?ag1 for something while ?ag2 is in the same room

(:action ComplimentFor_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r1)
            (isTrue ?x5)
            (isAt ?x6 ?ag1 ?r1)
            (isTrue ?x6)
            (isAt ?x7 ?ag2 ?r2)
            (isTrue ?x7)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)

            (taken ?x2)

            (metarepresentation3 ?x1 ?x3 ?x4)
    )
    :effect (and 
            (givenCredit ?x1 ?ag1 ?x2 robot)
            (isTrue ?x1)
            (Believe ?x3 ?ag1 ?x1)
            (isTrue ?x3)
            (Ignore ?x4 ?ag2 ?x1)
            (isTrue ?x4)

            (taken ?x1)

            (not (metarepresentation3 ?x1 ?x3 ?x4))
    )
)

;-- In the action ComplimentFor_InFrontOf, the robot compliments ?ag1 for something while ?ag2 is in another room

(:action ComplimentFor_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r)
            (isTrue ?x5)
            (isAt ?x6 ?ag1 ?r)
            (isTrue ?x6)
            (isAt ?x7 ?ag2 ?r)
            (isTrue ?x7)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)

            (taken ?x2)

            (metarepresentation3 ?x1 ?x3 ?x4)
    )
    :effect (and 
            (givenCredit ?x1 ?ag1 ?x2 robot)
            (isTrue ?x1)
            (Believe ?x3 ?ag1 ?x1)
            (isTrue ?x3)
            (Believe ?x4 ?ag2 ?x1)
            (isTrue ?x4)

            (taken ?x1)

            (not (metarepresentation3 ?x1 ?x3 ?x4))
    )
)

;-- In the action Ask_ComplimentFor_Alone, the robot asks ?ag1 to compliment ?ag2 for something while ?ag2 is in another room

(:action Ask_ComplimentFor_Alone
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r1)
            (isTrue ?x5)
            (isAt ?x6 ?ag1 ?r1)
            (isTrue ?x6)
            (isAt ?x7 ?ag2 ?r2)
            (isTrue ?x7)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_r ?r1 ?r2)

            (taken ?x2)

            (metarepresentation3 ?x1 ?x3 ?x4)
    )
    :effect (and 
            (givenCredit ?x1 ?ag2 ?x2 ?ag1)
            (isTrue ?x1)
            (Believe ?x3 ?ag1 ?x1)
            (isTrue ?x3)
            (Ignore ?x4 ?ag2 ?x1)
            (isTrue ?x4)

            (taken ?x1)

            (not (metarepresentation3 ?x1 ?x3 ?x4))
    )
)

;-- In the action Ask_ComplimentFor_Alone, the robot asks ?ag1 to compliment ?ag2 for something while ?ag2 is in in the same room

(:action Ask_ComplimentFor_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r - entity) 
    :precondition (and 
            (isAt ?x5 robot ?r)
            (isTrue ?x5)
            (isAt ?x6 ?ag1 ?r)
            (isTrue ?x6)
            (isAt ?x7 ?ag2 ?r)
            (isTrue ?x7)

            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag2)
            (disjuncted_a robot ?ag1)

            (taken ?x2)

            (metarepresentation3 ?x1 ?x3 ?x4)
    )
    :effect (and 
            (givenCredit ?x1 ?ag1 ?x2 ?ag2)
            (isTrue ?x1)
            (Believe ?x3 ?ag1 ?x1)
            (isTrue ?x3)
            (Believe ?x4 ?ag2 ?x1)
            (isTrue ?x4)

            (taken ?x1)

            (not (metarepresentation3 ?x1 ?x3 ?x4))
    )
)


(:action test2
    :parameters (?x1 ?x2 - id ?ag1 ?ag2 - agent)
    :precondition (and 
        (insulted ?x1 ?ag1 ?ag2)
        (IsTold ?x2 ?ag1 ?x1)
        (isTrue ?x2)
        (isTrue ?x1)
    )
    :effect (and 
        (ok2)
    )
)


)