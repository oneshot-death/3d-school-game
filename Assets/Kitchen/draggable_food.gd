extends AnimatedSprite2D

@onready var area:Area2D=$Area2D
@onready var FoodPosition:Marker2D=$"../Pan/FoodPosition"

var dragging:bool=false
var drag_offset=Vector2.ZERO
var entered:bool=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and entered:
		if event.button_index==MOUSE_BUTTON_LEFT and !event.pressed:
			play()
	

func _process(_delta: float) -> void:
	if dragging:
		global_position=get_global_mouse_position()+drag_offset
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)==false:
			dragging=false
			if entered==false:
				get_tree().reload_current_scene()
			else:
				global_position=FoodPosition.global_position

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index==MOUSE_BUTTON_LEFT and event.pressed:
			dragging=true
			drag_offset = global_position - get_global_mouse_position()


func _on_area_2d_area_shape_entered(_area_rid: RID, _area: Area2D, _area_shape_index: int, _local_shape_index: int) -> void:
	entered=true
	
