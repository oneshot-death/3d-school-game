extends CharacterBody3D

@export var rotation_speed_degrees:float=90

@onready var timer:Timer=$Timer

var target_angle:float=180.0
var rotating:bool=true
var start_angle:float

func _ready() -> void:
	start_angle=rotation_degrees.y
	
func _process(delta: float) -> void:
	if rotating:
		rotate_y(delta*rotation_speed_degrees)
		if rotation_degrees.y-start_angle>=target_angle:
			rotating=false
			timer.start()
	


func _on_timer_timeout() -> void:
	rotating=true
