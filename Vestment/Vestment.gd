extends Area2D
class_name Vestment

@onready var next_button = $NextButton
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var snap_distance: float = 100.0 # px
var is_dragging: bool = false
var mouse_offset: Vector2 = Vector2(0, 100)



func _ready():
	input_event.connect(OnInputEvent)
	next_button.pressed.connect(OnNextFrame)


func OnNextFrame():
	animated_sprite_2d.frame += 1

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
			# TODO: Detach as well.


func OnInputEvent(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed: # Pressed down on vestment.
			is_dragging = true
			mouse_offset = get_local_mouse_position()
			


