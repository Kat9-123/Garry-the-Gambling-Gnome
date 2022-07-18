extends Control



var selectEnabled = true
var unlockedLevels
func do():

	var val =  get_node("/root/Main/SaveManager").load_file()
	if val == null:
		unlockedLevels = 1
	else:
		unlockedLevels = val
	print("UNLOCKED LEVELS: ", unlockedLevels)
	

	
	for i in unlockedLevels:
		$Buttons.get_child(i).get_child(0).disabled = false
		$Buttons.get_child(i).get_child(1).visible = false
		$Buttons.get_child(i).get_child(2).visible = true
		$Buttons.get_child(i).get_child(2).bbcode_text = "[center]" + str(i+1)
		$Buttons.get_child(i).modulate = Color(1,1,1,1)



func _on_button(n):
	if !selectEnabled:
		return
	get_node("/root/Main").start(n)

	selectEnabled = false
	$SelectEnabled.start()

func _on_SelectEnabled_timeout():
	selectEnabled = true
