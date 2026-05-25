extends Node3D

@export var textrange:=1
@onready var light:SpotLight3D=$SpotLight3D

var player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var distance = global_position.distance_to(player.global_position)
	
	if distance <=textrange:
		light.visible=true
		if Input.is_action_just_pressed("interaction"):
			get_tree().change_scene_to_file("res://Levels/pc_level.tscn")
	else:
		light.visible=false
