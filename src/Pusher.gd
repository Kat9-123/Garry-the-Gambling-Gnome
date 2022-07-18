extends Node2D


onready var top = $Top
onready var bottom = $Bottom
onready var left = $Left
onready var right = $Right


var topDie: KinematicBody2D = null
var bottomDie: KinematicBody2D = null
var leftDie: KinematicBody2D = null
var rightDie: KinematicBody2D = null



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	topDie = top.get_collider()
	bottomDie = bottom.get_collider()
	leftDie = left.get_collider()
	rightDie = right.get_collider()

	
