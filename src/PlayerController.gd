extends Node2D



onready var movementTimer = $MovementTimer
const SPEED = 50

onready var tween = $Tween

onready var sprite = get_parent().get_child(1)


onready var player = get_parent()

onready var pusher = get_parent().get_child(0) # PUSHER



func do_push(movement) -> bool:

		
	if movement.y == -1:
		if pusher.topDie != null:
			return pusher.topDie.get_parent().push(Vector2(0,-1))
	if movement.y == 1:
		if pusher.bottomDie != null:
			return pusher.bottomDie.get_parent().push(Vector2(0,1))
	if movement.x == -1:
		if pusher.leftDie != null:
			return pusher.leftDie.get_parent().push(Vector2(-1,0))

	if movement.x == 1:
		if pusher.rightDie != null:
			return pusher.rightDie.get_parent().push(Vector2(1,0))
	return true
	

func _ready():
	pass # Replace with function body.


func _process(delta):
	var movement = Vector2(0,0);
	if Input.is_action_pressed("up"):
		movement.y = -1
	if Input.is_action_pressed("down"):
		movement.y = 1
	if Input.is_action_pressed("left"):
		movement.x = -1
	if Input.is_action_pressed("right"):
		movement.x = 1
		
	if movement.x != 0 and movement.y != 0:
		movement.y = 0
		
		
	if movement == Vector2(0,0):
		return
		
		
	
		

	
	if movementTimer.time_left == 0:
		movementTimer.start()
		
		
		if movement.x == -1:
			sprite.flip_h = false
			
			
		if movement.x == 1:
			sprite.flip_h = true
		
		if !$Collision.check_collision(movement):
			return
		if !do_push(movement):
			return
		
		tween.interpolate_property(player, "position",player.position,player.position+(movement*64), 0.1, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
		tween.start()
	
	
		
