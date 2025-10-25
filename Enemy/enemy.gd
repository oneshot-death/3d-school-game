extends Node3D

@export var rotation_speed_degrees: float = 180.0 # degrees per second
@export var wait_time: float = 2.0               # seconds to wait after rotating 180°

@onready var timer: Timer = $Timer

var rotating: bool = true
var rotated_angle: float = 0.0
var direction: int = 1  # 1 = clockwise, -1 = counterclockwise

func _ready() -> void:
	timer.wait_time = wait_time
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout)

func _process(delta: float) -> void:
	if rotating:
		var rotation_amount = rotation_speed_degrees * delta
		rotated_angle += rotation_amount

		rotate_y(deg_to_rad(rotation_amount * direction))

		if rotated_angle >= 180.0:
			rotated_angle = 0.0
			rotating = false
			direction *= -1
			timer.start()

func _on_timer_timeout() -> void:
	rotating = true
