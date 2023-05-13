extends Area2D
class_name Article

@export var group: String = "dragable"
@export var snap_distance: float = 100.0 # px

var dragging: bool = false
var touch_position: Vector2


func _ready():
	# Signal hooks.
	input_event.connect(OnInputEvent)
	mouse_entered.connect(OnMouseEntered)
	mouse_exited.connect(OnMouseExited)


func OnMouseEntered():
	add_to_group(group)


func OnMouseExited():
	remove_from_group(group)


func _input(event):
	if not dragging:
		return
	
	if event is InputEventMouseButton:
		if not event.pressed:
			dragging = false
	
	if event is InputEventMouseMotion:
		position -= touch_position - (event.position)
		touch_position = event.position


func OnInputEvent(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed: # Pressed down on vestment.
			if IsOnTop():
				dragging = true
				touch_position = event.position
				get_parent().move_child(self, -1)


func IsOnTop():
	for article in get_tree().get_nodes_in_group(group):
		if article.get_index() > get_index():
			return false
	return true

