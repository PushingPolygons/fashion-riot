extends Node
# Singelton class Persistent: `Project` > `Project Settings...` > `Autoload` tab > `Persistent`.

const SAVE_FILE: String = "user://fashion.dat"


static func Load():
	# TODO: Handle error cases.
	# If the file isn't there, make it?
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	if not file:
		push_error("Returned null.")
		print(FileAccess.get_open_error())
		return
	
	# Grab the data from the JSON file.
	var json_text = file.get_as_text()
	var data = JSON.parse_string(json_text)

	# Returns null if parsing failed.
	if data:
		Persistent.data = data
	else:
		push_error("File text data failed to parse.")


static func Save():
	print("Saving to: ", SAVE_FILE)
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	file.store_string(JSON.stringify(Persistent.data))



# The main player data to save.
var data: Dictionary = { "top_id": 0, "bottom_id": 0, "feet_id": 0 }

