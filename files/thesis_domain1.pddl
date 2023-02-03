(define (domain thesis_domain1)

(:requirements :adl :derived-predicates :strips :typing :conditional-effects :negative-preconditions :equality)

(:types
    entity
    place - entity
    thing - entity 
    agent 
    id
)


(:predicates 
        (hasStartAgent ?ag - agent)
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
        (complimented ?x1 - id ?ag1 - agent ?x2 - id ?ag2 - agent)
        (Willing ?x1 - id ?ag1 - agent ?x2 - id)
        (NotSureIfWilling ?x1 - id ?ag1 - agent ?x2 - id)
        (NotWilling ?x1 - id ?ag1 - agent ?x2 - id)
        (happy ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        (sad ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        (angry ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        (ashamed ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        (proud ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        (ok1)
        (ok2)
        (ok3)
        (ok4)
        (ok5)
        (ok6)
)


;-- First block of derived emotions.
;-- The agent 2 is {emotion} if something is told to agent 1.

(:derived (happy ?x1 - id ?ag1 ?ag3 - agent ?x2 - id)
        (exists(?x3 - id ?ag2 - agent)
            (and
                (hasStartAgent ?ag3)
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (isStart ?x3)
            )
        )
)

(:derived (sad ?x1 - id ?ag1 ?ag3 - agent ?x2 - id)
        (exists(?x3 - id ?ag2 - agent)
            (and
                (hasStartAgent ?ag3)
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (isStart ?x3)
            )
        )
)

(:derived (angry ?x1 - id ?ag1 ?ag3 - agent ?x2 - id)
        (exists(?x3 - id ?ag2 - agent)
            (and
                (hasStartAgent ?ag3)
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (isStart ?x3)
            )
        )
)

(:derived (ashamed ?x1 - id ?ag1 ?ag3 - agent ?x2 - id)
        (exists(?x3 - id ?ag2 - agent)
            (and
                (hasStartAgent ?ag3)
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (isStart ?x3)
            )
        )
)

(:derived (proud ?x1 - id ?ag1 ?ag3 - agent ?x2 - id)
        (exists(?x3 - id ?ag2 - agent)
            (and
                (hasStartAgent ?ag3)
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (isStart ?x3)
            )
        )
)


(:derived (happy ?x1 - id ?ag2 ?ag3 - agent ?x2 - id)
        (exists(?x3 - id ?ag1 - agent)
            (and
                (hasStartAgent ?ag3)
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (isStart ?x3)
            )
        )
)

(:derived (sad ?x1 - id ?ag2 ?ag3 - agent ?x2 - id)
        (exists(?x3 - id ?ag1 - agent)
            (and
                (hasStartAgent ?ag3)
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (isStart ?x3)
            )
        )
)

(:derived (angry ?x1 - id ?ag2 ?ag3 - agent ?x2 - id)
        (exists(?x3 - id ?ag1 - agent)
            (and
                (hasStartAgent ?ag3)
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (isStart ?x3)
            )
        )
)

(:derived (ashamed ?x1 - id ?ag2 ?ag3 - agent ?x2 - id)
        (exists(?x3 - id ?ag1 - agent)
            (and
                (hasStartAgent ?ag3)
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (isStart ?x3)
            )
        )
)

(:derived (proud ?x1 - id ?ag2 ?ag3 - agent ?x2 - id)
        (exists(?x3 - id ?ag1 - agent)
            (and
                (hasStartAgent ?ag3)
                (isTold ?x2 ?ag1 ?x1)
                (Know ?x3 ?ag2 ?x1)
                (isStart ?x3)
            )
        )
)


;-- Second block of derived emotions.
;-- The agent 1 is {emotion} if agent 2 insults/praises/blames/compliments him. 

(:derived (happy ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isEnd ?x2)
            )
          
)

(:derived (sad ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isEnd ?x2)
            )
            
)

(:derived (angry ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isEnd ?x2)
            )
            
)

(:derived (ashamed ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isEnd ?x2)
            )
            
)

(:derived (proud ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (isEnd ?x2)
            )
            
)

(:derived (happy ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (praised ?x1 ?ag1 ?ag2)
                (isEnd ?x2)
            )
            
)

(:derived (sad ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (praised ?x1 ?ag1 ?ag2)
                (isEnd ?x2)
            )
           
)

(:derived (angry ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (praised ?x1 ?ag1 ?ag2)
                (isEnd ?x2)
            )
            
)

(:derived (ashamed ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (praised ?x1 ?ag1 ?ag2)
                (isEnd ?x2)
            )
            
)

(:derived (proud ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (praised ?x1 ?ag1 ?ag2)
                (isEnd ?x2)
            )
            
)

(:derived (happy ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
            )
            
)

(:derived (sad ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
            )
            
)

(:derived (angry ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
            )
           
)

(:derived (ashamed ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
            )
            
)

(:derived (proud ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (blamed ?x1 ?ag1 ?x2 ?ag2)
            )
            
)

(:derived (happy ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (complimented ?x1 ?ag1 ?x2 ?ag2)
            )
            
)

(:derived (sad ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (complimented ?x1 ?ag1 ?x2 ?ag2)
            )
            
)

(:derived (angry ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (complimented ?x1 ?ag1 ?x2 ?ag2)
            )
            
)

(:derived (ashamed ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (complimented ?x1 ?ag1 ?x2 ?ag2)
            )
            
)

(:derived (proud ?x1 - id ?ag1 ?ag2 - agent ?x2 - id)
        
            (and
                (complimented ?x1 ?ag1 ?x2 ?ag2)
            )
            
)


;-- Third block of derived emotions.
;-- The agent 2 is {emotion} if agent 1 insults/praises/blames/compliments him. 

(:derived (happy ?x2 - id ?ag2 ?ag1 - agent ?x1 - id)
        
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (Know ?x2 ?ag2 ?x1)
            )
            
)

(:derived (sad ?x2 - id ?ag2 ?ag1 - agent ?x1 - id)
        
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (Know ?x2 ?ag2 ?x1)
            )
           
)

(:derived (angry ?x2 - id ?ag2 ?ag1 - agent ?x1 - id)
        
            (and
                (insulted ?x1 ?ag1 ?ag2)
                (Know ?x2 ?ag2 ?x1)
            )
            
)

(:derived (happy ?x2 - id ?ag2 ?ag1 - agent ?x1 - id)
        
            (and
                (praised ?x1 ?ag1 ?ag2)
                (Know ?x2 ?ag2 ?x1)
            )
            
)

(:derived (sad ?x2 - id ?ag2 ?ag1 - agent ?x1 - id)
        
            (and
                (praised ?x1 ?ag1 ?ag2)
                (Know ?x2 ?ag2 ?x1)
            )
            
)

(:derived (angry ?x2 - id ?ag2 ?ag1 - agent ?x1 - id)
        
            (and
                (praised ?x1 ?ag1 ?ag2)
                (Know ?x2 ?ag2 ?x1)
            )
            
)

(:derived (happy ?x2 - id ?ag2 ?ag1 - agent ?x4 - id)
        (exists(?x1 ?x3 - id)
            (and
                (blamed ?x1 ?ag1 ?x3 ?ag2)
                (Know ?x2 ?ag2 ?x1)
                (isEnd ?x4)
            )
        )    
)

(:derived (sad ?x2 - id ?ag2 ?ag1 - agent ?x4 - id)
        (exists(?x1 ?x3 - id)
            (and
                (blamed ?x1 ?ag1 ?x3 ?ag2)
                (Know ?x2 ?ag2 ?x1)
                (isEnd ?x4)
            )
        )    
)

(:derived (angry ?x2 - id ?ag2 ?ag1 - agent ?x4 - id)
        (exists(?x1 ?x3 - id)
            (and
                (blamed ?x1 ?ag1 ?x3 ?ag2)
                (Know ?x2 ?ag2 ?x1)
                (isEnd ?x4)
            )
        )    
)

(:derived (happy ?x2 - id ?ag2 ?ag1 - agent ?x4 - id)
        (exists(?x1 ?x3 - id)
            (and
                (complimented ?x1 ?ag1 ?x3 ?ag2)
                (Know ?x2 ?ag2 ?x1)
                (isEnd ?x4)
            )
        )    
)

(:derived (sad ?x2 - id ?ag2 ?ag1 - agent ?x4 - id)
        (exists(?x1 ?x3 - id)
            (and
                (complimented ?x1 ?ag1 ?x3 ?ag2)
                (Know ?x2 ?ag2 ?x1)
                (isEnd ?x4)
            )
        )    
)

(:derived (angry ?x2 - id ?ag2 ?ag1 - agent ?x4 - id)
        (exists(?x1 ?x3 - id)
            (and
                (complimented ?x1 ?ag1 ?x3 ?ag2)
                (Know ?x2 ?ag2 ?x1)
                (isEnd ?x4)
            )
        )    
)


;-- Fourth block of derived emotions.
;-- The agent 2 is {emotion} if agent 1 is {emotion}. 

;empathic
(:derived (happy ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (happy ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

;sadic
(:derived (happy ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (sad ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

;provocator
(:derived (happy ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (angry ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

;mean
(:derived (happy ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (ashamed ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

;paternalistic
(:derived (happy ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (proud ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

;envious
(:derived (sad ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (happy ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

;empathic
(:derived (sad ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (sad ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

;avoid conflicts
(:derived (sad ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (angry ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

;empathic
(:derived (sad ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (ashamed ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

;envious
(:derived (sad ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (proud ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

;isteric-envious
(:derived (angry ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (happy ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

;empathic
(:derived (angry ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (sad ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

;search for conflicts
(:derived (angry ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (angry ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

;empathic
(:derived (angry ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (ashamed ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

;
(:derived (angry ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (proud ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

;
(:derived (ashamed ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (happy ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

(:derived (ashamed ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (sad ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

(:derived (ashamed ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (angry ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

(:derived (ashamed ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (ashamed ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

(:derived (ashamed ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (proud ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

(:derived (proud ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (happy ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

(:derived (proud ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (sad ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

(:derived (proud ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (angry ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

(:derived (proud ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (ashamed ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)

(:derived (proud ?x2 - id ?ag2 ?ag3 - agent ?x3 - id)
        (exists(?x1 - id ?ag1 - agent) 
            (and
                (proud ?x1 ?ag1 ?ag3 ?x3)
                (Know ?x2 ?ag2 ?x1)
                (isStart ?x2)
            )
        )    
)



;-- In the following actions, we assume that the robot can ask to do something
;-- to an agent in the room or out of the room.


; Per quanto riguarda lo spostamento degli oggetti, nel caso in cui ci siano tre agenti, abbiamo due situazioni: 

; Il robot lo dice ad ag1 che è nella stanza mentre ag2 è fuori dalla stanza.
; In base al fatto che ag1 mostri la volontà o meno (Willing o NotSureIfWilling) di spostare l'oggetto, abbiamo 2 azioni diverse:
; Ask_Put_Alone (alone poichè ag2 non è presente) e Ask_Put_Alone_Manipulative. 
; Nel primo caso, il robot chiederà gentilmente all'agente di spostare l'oggetto;
; Nel secondo caso, il robot sarà più insistente e potrà usare mezzi anche poco etici per ottenere il risultato 
; (ad esempio potrebbe inventare una scusa per forzare ag1 a spostare l'oggetto dicendo "se sposti la palla, ti darò 5$").
; Alla fine solo il robot e ag1 sapranno del spostamento dell'oggetto.

;x1,2,3,4,.. sono i vari ID; ag1,2 sono gli agenti; r1,2 p box o sono i vari oggetti
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

            ;Dico che i vari agenti, luoghi e "contenitori" sono oggetti separati
            (disjuncted_r ?r1 ?r2)
            (disjuncted ?p ?box)
            (disjuncted_a ?ag1 ?ag2)
            (disjuncted_a robot ?ag1)
            (disjuncted_a robot ?ag2)

            ;Controllo che gli id siano libero per aggiungere informazioni al mio stato iniziale
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
            (not (free ?x7))
            (not (free ?x8))
            (not (free ?x9))
    )
)

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
            (not (free ?x7))
            (not (free ?x8))
            (not (free ?x9))
    )
)


; Il robot lo dice ad ag1 nella stanza e anche ag2 è presente nella stanza.
; Le considerazioni sulla volontà di ag1 di spostare l'oggetto sono le stesse del caso precedente.
; La differenza sta nel fatto che in questo caso tutti gli agenti sanno dove si trova l'oggetto dopo che è stato spostato 
; (nel caso precedente lo sapevano solo ag1 e il robot). 

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



; Il robot chiede a qualcuno di cambiare stanza, assumendo di avere solo due stanze (di conseguenza, tutti sanno dove sono gli altri).
; Anche in questo caso studiamo la volontà o meno di ag1 a cambiare la stanza, che darà origine a 2 differenti azioni: 
; Ask_Go e Ask_Go_Manipulative (valgono le stesse considerazioni del caso precedente).

(:action Ask_Go
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isStart ?x1)
            (isAt ?x2 ?ag1 ?r1)
            (isStart ?x2)
            (isAt ?x3 ?ag2 ?r1)
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

(:action Ask_Go_Manipulative
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isStart ?x1)
            (isAt ?x2 ?ag1 ?r1)
            (isStart ?x2)
            (isAt ?x3 ?ag2 ?r1)
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


; Queste azioni sono simili all'Ask_Go ma vengono utilizzate per far tornare un agente all'interno della stanza in cui si trova il robot.

(:action Ask_Comeback_Manipulative
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isStart ?x1)
            (isAt ?x2 ?ag1 ?r2)
            (isStart ?x2)
            (isAt ?x3 ?ag2 ?r1)
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

(:action Ask_Comeback
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 - id ?ag1 ?ag2 - agent ?r1 ?r2 - entity)
    :precondition (and 
            (isAt ?x1 robot ?r1)
            (isStart ?x1)
            (isAt ?x2 ?ag1 ?r2)
            (isStart ?x2)
            (isAt ?x3 ?ag2 ?r1)
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

; Sono presenti 3 diverse casistiche:
; La prima riguarda il dire qualcosa ad ag1 (unico agente presente nella stanza), che ignorava.

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


; La seconda riguarda il dire qualcosa a tutti gli agenti presenti, che ignoravano.

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


; La terza riguarda il dire qualcosa che ag1 sa, ad ag2, sapendo che questi la ignorava (entrambi gli agenti sono presenti nella stanza). 

(:action Tell_InFrontOf
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 ?x6 ?x7 - id ?ag1 ?ag2 - agent ?r - entity) 
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


; Per le seguenti azioni, varranno le stesse considerioni fatte per Tell_Alone e Tell_InFrontOf.

; In Insukt_Alone, il robot parla male di ag1, che è l'unico agente presente nella stanza 
; (per questo motivo solo lui e il robot sapranno che ag1 è stato insultato).

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


; In questa azione il robot parla male di un agente mentre sono tutti presenti nella stanza,
; quindi tutti sapranno che è avvenuto ciò.

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


; In Ask_Insult_Alone, il robot chiede ad ag1 di parlare male di ag2 (solo il robot e ag1 sapranno questa cosa) 
; ed il primo caso in cui 2 agenti avranno un'interazione.

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


; Stesso discorso di Insult_InFrontOf, tutti gli agenti sanno che ag1 ha parlato male di ag2.

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



; Per le azioni di Praise, facciamo le stesse identiche considerazioni del caso "Insult".

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


; Le azioni di Blaming sono simili a quelle di Insulting e Praising. L'unica differenza è che, 
; per Insult e Praise creiamo dei predicati a sè stanti ( Insult(ag1, ag2). Praise(ag1, robot) ecc ecc..), 
; per Blame il predicato sarà qualcosa del tipo Blame(ag1, ?x, robot), ovvero incolpiamo l'ag1 di aver fatto/detto qualcosa x.
; Per il resto, le considerazioni fatte precedentemente rimangono valide.

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


; Stesse considerazioni fatte per le azioni di Blaming.

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
            (complimented ?x1 ?ag1 ?x2 robot)
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
            (complimented ?x1 ?ag1 ?x2 robot)
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
            (complimented ?x1 ?ag1 ?x2 ?ag2)
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
            (complimented ?x1 ?ag1 ?x2 ?ag2)
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



; First test: Teel something to Sally, that Anne ignores

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


; Second test: The robot blames Sally that the ball is in box1 (meaning that 
; it has been moved) and Anne ignores this fact

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


; Third test: Agent 2 insults agent 1 and the robot tells agent 1 about this
; (this implies that agent 1 is not in the room while he is being insulted)

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


; Fourth test: Sally is sad but ignores that she has been insulted.

(:action test4
    :parameters (?x1 ?x2 ?x3 ?x4 - id ?ag2 - agent)
    :precondition (and 
        (sad ?x3 sally robot ?x4)
        (insulted ?x1 sally ?ag2)
        (Ignore ?x2 sally ?x1)
    )
    :effect (and 
        (ok4)
    )
)


; Fifth test: Both Anne and Sally are happy but 
; ignores that the other one is feeling the same

(:action test5
    :parameters (?x1 ?x2 ?x3 ?x4 ?x5 - id)
    :precondition (and 
        (happy ?x1 sally robot ?x2)
        (happy ?x3 anne robot ?x4)
        (Ignore ?x4 sally ?x3)
        (Ignore ?x5 anne ?x1)
    )
    :effect (and 
        (ok5)
    )
)


; Sixth test: Sally is feeling both happy about something and
; angry because Anne has been insulted, while Anne is sad about something

(:action test6
    :parameters (?x1 ?x2 ?x3 ?x5 - id ?ag1 - agent)
    :precondition (and 
        (sad ?x1 anne robot ?x2)
        (happy ?x3 sally robot ?x1)
        (insulted ?x4 anne ?ag1)
        (angry ?x5 sally robot ?x4)
    )
    :effect (and 
        (ok6)
    )
)

)
