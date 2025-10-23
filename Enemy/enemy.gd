extends CharacterBody3D

@export var rotation_speed_degrees:float=90

@onready var timer:Timer=$Timer

var target_angle:float=180.0
var rotating_left:bool=true
#var rotating_right:bool=false
var start_angle:float

var alternate_check_for_game_over:int=0

var game_over_send:bool=false

func _ready() -> void:
	start_angle=rotation_degrees.y
	var player=get_tree().get_first_node_in_group("player")
	
func _physics_process(delta: float) -> void:
	if rotating_left:
		rotation_degrees.y+=rotation_speed_degrees*delta
		if rotation_degrees.y-start_angle>=target_angle:
			rotating_left=false
			alternate_check_for_game_over+=1
			if alternate_check_for_game_over%2==0 && game_over_send==false: #check if enemy is looking at player again
				game_over_send=true
			timer.start()
			start_angle=rotation_degrees.y
		
func _process(delta: float) -> void:
	pass #maybe run a signal that connects to player anytime game_over_send is true


func _on_timer_timeout() -> void:
	rotating_left=true
	game_over_send=false
