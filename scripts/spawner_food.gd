extends Node2D

var food := Food.new()

@onready var snake := %snake as Snake

func _ready():
	spawn_food() 

func _process(delta):
	queue_redraw()
	
	# check collision between food and minisnakes
	if food.get_rect().intersects(snake.head.get_rect()):
		snake.grow()
		spawn_food()


func _draw():
	draw_rect(food.get_rect(), food.color)


func spawn_food() -> void:
	var is_on_occupied_position = true
	
	while is_on_occupied_position:
		var random_position = Vector2()
		random_position.x = randi_range(0, Game.GRID_SIZE.x - Game.CELL_SIZE.x)
		random_position.y = randi_range(0, Game.GRID_SIZE.y - Game.CELL_SIZE.y)
		food.position = random_position.snapped(Game.CELL_SIZE)
		
		# check is position is occupied
		for minisnake in snake.minisnakes:
			if food.get_rect().intersects(minisnake.get_rect()):
				is_on_occupied_position = true
				break
			else:
				is_on_occupied_position = false

