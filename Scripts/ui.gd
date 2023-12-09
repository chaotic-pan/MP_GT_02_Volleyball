extends Node2D
var P1=0
var P2=0
signal Restart
signal Win(player)

func _ready():
	P1=0
	P2=0
	$Sprite2D1/Label1.text = str(P1)
	$Sprite2D2/Label2.text = str(P2)

func P1Hit():
	P2+=1
	reset()

func P2Hit():
	P1+=1
	reset()

func reset():
	$Sprite2D1/Label1.text = str(P1)
	$Sprite2D2/Label2.text = str(P2)
	if P1>=12:
		emit_signal("Win",1)
	elif P2>=12:
		emit_signal("Win",2)
	else:
		Restart.emit()
