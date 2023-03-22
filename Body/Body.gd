extends Node2D

@onready var snap = $Snap


func Attach(vestment: Node2D):
	vestment.position = snap.position
