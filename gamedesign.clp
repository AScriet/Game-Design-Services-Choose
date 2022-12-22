;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-money ""

   (logical (start))

   =>

   (assert (UI-state (display MoneyQuestion)
                     (relation-asserted money)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-TalentQuestion ""

   (logical (money No))

   =>

   (assert (UI-state (display TalentQuestion)
                     (relation-asserted talent)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-ExcitedQuestion ""

   (logical (talent Yes))

   =>

   (assert (UI-state (display ExcitedQuestion)
                     (relation-asserted excited)
                     (response No)
                     (valid-answers No Fake Yes))))

(defrule determine-ReallyQuestion-state ""

   (logical (excited Yes))

   =>

   (assert (UI-state (display ReallyQuestion)
                     (relation-asserted really)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-UnderappereciatedQuestion ""

   (logical (really Yes))

   =>

   (assert (UI-state (display UnderappereciatedQuestion)
                     (relation-asserted underappereciated)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-VisuallyorientedQuestion ""

   (logical (underappereciated Yes))

   =>

   (assert (UI-state (display VisuallyorientedQuestion)
                     (relation-asserted visuallyoriented)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-WorkingOverTalkingQuestion ""

   (logical (visuallyoriented Yes))

   =>

   (assert (UI-state (display WorkingOverTalkingQuestion)
                     (relation-asserted workingovertalking)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-ProperArtistQuestion ""

   (logical (workingovertalking Yes))

   =>

   (assert (UI-state (display ProperArtistQuestion)
                     (relation-asserted properartist)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-FrenchQuestion ""

   (logical (properartist Yes))

   =>

   (assert (UI-state (display FrenchQuestion)
                     (relation-asserted french)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-FrenchQuestion ""

   (logical (properartist Yes))

   =>

   (assert (UI-state (display FrenchQuestion)
                     (relation-asserted french)
                     (response No)
                     (valid-answers No Yes))))
                     
                     
(defrule determine-BitterQuestion ""

   (logical (talent No))

   =>

   (assert (UI-state (display BitterQuestion)
                     (relation-asserted bitter)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-ProductiveWorkQuestion ""

   (logical (money Yes))

   =>

   (assert (UI-state (display ProductiveWorkQuestion)
                     (relation-asserted productivework)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-AfraidQuestion ""

   (logical (productivework No))

   =>

   (assert (UI-state (display AfraidQuestion)
                     (relation-asserted afraid)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-GrandVisionQuestion ""

   (logical (afraid No))

   =>

   (assert (UI-state (display GrandVisionQuestion)
                     (relation-asserted grandvision)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-ImportantQuestion ""

   (or (logical (really No))
	    (logical (excited No)))
   =>

   (assert (UI-state (display ImportantQuestion)
                     (relation-asserted important)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-MakeGameQuestion ""

   (logical (important Yes))
   =>

   (assert (UI-state (display MakeGameQuestion)
                     (relation-asserted makegame)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule determine-GrammarQuestion ""

   (logical (makegame No))
   =>

   (assert (UI-state (display GrammarQuestion)
                     (relation-asserted grammar)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule determine-GoodPlayingQuestion ""

   (logical (grammar No))
   =>

   (assert (UI-state (display GoodPlayingQuestion)
                     (relation-asserted goodplaying)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule determine-AreYouAsiaQuestion ""

   (logical (goodplaying Yes))
   =>

   (assert (UI-state (display AreYouAsiaQuestion)
                     (relation-asserted areyouasia)
                     (response No)
                     (valid-answers Korea China))))                     
                                          
(defrule determine-AnyMoneyQuestion ""

   (logical (grandvision No))
   =>

   (assert (UI-state (display AnyMoneyQuestion)
                     (relation-asserted anymoney)
                     (response No)
                     (valid-answers No Yes))))                      
          
(defrule determine-ConsciencesQuestion ""

   (logical (anymoney Yes))
   =>

   (assert (UI-state (display ConsciencesQuestion)
                     (relation-asserted consciences)
                     (response No)
                     (valid-answers No Yes)))) 

(defrule determine-CodeQuestion ""

   (logical (productivework Yes))
   =>

   (assert (UI-state (display CodeQuestion)
                     (relation-asserted code)
                     (response No)
                     (valid-answers No Well Yes))))                     

(defrule determine-AsianQuestion ""

   (logical (french No))
   =>

   (assert (UI-state (display AsianQuestion)
                     (relation-asserted asian)
                     (response No)
                     (valid-answers No Yes)))) 

(defrule determine-CraftingQuestion ""

   (logical (asian No))
   =>

   (assert (UI-state (display CraftingQuestion)
                     (relation-asserted crafting)
                     (response No)
                     (valid-answers No Yes))))                      
                    
(defrule determine-AloneQuestion ""

   (logical (underappereciated No))
   =>

   (assert (UI-state (display AloneQuestion)
                     (relation-asserted alone)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule determine-MoviesQuestion ""

   (logical (alone No))
   =>

   (assert (UI-state (display MoviesQuestion)
                     (relation-asserted movies)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-ErrorInGraph ""

   (logical (movies No))
   =>

   (assert (UI-state (display ErrorInGraph)
                     (relation-asserted error)
                     (response No)
                     (valid-answers No Yes))))                    
 
(defrule determine-HangOutQuestion ""

   (logical (error No))
   =>

   (assert (UI-state (display HangOutQuestion)
                     (relation-asserted hangout)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-MusicalQuestion ""

   (logical (alone Yes))
   =>

   (assert (UI-state (display MusicalQuestion)
                     (relation-asserted musical)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule determine-ShootQuestion ""

   (logical (musical Yes))
   =>

   (assert (UI-state (display ShootQuestion)
                     (relation-asserted shoot)
                     (response No)
                     (valid-answers No Yes))))                        

(defrule determine-UnfinishedToolsQuestion ""

   (logical (visuallyoriented No))
   =>

   (assert (UI-state (display UnfinishedToolsQuestion)
                     (relation-asserted unfinished)
                     (response No)
                     (valid-answers No Yes))))                      
                     
(defrule determine-Spreadsheet ""

   (logical (unfinished No))
   =>

   (assert (UI-state (display Spreadsheet)
                     (relation-asserted spreadsheet)
                     (response No)
                     (valid-answers No Yes))))                      
                                          
(defrule determine-WhatToDoQuestion ""

   (logical (spreadsheet Yes))
   =>

   (assert (UI-state (display WhatToDoQuestion)
                     (relation-asserted told)
                     (response No)
                     (valid-answers No Yes))))                       
                     
(defrule determine-ObsessexcessiveliQuestion ""

   (logical (told Yes))
   =>

   (assert (UI-state (display ObsessexcessiveliQuestion)
                     (relation-asserted obsess)
                     (response No)
                     (valid-answers No Yes))))      

(defrule determine-GoreAndBlood ""

   (logical (obsess Yes))
   =>

   (assert (UI-state (display GoreAndBlood)
                     (relation-asserted gore)
                     (response No)
                     (valid-answers No Yes)))) 

(defrule determine-SpendQuestion ""

   (logical (properartist No))
   =>

   (assert (UI-state (display SpendQuestion)
                     (relation-asserted spend)
                     (response No)
                     (valid-answers No Yes)))) 

(defrule determine-TVOrMovieQuestion ""

   (logical (movies Yes))
   =>

   (assert (UI-state (display TVOrMovieQuestion)
                     (relation-asserted celebrity)
                     (response No)
                     (valid-answers No Yes)))) 

(defrule determine-YoungCaucasian ""

   (logical (celebrity No))
   =>

   (assert (UI-state (display YoungCaucasian)
                     (relation-asserted caucasian)
                     (response No)
                     (valid-answers No Yes)))) 

(defrule determine-YoungCaucasian ""

   (logical (celebrity No))
   =>

   (assert (UI-state (display YoungCaucasian)
                     (relation-asserted caucasian)
                     (response No)
                     (valid-answers No Yes)))) 

(defrule determine-MaleQuestion ""

   (logical (caucasian Yes))
   =>

   (assert (UI-state (display MaleQuestion)
                     (relation-asserted male)
                     (response No)
                     (valid-answers No Yes)))) 
                     
(defrule determine-ArtAndCrafts ""

   (logical (male No))
   =>

   (assert (UI-state (display ArtAndCrafts)
                     (relation-asserted arts)
                     (response No)
                     (valid-answers No Yes)))) 
                                          
                     
;;;****************
;;;* RESULT       *
;;;****************                    

(defrule BoothBAbe ""

   (logical (arts No))
   
   =>

   (assert (UI-state (display BoothBAbe)
                     (state final))))

(defrule Cosplayer ""

   (logical (arts Yes))
   
   =>

   (assert (UI-state (display Cosplayer)
                     (state final))))

(defrule MilitaryShooterPackagingModel ""

   (logical (male Yes))
   
   =>

   (assert (UI-state (display MilitaryShooterPackagingModel)
                     (state final))))

(defrule MotionCaptureActor ""

   (logical (caucasian No))
   
   =>

   (assert (UI-state (display MotionCaptureActor)
                     (state final))))

(defrule VoiceActor ""

   (logical (celebrity Yes))
   
   =>

   (assert (UI-state (display VoiceActor)
                     (state final))))

(defrule 3dArtist ""

   (logical (spend No))
   
   =>

   (assert (UI-state (display Animator)
                     (state final)))) 

(defrule Animator ""

   (logical (spend Yes))
   
   =>

   (assert (UI-state (display Animator)
                     (state final)))) 

(defrule CombatDesigner ""

   (logical (gore Yes))
   
   =>

   (assert (UI-state (display CombatDesigner)
                     (state final)))) 


(defrule GameDesigner ""

   (logical (gore No))
   
   =>

   (assert (UI-state (display GameDesigner)
                     (state final)))) 

(defrule EventScriprter ""

   (logical (obsess No))
   
   =>

   (assert (UI-state (display EventScriprter)
                     (state final)))) 

(defrule LeadGameDesigner ""

   (logical (told No))
   
   =>

   (assert (UI-state (display LeadGameDesigner)
                     (state final))))                      
                     
(defrule Writer ""

   (logical (spreadsheet No))
   
   =>

   (assert (UI-state (display Writer)
                     (state final))))                       
                                           
(defrule LevelDesigner ""

   (logical (unfinished Yes))
   
   =>

   (assert (UI-state (display LevelDesigner)
                     (state final))))                     
                                          
(defrule Composer ""

   (logical (shoot No))
   
   =>

   (assert (UI-state (display Composer)
                     (state final))))
                     
(defrule SoundDesigner ""

   (logical (shoot Yes))
   
   =>

   (assert (UI-state (display SoundDesigner)
                     (state final))))                                          
                                                                                                                                             
(defrule OfficeIT ""

   (logical (musical No))
   
   =>

   (assert (UI-state (display OfficeIT)
                     (state final))))

(defrule CommunityManager ""

   (logical (hangout No))
   
   =>

   (assert (UI-state (display CommunityManager)
                     (state final))))

(defrule GuildLeader ""

   (logical (hangout Yes))
   
   =>

   (assert (UI-state (display GuildLeader)
                     (state final))))                      
                     
(defrule QualityAssurance ""

   (logical (error Yes))
   
   =>

   (assert (UI-state (display QualityAssurance)
                     (state final))))                      
                     
(defrule ArtDirector ""

   (logical (workingovertalking No))
   
   =>

   (assert (UI-state (display ArtDirector)
                     (state final))))                      
                     
(defrule 2dArtist ""

   (logical (crafting No))
   
   =>

   (assert (UI-state (display 2dArtist)
                     (state final))))                                         
                     
(defrule EnvironmentalArtist ""

   (logical (crafting Yes))
   
   =>

   (assert (UI-state (display EnvironmentalArtist)
                     (state final))))                     
                     
(defrule ConceptArtist ""

   (logical (asian Yes))
   
   =>

   (assert (UI-state (display ConceptArtist)
                     (state final))))                     
                     
(defrule TechnicalLead ""

   (logical (code Well))
   
   =>

   (assert (UI-state (display TechnicalLead)
                     (state final))))                     
                     
(defrule OutOfLuck ""

   (logical (code No))
   
   =>

   (assert (UI-state (display OutOfLuck)
                     (state final))))                     
                               
(defrule Programmer ""

   (logical (code Yes))
   
   =>

   (assert (UI-state (display Programmer)
                     (state final))))            
          
(defrule StudioHead ""

   (logical (consciences Yes))
   
   =>

   (assert (UI-state (display StudioHead)
                     (state final))))           
          
(defrule SocialGamesStudioHEad ""

   (logical (consciences No))
   
   =>

   (assert (UI-state (display SocialGamesStudioHEad)
                     (state final))))               
          
(defrule Producer ""

   (logical (anymoney No))
   
   =>

   (assert (UI-state (display Producer)
                     (state final))))             
          
(defrule Consultant ""

   (logical (afraid Yes))
   
   =>

   (assert (UI-state (display Consultant)
                     (state final))))            
                     
(defrule GoldFarmer ""

   (logical (areyouasia China))
   
   =>

   (assert (UI-state (display GoldFarmer)
                     (state final))))                                         
                     
                     
(defrule Starcraftcyberathlete ""

   (logical (areyouasia Korea))
   
   =>

   (assert (UI-state (display Starcraftcyberathlete)
                     (state final))))                                         

(defrule Gamer ""

   (logical (goodplaying No))
   
   =>

   (assert (UI-state (display Gamer)
                     (state final))))

(defrule Blogger ""

   (logical (grammar Yes))
   
   =>

   (assert (UI-state (display Blogger)
                     (state final))))

(defrule IndieDeveloper ""

   (logical (makegame Yes))
   
   =>

   (assert (UI-state (display IndieDeveloper)
                     (state final))))

(defrule SocialGamesStudioEmployee ""

   (logical (important No))
   
   =>

   (assert (UI-state (display SocialGamesStudioEmployee)
                     (state final))))

(defrule Marketer ""

   (logical (excited Fake))
   
   =>

   (assert (UI-state (display Marketer)
                     (state final))))

(defrule CreativeDirector ""

   (logical (grandvision Yes))
   
   =>

   (assert (UI-state (display CreativeDirector)
                     (state final))))
                     

(defrule GameCritic ""

   (logical (bitter Yes))
   
   =>

   (assert (UI-state (display GameCritic)
                     (state final))))
                     
(defrule GameReviewer ""

   (logical (bitter No))
   
   =>

   (assert (UI-state (display GameReviewer)
                     (state final))))                     
                     
(defrule PlayingGame-conclusion ""

   (logical (french Yes))
   
   =>

   (assert (UI-state (display ComicArtist)
                     (state final))))                     

                     
;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   
