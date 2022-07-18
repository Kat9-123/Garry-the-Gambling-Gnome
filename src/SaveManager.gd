extends Node2D






func save_file(content):
	var file = File.new()
	file.open("user://save_game.dat", File.WRITE)
	file.store_var(content)
	file.close()

func load_file():
	var file = File.new()
	file.open("user://save_game.dat", File.READ)
	var content = file.get_var()
	file.close()
	return content

