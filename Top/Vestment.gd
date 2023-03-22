extends Area2D
class_name Vestment

@export var snap_distance: float = 100.0 # px
var is_dragging: bool = false
var mouse_offset: Vector2 = Vector2(0, 100)


func _ready():
	input_event.connect(OnInputEvent)

func _process(delta):
	if Input.is_action_just_released("drag"):
		is_dragging = false
	
	if is_dragging:
		position = get_viewport().get_mouse_position() - get_parent().position - mouse_offset
		print(position)
		var pos = get_parent().snap.position
		if position.distance_to(pos) < snap_distance:
			print("Close enough.")
			get_parent().Attach(self)

func OnInputEvent(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed: # Pressed down on vestment.
			is_dragging = true
			mouse_offset = get_local_mouse_position()
			


