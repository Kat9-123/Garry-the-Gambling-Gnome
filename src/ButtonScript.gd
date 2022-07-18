extends Button





func down():
	get_node("/root/Main/Audio").click()
	if $Sprite == null:
		return
	$Sprite.modulate = Color(0.8,0.8,0.8)
	
func up():
	if $Sprite == null:
		return
	$Sprite.modulate = Color(1,1,1)

