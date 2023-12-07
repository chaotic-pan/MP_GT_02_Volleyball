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
	if body.name.contains("floor2"):
		P2Hit.emit()
	if body.name.contains("Player"):
		linear_velocity*=Vector2(1.5,1.5)
