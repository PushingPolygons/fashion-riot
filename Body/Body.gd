extends Node2D

# Declarations.
var x = 45
func AttachTop(top: Node2D):
	top.position = $TopSnap.position

func AttachBottom(bottom: Node2D):
	bottom.position = $BottomSnap.position

func AttachFeet(feet: Node2D):
	feet.position = $FeetSnap.position
