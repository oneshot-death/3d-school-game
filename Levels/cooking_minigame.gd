extends Node2D

@onready var animation:AnimatedSprite2D=$Pan/EggCooking
@onready var food:Sprite2D=$Food

var food_entered:bool=false
var lmb_event:bool=true
var run_once:bool=false #can be set to false again once the food (the body) exits the area again, use signal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index==MOUSE_BUTTON_LEFT and !event.pressed and food_entered==true and run_once==false:
			run_once=true
			food.visible=false
			animation.visible=true
			animation.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
'	if food_entered==true:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)==false:
			food.visible=false
			if run_once==false:
				animation.visible=true
				animation.play()
				run_once=true'


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	food_entered=true
