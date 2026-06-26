extends Sprite2D

@onready var area:Area2D=$Area2D

var dragging:bool=false
var drag_offset=Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dragging:
		global_position=get_global_mouse_position()+drag_offset
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)==false:
			dragging=false
			return

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index==MOUSE_BUTTON_LEFT and event.pressed:
			dragging=true
			drag_offset = global_position - get_global_mouse_position()
