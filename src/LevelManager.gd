extends Node2D

var completed = 0


var goalCount: int = 0


onready var player = get_node("/root/Main/Player")
onready var start = get_child(0)

func setup():
	
	completed = 0
	player.position = $Start.position
	goalCount = get_child(1).get_child_count()
	print("GOALCOUNT", goalCount)
	get_node("/root/Main/Player/AnimatedSprite").stop_anim()


func complete():
	print(completed)
	print(goalCount)
	completed += 1

	if completed == goalCount:
		get_node("/root/Main/Audio").level()
		get_node("/root/Main/Player/AnimatedSprite").play_anim()

		get_node("/root/Main").load_next()

