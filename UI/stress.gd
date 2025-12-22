extends CanvasLayer

@onready var stressbar=$StressBar
@onready var player=$"../Player"

@export var rate:float=2

var negative:bool=false

func _ready() -> void:
	print(player)
	player.relief.connect(relief_detection)
	player.no_relief.connect(no_relief_detection)

func _process(delta: float) -> void:
	if negative:
		stressbar.value-=rate*delta
	else:
		stressbar.value+=rate*delta

func relief_detection() -> void:
	negative=true
	
func no_relief_detection() -> void:
	negative=false
