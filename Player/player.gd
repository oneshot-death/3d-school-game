extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var mouse_motion=Vector2.ZERO
var classroom_loaded:bool=false
var game_over_maybe:bool=false

@onready var camerapivot:Node3D=$CameraPivot
@onready var game_over_screen:Control=$"../GameOverScreen"

@export var rotation_speed_degrees:float=2

signal relief
signal no_relief

func _ready() -> void:
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED
	

func _physics_process(delta: float) -> void:
	if classroom_loaded==false:
		handle_camera_rotation()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if classroom_loaded==false:
		var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

		move_and_slide()
	else:
		if Input.is_action_pressed("move_left"):
			if rotation_degrees.y<-120 or 170<rotation_degrees.y and 180>rotation_degrees.y:
				rotate_y(rotation_speed_degrees*delta)
				#print(rotation_degrees.y)
				
				
		if Input.is_action_pressed("move_right"):
			if rotation_degrees.y<0:
				rotate_y(-rotation_speed_degrees*delta)
				#print(rotation_degrees.y)
				
		if rotation_degrees.y>-135 and rotation_degrees.y<-118:
			relief.emit()
		else:
			no_relief.emit()
				
				
	if game_over_maybe==true:
		if -165<rotation_degrees.y and not (rotation_degrees.y>=176 and rotation_degrees.y<=180):
			get_tree().paused=true
			game_over_screen.game_over()

	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.mouse_mode==Input.MOUSE_MODE_CAPTURED:
			mouse_motion=-event.relative*0.001
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode=Input.MOUSE_MODE_VISIBLE 
		
func handle_camera_rotation() -> void:
	rotate_y(mouse_motion.x)
	camerapivot.rotate_x(mouse_motion.y)
	camerapivot.rotation_degrees.x=clampf(camerapivot.rotation_degrees.x,-90.0,90.0)
	mouse_motion=Vector2.ZERO

	
	
