extends Control

var startTime: float = 0

func _ready():
	set_process(false)

func start_timer():


	startTime = OS.get_ticks_msec()
	set_process(true)
	if !get_node("/root/Main/Control/Title/Settings").timer:
		return
	$Timer.visible = true
	
	
func _process(delta):
	var time = int(OS.get_ticks_msec()-startTime)
	
	var milis = str(time % 1000)
	
	if milis.length() == 1:
		milis = "00" + milis
	if milis.length() == 2:
		milis = "0" + milis
	
	var secs = (time / 1000) % 60
	var mins = str((time / 1000) / 60)
	
	
	if mins.length() == 1:
		mins = "0" + mins
	
	$Timer.bbcode_text = "[right]" + mins + ":" + str(secs) + "." + milis.substr(0,1)
