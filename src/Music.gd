extends AudioStreamPlayer2D


#https://soundcloud.com/serpentsoundstudios/royalty-free-medieval-tavern-music-tavern-loop-one-loopable
onready var settings = get_node("/root/Main/Control/Title/Settings")

var playy = true

var music  = preload("res://assets/sounds/music.wav")
func _process(delta: float) -> void:
	if !settings.sound:
		stop()
		return
		
	
	if !is_playing():
		stream = music
		play()
