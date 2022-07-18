extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

var mode = false

func jump():
	mode = !mode
	if mode:
		$Tween.interpolate_property(self, "position",position,Vector2(position.x,position.y-30), 0.4, Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
		$Tween.start()
		return
	$Tween.interpolate_property(self, "position",position,Vector2(position.x,position.y+30), 0.3, Tween.TRANS_EXPO,Tween.EASE_IN_OUT)
	$Tween.start()
	
	
func play_anim():
	mode = false
	position = Vector2(0,0)
	$Timer.start()
	jump()
	visible = true
	get_parent().get_child(1).visible = false
	
	flip_h = get_parent().get_child(1).flip_h
	playing = true
	frame = 0
	
func stop_anim():
	$Timer.stop()
	$Tween.stop_all()
	visible = false
	get_parent().get_child(1).visible = true
	playing = false





func _on_Timer_timeout():
	jump()
