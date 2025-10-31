extends CanvasLayer

@onready var stressbar=$StressBar
@export var rate:float=2

func _ready() -> void:
	#connect("relief",Callable,"relief_detection")
	pass

func _process(delta: float) -> void:
	stressbar.value+=rate*delta

func relief_detection() -> void:
	pass
