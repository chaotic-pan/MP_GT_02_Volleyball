extends CharacterBody2D

@export var speed =  800
@export var fall_acceleration = 75
@export var player = 1
var p
var screen_size
var jump
var jumpTimer
var start

# Called when the node enters the scene tree for the first time.
func _ready():
	start = false
	jumpTimer = 0
	screen_size = get_viewport_rect().size
	match player:
		1: 
			startPos(Vector2(230,530))
			p="P1"
		2: 
			startPos(Vector2(900,530))
			p="P2"
	$AnimatedSprite2D.play(p+"_stand")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed(p+"_right"):
		velocity.x += 1
	if Input.is_action_pressed(p+"_left"):
		velocity.x -= 1
	if Input.is_action_pressed(p+"_jump"):
		if !jump:
			jump = true
			jumpTimer = 0.5
		elif jumpTimer >0:
			velocity.y -= 1
		$AnimatedSprite2D.play(p+"_ball")
	if jumpTimer <=0 || !Input.is_action_pressed(p+"_jump"):
		if !is_on_floor():
			velocity.y += 1
		else:
			jump=false
			$AnimatedSprite2D.play(p+"_stand")
	
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	if !start:
		return
	if jump:
		jumpTimer-=delta
	get_input()
	move_and_slide()
	

func startPos(pos):
	position = pos
	show()


func onStart():
	start = true
