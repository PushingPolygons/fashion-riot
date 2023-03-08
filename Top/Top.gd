extends Area2D

@export var snap_distance: float = 100.0 # px
var is_dragging: bool = false


func _ready():
	input_event.connect(OnInputEvent)


func OnInputEvent(view, event, idk):
	if event is InputEventMouseButton:
		
		# Pressed down on top.
		if event.pressed:
			is_dragging = true
		# Lift up.
		else:
			is_dragging = false


func _process(delta):
	if is_dragging:
		position = get_viewport().get_mouse_position() - get_parent().position
		var pos = get_parent().top_snap.position
		if position.distance_to(pos) < snap_distance:
			print("Close enough.")
			get_parent().AttachTop(self)
