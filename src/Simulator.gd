extends Spatial


func set_orientation():
	pass
	
	
var currentBody


var map = {"Up":1,"Front":2,"Down":6,"Back":5,"Left":5,"Right":3}

func simulate(movement):
	if movement.x == -1:
		$Colliders.rotation_degrees.z -= 90
	if movement.x == 1:
		$Colliders.rotation_degrees.z += 90
	if movement.y == -1:
		$Colliders.rotation_degrees.x += 90
	if movement.y == 1:
		$Colliders.rotation_degrees.x -= 90
		
	
	return map[currentBody.name]

	

func _on_Detector_body_entered(body):
	currentBody = body
