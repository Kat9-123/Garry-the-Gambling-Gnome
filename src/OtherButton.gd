extends Button





func down():
	get_node("/root/Main/Audio").click()
	
	get_parent().modulate = Color(0.8,0.8,0.8)
	
func up():

	get_parent().modulate = Color(1,1,1)

