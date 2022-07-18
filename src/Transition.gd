extends Control

var isTransitioning = false

func transition():
	if isTransitioning:
		return
	$Tween.interpolate_property($Sprite, "modulate",
		Color(0,0,0,0), Color(0,0,0,1), 0.3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		
	isTransitioning = true
	$Tween.start()
	$Timer.start()


func _on_Timer_timeout():
	$Tween.interpolate_property($Sprite, "modulate",
		Color(0,0,0,1), Color(0,0,0,0), 0.3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	$TransitionWaitTimer.start()
	$Tween.start()


func _on_TransitionWaitTimer_timeout():
	isTransitioning = false
