extends Node2D

@onready var top_snap = $TopSnap
@onready var bottom_snap = $BottomSnap
@onready var feet_snap = $FeetSnap


func AttachTop(top: Node2D):
	top.position = $TopSnap.position

func AttachBottom(bottom: Node2D):
	bottom.position = $BottomSnap.position

func AttachFeet(feet: Node2D):
	feet.position = $FeetSnap.position
