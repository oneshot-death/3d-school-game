extends Control

func _ready():
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED

func game_over() ->void:
	visible=true
	Input.mouse_mode=Input.MOUSE_MODE_VISIBLE

func _on_restart_button_pressed() -> void:
	get_tree().paused=false
	get_tree().reload_current_scene()
	
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()
