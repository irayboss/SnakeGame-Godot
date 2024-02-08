extends Control


func _ready():
	hide()
	modulate.a = 0
	
	Game.gameover.connect(_on_gameover)


func _on_gameover() -> void:
	show()
	create_tween().tween_property(self, "modulate:a", 1, .2)
	
	# wait for input action
	while !Input.is_action_pressed("start"): await get_tree().process_frame
	
	Game.restart()
