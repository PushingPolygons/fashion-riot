extends Node

const TOP = preload("res://Top/Top.tscn")
@onready var body = $Body

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var top = TOP.instantiate()
		body.add_child(top)
		body.AttachTop(top)
		
