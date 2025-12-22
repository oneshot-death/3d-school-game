extends Node3D

@export var rotation_speed_degrees: float = 180.0 # degrees per second
@export var wait_time: float = 2.0               # seconds to wait after rotating 180°

@onready var timer: Timer = $Timer

var rotating: bool = true
var rotated_angle: float = 0.0
var direction: int = 1  # 1 = clockwise, -1 = counterclockwise
var rotating_even:int=0
@onready var player:CharacterBody3D=$"../Player" #finds player wrt classroom scene

func _ready() -> void:
	timer.wait_time = wait_time
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout)
	var player=get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	if rotating:
		player.game_over_maybe=false
		var rotation_amount = rotation_speed_degrees * delta
		rotated_angle += rotation_amount

		rotate_y(deg_to_rad(rotation_amount * direction))

		if rotated_angle >= 180.0:
			rotated_angle = 0.0
			rotating = false
			rotating_even+=1
			direction *= -1
			timer.start()
		
	if rotating_even==2 and rotating==false:
		player.game_over_maybe=true
		rotating_even=0
			

func _on_timer_timeout() -> void:
	rotating = true
