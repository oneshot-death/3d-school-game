extends Node2D


var random:String="this is the string to be shown"
var string_length:int=0

@onready var notepad:RichTextLabel=$TextureRect/RichTextLabel

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_pressed():
		string_length=string_length+1
		notepad.text=random.substr(0,string_length)
