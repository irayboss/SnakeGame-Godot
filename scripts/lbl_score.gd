extends Label

var tween : Tween

func _ready():
	modulate.a = 0
	
	Game.gameover.connect(_on_gameover)
	Game.score_changed.connect(_on_score_changed)


func _process(delta):
	pass
 

func _on_score_changed(score: int) -> void:
	text = str(score)
	
	if tween and tween.is_running(): tween.kill()
	tween = create_tween().set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "modulate:a", 1, .5).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "modulate:a", 0, .5).set_ease(Tween.EASE_IN)


func _on_gameover():
	if tween and tween.is_running(): tween.kill()
	tween = create_tween().set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "modulate:a", 1, .5).set_ease(Tween.EASE_OUT)
