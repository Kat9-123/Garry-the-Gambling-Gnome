extends Control


func _ready():
	$TimeDisplay.bbcode_text = "[center]" + get_node("/root/Main/Control/HUD/Timer").bbcode_text.substr(len("[right]"),len(get_node("/root/Main/Control/HUD/Timer").bbcode_text)-1)
	get_node("/root/Main/Player").visible = false
	get_node("/root/Main/Audio").victory()
