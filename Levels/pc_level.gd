extends Node2D


var random:String="this is the string to be shown"
var string_length:int=0
var string_update:bool=true
var cursor:String="█"
var cursor_visible:bool=true

@onready var notepad:RichTextLabel=$TextureRect/RichTextLabel
@onready var cooldown:Timer=$cooldown
@onready var cursorblink_timer:Timer=$CursorBlink

func _ready() -> void:
	notepad.text=notepad.text+"█"

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_pressed():
		cooldown.start()
		if string_update:
			string_update=false
			string_length=string_length+1
			notepad.text=random.substr(0,string_length)
			#notepad.text=notepad.text+"█"


func _on_cooldown_timeout() -> void:
	string_update=true


func _on_cursor_blink_timeout() -> void:
	if cursor_visible==true:
		cursor_visible=false
		notepad.text=notepad.text.replace("█","")
		
	else:
		cursor_visible=true
		notepad.text=notepad.text+"█"
