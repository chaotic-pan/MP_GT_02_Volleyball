extends Node2D
signal Start
var start = false

func _ready():
	$WinLabel.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if start:
		return
	if Input.is_action_pressed("Start"):
		Start.emit()
		$StartLabel.hide()


func onRestart():
	start = false
	$StartLabel.show()


func _on_points_win(player):
	start = true
	$WinLabel.show()
	$WinLabel.text = "Congrats Player "+ str(player) +"!!!"
	if player==1:
		$WinLabel.add_theme_color_override("font_color", Color("#5d90ff"))
	else:
		$WinLabel.add_theme_color_override("font_color", Color("#ff9586"))
	$AnimationPlayer.play("Win")
