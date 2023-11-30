extends AnimatedSprite2D

@export var speed =  800
@export var player = 1
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	startPos(Vector2(540,350))	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if player==1:
		if Input.is_action_pressed("P1_right"):
			velocity.x += 1
		if Input.is_action_pressed("P1_left"):
			velocity.x -= 1
		if Input.is_action_pressed("P1_jump"):
			#TODO make character jump
			velocity.x -= 1 # this is wrong
	elif player==2:
		if Input.is_action_pressed("P2_right"):
			velocity.x += 1
		if Input.is_action_pressed("P2_left"):
			velocity.x -= 1
		if Input.is_action_pressed("P2_jump"):
			#TODO make character jump
			velocity.x -= 1 # this is wrong
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity*delta
	position = position.clamp(Vector2.ZERO,screen_size)
	
func startPos(pos):
	position = pos
	show()
