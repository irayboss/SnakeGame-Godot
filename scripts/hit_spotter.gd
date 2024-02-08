extends Node2D

var hit_spot := Rect2(Vector2.ZERO, Game.CELL_SIZE)
var hit_color := Color.TRANSPARENT

@onready var snake := %snake as Snake

func _ready():
	snake.hit.connect(_on_snake_hit) 


func _process(delta):
	queue_redraw()


func _draw() -> void:
	draw_rect(hit_spot, hit_color)


func _on_snake_hit(minisnake_hit: Minisnake) -> void:
	hit_spot.position = Vector2(minisnake_hit.curr_position)
	
	var tween_pulse = create_tween().set_trans(Tween.TRANS_CIRC).set_loops()
	tween_pulse.tween_property(self, "hit_color", Colors.RED, .55).set_ease(Tween.EASE_OUT)
	tween_pulse.tween_property(self, "hit_color", Color.TRANSPARENT, .55).set_ease(Tween.EASE_IN).set_delay(.1)

