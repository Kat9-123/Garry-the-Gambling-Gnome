extends Area2D


onready var left = $SpriteHolder/Left
onready var right = $SpriteHolder/Right
onready var top = $SpriteHolder/Top
onready var bottom = $SpriteHolder/Bottom
onready var spriteHolder = $SpriteHolder
onready var tween = $Tween


onready var die = get_parent()



func set_textures():
	right.texture = die.textures[die.right[1]-1]
	left.texture = die.textures[die.right[3]-1]
	
	top.texture = die.textures[die.up[1]-1]
	bottom.texture = die.textures[die.up[3]-1]

var isOpen = false

func _on_mouse_entered():
	if die.disabled:
		return
		
	isOpen = true

	tween.interpolate_property(spriteHolder, "modulate",Color(1,1,1,0),Color(1,1,1,1), 0.15, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
	
	set_textures()
	
	#right.texture = die.textures[die.right[3]-1]
	#left.texture = die.textures[die.right[1]-1]
	
	#top.texture = die.textures[die.up[3]-1]
	#bottom.texture = die.textures[die.up[1]-1]
	

	
	
	#var up = [1,5,6,2]

#var right = [1,4,6,3]


func reset():
	if !isOpen:
		return
	tween.interpolate_property(spriteHolder, "modulate",Color(1,1,1,1),Color(1,1,1,0), 0.15, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
	isOpen = false

func _on_mouse_exited():
	if die.disabled:
		return
	reset()


	
