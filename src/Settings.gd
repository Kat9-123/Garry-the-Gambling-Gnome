extends Control



var fullscreen = false
var sound = true
var timer = false



func _on_FullscreenButton_button_up():
	fullscreen = !fullscreen
	$Fullscreen/Off.visible = !fullscreen
	$Fullscreen/On.visible = fullscreen
	OS.window_fullscreen = fullscreen
	if !fullscreen:
		OS.set_window_size(Vector2(1024, 600))
	
	


func _on_SoundButton_button_up():
	sound = !sound
	$Sound/Off.visible = !sound
	$Sound/On.visible = sound


func _on_TimerButton_button_up():
	timer = !timer
	$Timer/Off.visible = !timer
	$Timer/On.visible = timer
