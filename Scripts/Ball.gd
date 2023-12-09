extends RigidBody2D
signal P1Hit
signal P2Hit
enum BallType {SLOW, BIG, BOUNCE}
@export var type = BallType.SLOW
var reset = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	max_contacts_reported = 1
	position = Vector2(352,192)
	freeze = true
	match type:
		BallType.SLOW: 
			$Sprite2D.scale = Vector2(0.14,0.14)
			$CollisionShape2D.scale = Vector2(1,1)
			physics_material_override.bounce=0.5
			gravity_scale=0.2
		BallType.BIG: 
			$Sprite2D.scale = Vector2(0.21,0.21)
			$CollisionShape2D.scale = Vector2(1.5,1.5)
			physics_material_override.bounce=0.5
			gravity_scale=0.5
		BallType.BOUNCE: 
			$Sprite2D.scale = Vector2(0.14,0.14)
			$CollisionShape2D.scale = Vector2(1,1)
			physics_material_override.bounce=1
			gravity_scale=0.5

func _integrate_forces(state):
	# setting the position of rigid bodies is fucked up
	match reset:	
		0:
			return
		1:
			state.transform = Transform2D(0.0, Vector2(768,192))
		2:
			state.transform = Transform2D(0.0, Vector2(352,192))
	set_deferred("linear_velocity",Vector2(0,0))
	linear_velocity = Vector2(0,0)
	reset = 0

func onStart():
	freeze = false


func _on_body_entered(body):
	if freeze:
		return
	if body.name.contains("floor"):
		set_deferred("freeze",true)
		if body.name.contains("floor1"):
			reset = 1	
			P1Hit.emit()
		if body.name.contains("floor2"):
			reset = 2	
			P2Hit.emit()
	if body.name.contains("Player"):
		linear_velocity*=Vector2(1.25,1.25)

