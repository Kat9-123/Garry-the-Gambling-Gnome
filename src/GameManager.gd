extends Node2D


var currentIndex: int = 1


# RESET
func _ready():
	return
	#get_node("/root/Main/SaveManager").save_file(6)

func start(n):
	currentIndex = n
	levelScene = load("res://scenes/levels/Level" + str(n) +".tscn")
	get_node("/root/Main/Control/Transition").transition()
	$StartTimer.start()

	
	


func load_next():
	currentIndex += 1
	load_level(currentIndex)

var levelScene
func load_level(n):
	currentIndex = n
	print("loaded ", n)
	levelScene = load("res://scenes/levels/Level" + str(n) + ".tscn")
	

	
	$SaveManager.save_file(currentIndex)
	$LevelTimer.start()
	$TransitionTimer.start()
	

	
func _process(deltaTime):
	if Input.is_action_just_pressed("reset") and resetEnabled:
		resetEnabled = false
		get_node("/root/Main/Control/Transition").transition()
		$ResetTimer.start()
		$ResetEnable.start()
	if Input.is_action_just_pressed("escape") and escapeEnabled: 
		$EscapeEnableTimer.start()
		escapeEnabled = false
		if $Music.playy == false:
			get_node("/root/Main/Music").set_process(true)
			get_node("/root/Main/Music").playy = true
		get_node("/root/Main/Control/Transition").transition()
		if $Control/Title.visible == true:
			$ExitTimer.start()
			set_process(false)
			return
		$EscapeTimer.start()
		
		

func reset():
	
	var level = levelScene.instance()
	if get_node("/root/Main/CurrentLevel").get_child_count() != 0:
		get_node("/root/Main/CurrentLevel").get_child(0).queue_free()

	
	get_node("/root/Main/CurrentLevel").add_child(level)
	level.setup()

func _on_LevelTimer_timeout():
	reset()
	
	



func _on_StartTimer_timeout():
	var level = levelScene.instance()
	get_node("/root/Main/CurrentLevel").add_child(level)
	level.setup()
	get_node("/root/Main/Player").visible = true
	get_node("/root/Main/Control/HUD").start_timer()
	$Control/LevelSelectScreen.visible = false


func _on_EscapeTimer_timeout():
	if get_node("/root/Main/CurrentLevel").get_child_count() != 0:
		get_node("/root/Main/CurrentLevel").get_child(0).queue_free()
	$Player.visible = false
	$Control/Title.visible = true
	$Control/HUD/Timer.visible = false
	$Control/LevelSelectScreen.visible = false


func _on_ExitTimer_timeout():
	get_tree().quit()


var escapeEnabled = true

func _on_EscapeEnableTimer_timeout():
	escapeEnabled = true


var resetEnabled = true
func _on_ResetTimer_timeout():
	reset()


func _on_ResetEnable_timeout():
	resetEnabled = true
	

