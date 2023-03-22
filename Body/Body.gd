extends Node2D
class_name Body

@onready var snap = $Snap

var vestments: Array


func Attach(vestment: Node2D):
	vestment.position = snap.position
	vestments.append(vestment)
	# TODO: FIXME later!!!! How to retrieve?


#	var quois = vestments.find(3)
#	print("Dunno: ", quois)


func Detach(vestment: Node2D):
	pass
	#TODO: How do we retrieve the correct Vestment?
