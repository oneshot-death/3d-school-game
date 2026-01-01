extends Node3D

@export var textrange:=1

var player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var distance = global_position.distance_to(player.global_position)
	
	if distance <=textrange:
		if Input.is_action_just_pressed("interaction"):
			get_tree().change_scene_to_file("res://Levels/pc_level.tscn")
