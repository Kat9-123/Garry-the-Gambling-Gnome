extends Control

var playEnabled = true



func _on_Play_button_up():
	if !playEnabled:
		return
	get_node("/root/Main/LevelFade").start()
	get_node("/root/Main/Control/Transition").transition()
	$LevelSelectScreen.do()
	playEnabled = false
	$PlayEnabledTimer.start()




func _on_LevelFade_timeout():
	$Title.visible = false
	$LevelSelectScreen.visible = true


func _on_Exit_button_up():
	$Title/Exit.disabled = true
	get_parent().escapeEnabled = false
	get_node("/root/Main/ExitTimer").start()
	get_node("/root/Main/Control/Transition").transition()


func _on_PlayEnabledTimer_timeout():
	playEnabled = true
