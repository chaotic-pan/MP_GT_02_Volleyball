extends RigidBody2D
signal P1Hit
signal P2Hit


# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	max_contacts_reported = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name.contains("floor1"):
		P1Hit.emit()
		printerr("1")
	if body.name.contains("floor2"):
		P2Hit.emit()
		printerr("2")
