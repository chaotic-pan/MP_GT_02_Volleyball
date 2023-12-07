extends Node2D
var P1=0
var P2=0

func _ready():
	P1=0
	P2=0
	$Label1.text = str(P1)
	$Label2.text = str(P2)

func P1Hit():
	P2+=1
	$Label2.text = str(P2)

func P2Hit():
	P1+=1
	$Label1.text = str(P1)
