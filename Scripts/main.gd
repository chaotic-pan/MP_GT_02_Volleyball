extends Node2D
signal Start
var start = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start:
		return
	if Input.is_action_pressed("Start"):
		Start.emit()
		$Label.hide()


func onRestart():
	start = false
	$Label.show()
