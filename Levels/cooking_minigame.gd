extends Node2D

@onready var animation:AnimatedSprite2D=$Pan/EggCooking
@onready var food:Sprite2D=$Food

var food_entered:bool=false
var lmb_event:bool=true
var run_once:bool=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if food_entered==true:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)==false:
			food.visible=false	
			if run_once==false:
				animation.visible=true
				animation.play()
				run_once=true


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	food_entered=true
