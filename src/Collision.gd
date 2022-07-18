extends Node2D


onready var top = $Top
onready var bottom = $Bottom
onready var left = $Left
onready var right = $Right





func check_collision(movement) -> bool:
	if movement.y == -1 and top.is_colliding():

		return false
	if movement.y == 1 and bottom.is_colliding():
		return false
		
	if movement.x == -1 and left.is_colliding():
		return false

	if movement.x == 1 and right.is_colliding():
		return false
	
	return true
	
	
