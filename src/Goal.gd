extends Node2D


onready var textures = [
	preload("res://assets/1.png"),
	preload("res://assets/2.png"),
	preload("res://assets/3.png"),
	preload("res://assets/4.png"),
	preload("res://assets/5.png"),
	preload("res://assets/6.png"),

]

export(int,1, 6) var value: int

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = textures[value-1]
	$Sprite.scale = Vector2(2,2)
	$Sprite.modulate = Color(1,1,1,66.0/255.0)







func _on_Area2D_body_entered(body):
	print(body, "entered goal")
	
	
	if body.get_parent().currentVal == value:
		body.get_parent().disabled = true
		
		get_node("/root/Main/Audio").die()
	#	body.get_parent().get_child(0).modulate = Color(0.8,0.8,0.8)

		get_node("/root/Main/CurrentLevel").get_child(0).complete()
