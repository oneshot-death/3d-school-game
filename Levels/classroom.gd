extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player=get_tree().get_first_node_in_group("player")
	print(player)
	player.classroom_loaded=true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
