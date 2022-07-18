extends Node2D


onready var textures = [
	preload("res://assets/1.png"),
	preload("res://assets/2.png"),
	preload("res://assets/3.png"),
	preload("res://assets/4.png"),
	preload("res://assets/5.png"),
	preload("res://assets/6.png"),

]

var disabled = false


export(int,1,6) var startNum: int = 1

var up = [1,5,6,2]

var right = [1,4,6,3]



func _ready():

	$Sprite.texture = textures[currentVal-1]

func shift_left(arr):
	var a = arr[0]
	arr[0] = arr[1]
	arr[1] = arr[2]
	arr[2] = arr[3]
	arr[3] = a



func _process(delta):
	if disabled:
		$MouseDetector.reset()
		set_process(false)

func shift_right(arr):
	var a = arr[3]
	arr[3] = arr[2]
	arr[2] = arr[1]
	arr[1] = arr[0]
	arr[0] = a




var currentVal = 1


var colBody

func push(movement) -> bool:
	if disabled:
		return false
	if !$Collision.check_collision(movement):
		print("BLOCKED")
		return false

	
	# PUSH RIGHT
	if movement.x == 1:
		shift_left(right)
		currentVal = right[0]
		up[0] = right[0]
		up[2] = right[2]

	# PUSH LEFT
	if movement.x == -1:
		shift_right(right)
		currentVal = right[0]
		up[0] = right[0]
		up[2] = right[2]
	
	# PUSH FORWARD
	if movement.y == -1:
		shift_left(up)
		currentVal = up[0]
		right[0] = up[0]
		right[2] = up[2]
		
	# PUSH BACK
	if movement.y == 1:
		shift_right(up)
		currentVal = up[0]
		right[0] = up[0]
		right[2] = up[2]
		


	$Sprite.texture = textures[currentVal-1]

	$Tween.interpolate_property(self, "position",position,position+(movement*64), 0.1, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Tween.start()
	
	
	$MouseDetector.set_textures()
	
	
	
	
	

	return true
	



