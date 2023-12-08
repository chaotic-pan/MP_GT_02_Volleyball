extends RigidBody2D
signal P1Hit
signal P2Hit
enum BallType {SLOW, BIG, BOUNCE}
@export var type = BallType.SLOW

# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	max_contacts_reported = 1
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name.contains("floor1"):
		P1Hit.emit()
	if body.name.contains("floor2"):
		P2Hit.emit()
	if body.name.contains("Player"):
		linear_velocity*=Vector2(1.25,1.25)

