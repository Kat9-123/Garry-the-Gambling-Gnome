extends AudioStreamPlayer2D


var victory  = preload("res://assets/sounds/victory.wav")
var die = preload("res://assets/sounds/dice.wav")
var level = preload("res://assets/sounds/level.wav")
var click = preload("res://assets/sounds/click.wav")


onready var settings = get_node("/root/Main/Control/Title/Settings")

func die():
	if !settings.sound:
		return

	stop()
	stream = die
	play()


func level():
	if !settings.sound:
		return
	stop()
	stream = level
	play()
	
func click():
	if !settings.sound:
		return
	stop()
	stream = click
	play()
	
func victory():
	if !settings.sound:
		return
	get_node("/root/Main/Music").set_process(false)
	get_node("/root/Main/Music").stop()
	get_node("/root/Main/Music").playy = false
	stop()
	stream = victory
	play()
	
