extends Node

const TOP = preload("res://Top/Top.tscn")
const USER_PATH = "user://game_save.dat"

@onready var body := $Body
@onready var save_button = $SaveButton
@onready var load_button = $LoadButton

func _ready():
	save_button.pressed.connect(OnSaved)
	load_button.pressed.connect(OnLoaded)

func OnSaved():
	print("Saved pressed.")
	var file = FileAccess.open(USER_PATH, FileAccess.WRITE)
	file.store_string(body.vestments[0].name)

func OnLoaded():
	var file = FileAccess.open(USER_PATH, FileAccess.READ)
	var number = file.get_32()
	print(number)
	# TODO: Load, display, and attach vestments.
