extends Label

onready var responsedelay = get_node("ResponseDelay")

var growing = ["Mmph!", 
"...!!!", 
"O-one sec!!", 
"...!!!", 
"O-one sec!!", 
"Hhhnngg!"]

var neutral = ["I'm back! How do I look?", 
"Happy to see me again?", 
"Feelin' good! Let's go again!", 
"Happy to see me again?", 
"Feelin' good! Let's go again!", 
"Aaaaand I'm back! What's next?"]

var buff = ["Oh Glob, I'm gettin' beefy!", 
"Whatcha think of my new guns, Princess?", 
"Boom! Check out these arms!", 
"*Flex* This shirt feels kinda small now...", 
"Geez... sure is hard to keep balance with these things. You sure I can still go out like this?", 
"Now this is more like it! Hope you have something big enough to measure these guns!"
]

var busty = ["These things are kinda heavy...", 
"Woah! I bet these cans are bigger than yours, Peebs!", 
"Bam! How 'bout these knock-out jugs, huh?", 
"Heh, maybe I should start modelling! What do you think?", 
"Could you maybe make your lab doors a little... wider?", 
"Pretty soon I'll have sleep on these instead of my bed!"
]

var bustycomfy = ["If I weren't so jacked, I might've thought these were heavy!", 
"Heh, good thing I'm super-duper ripped!", 
"Y'know, these bad boys actually make pretty great training weights.", 
"Giant milkers don't weigh a thing when you're *this* huge!", 
"You wouldn't believe how hard these make pushups!", 
"Took me forever climbing up that canyon... but I rolled down here no problem."
]

var chubby = ["Maybe I should start exercising...!", 
"Sorry that took so long... can we eat now?", 
"Eeggh... Caramel Canyon is the worst. So sticky.", 
"C-can't... pull... down... shhhiiiirt!!", 
"This isn't the kind of big I'm used to...", 
"Oh glob...everything feels so heavy...Can I go somewhere to slim down?"
]


func _ready()->void :
	pass
	
	
func _on_ReturnTween_tween_completed(_object, _key)->void :
	var response = randi() % 3
	text = growing[response]
	
	
func _on_Growth_animation_finished(_anim_name:String)->void :
	responsedelay.set_wait_time(2)
	responsedelay.start()

func _on_ResponseDelay_timeout()->void :
	var response = randi() % 5
	var boobtalk = randi() % 2
	var noneneutral = 1
	
	if get_parent().get_node("Body").frame >= 7 and get_parent().get_node("Body/Bust").bust < 10:
		text = buff[response]
		noneneutral = 0
		print("buffworking")
		
	elif get_parent().get_node("Body").frame >= 7 and get_parent().get_node("Body/Bust").bust >= 10:
		text = bustycomfy[response]
		noneneutral = 0
		print("comfybustyworking")
		
	elif get_parent().get_node("Body/BustContainer/Bust").bust >= 10 and boobtalk == 0:
		text = (busty[response])
		noneneutral = 0
		print("bustworking")
		
	elif get_parent().get_node("Body").frame <= 4:
		text = (chubby[response])
		noneneutral = 0
		print("chubworking")
		
	elif noneneutral == 1:
		text = (neutral[response])


func _on_Boobs_Button_pressed()->void :
	text = ("Next Location: Mt. Milk")


func _on_Boobs_Button2_pressed()->void :
	text = ("Next Location: The Pale Flats")


func _on_Fat_Button_pressed()->void :
	text = ("Next Location: Caramel Canyon")


func _on_Muscle_Button_pressed()->void :
	text = ("Next Location: Protein Palace")






