#labcoco 2017 contosdeifa
extends KinematicBody2D

# This is a simple collision demo showing how
# the kinematic controller works.
# move() will allow to move the node, and will
# always move it to a non-colliding spot,
# as long as it starts from a non-colliding spot too.
onready var rayD = get_node("RayChao1")
onready var rayE = get_node("RayChao")
onready var sprite = get_node("spriteOya")
# Member variables
const GRAVITY = 500.0 # Pixels/second


# Angle in degrees towards either side that the player can consider "floor"
const FLOOR_ANGLE_TOLERANCE = 40
const WALK_FORCE = 600
const WALK_MIN_SPEED = 10
const WALK_MAX_SPEED = 400
const STOP_FORCE = 1300
const JUMP_SPEED = 400
const JUMP_MAX_AIRBORNE_TIME = 0.2

const SLIDE_STOP_VELOCITY = 1.0 # One pixel per second
const SLIDE_STOP_MIN_TRAVEL = 1.0 # One pixel
signal ameixa
signal acaraje
signal manga
signal maca
var velocity = Vector2()
var on_air_time = 100
var jumping = false
var score_curent = 0
var score_best = 0
var prev_jump_pressed = false
var animacao = ""
var nova_anim = ""
var bLeft
var bRight
var bUp
var vivo = true
signal morreu
enum {VIVO, MORTO}
var status = VIVO



func _fixed_process(delta):
		movimenta(delta)
	

	
	
func movimenta(delta):
	move(Vector2(0, 0) * delta)
	set_z(5)
	# Create forces
	var force = Vector2(0, GRAVITY)
	
	var move_left = (Input.is_action_pressed("move_left") or bLeft) and vivo
	var move_right = (Input.is_action_pressed("move_right") or bRight) and vivo
	var jump = (Input.is_action_pressed("jump") or bUp ) and vivo
	#var dash = Input.is_action_pressed("down") and vivo
	var stop = true

	
	if (move_left):
		if (velocity.x <= WALK_MIN_SPEED and velocity.x > -WALK_MAX_SPEED):
			force.x -= WALK_FORCE
			stop = false
	elif (move_right):
		if (velocity.x >= -WALK_MIN_SPEED and velocity.x < WALK_MAX_SPEED):
			force.x += WALK_FORCE
			stop = false
	
	if (stop):
		var vsign = sign(velocity.x)
		var vlen = abs(velocity.x)
		
		vlen -= STOP_FORCE*delta
		if (vlen < 0):
			vlen = 0
		
		velocity.x = vlen*vsign
	
	# Integrate forces to velocity
	velocity += force*delta
	
	# Integrate velocity into motion and move
	var motion = velocity*delta
	
	# Move and consume motion
	motion = move(motion)
	
	var floor_velocity = Vector2()
	
	if (is_colliding()):
		# You can check which tile was collision against with this
		# print(get_collider_metadata())
		
		# Ran against something, is it the floor? Get normal
		var n = get_collision_normal()
		
		if (rad2deg(acos(n.dot(Vector2(0, -1)))) < FLOOR_ANGLE_TOLERANCE):
			# If angle to the "up" vectors is < angle tolerance
			# char is on floor
			on_air_time = 0
			floor_velocity = get_collider_velocity()
		
		if (on_air_time == 0 and force.x == 0 and get_travel().length() < SLIDE_STOP_MIN_TRAVEL and abs(velocity.x) < SLIDE_STOP_VELOCITY and get_collider_velocity() == Vector2()):
			# Since this formula will always slide the character around, 
			# a special case must be considered to to stop it from moving 
			# if standing on an inclined floor. Conditions are:
			# 1) Standing on floor (on_air_time == 0)
			# 2) Did not move more than one pixel (get_travel().length() < SLIDE_STOP_MIN_TRAVEL)
			# 3) Not moving horizontally (abs(velocity.x) < SLIDE_STOP_VELOCITY)
			# 4) Collider is not moving
			
			revert_motion()
			velocity.y = 0.0
		else:
			# For every other case of motion, our motion was interrupted.
			# Try to complete the motion by "sliding" by the normal
			motion = n.slide(motion)
			velocity = n.slide(velocity)
			# Then move again
			move(motion)
	
	if (floor_velocity != Vector2()):
		# If floor moves, move with floor
		move(floor_velocity*delta)
	
	if (jumping and velocity.y > 0):
		# If falling, no longer jumping
		jumping = false
	
	if (on_air_time < JUMP_MAX_AIRBORNE_TIME and jump and not prev_jump_pressed and not jumping):
		
		# Jump must also be allowed to happen if the character left the floor a little bit ago.
		# Makes controls more snappy.
		
		velocity.y = -JUMP_SPEED
		jumping = true
	
	on_air_time += delta
	prev_jump_pressed = jump
	
	var chao = rayE.is_colliding() or rayD.is_colliding() 
	print(chao)
	var andando = move_right or move_left 
	
	
	
	#var rasteira = dash
	if move_right:
			sprite.set_flip_h(false)
	if move_left:
			sprite.set_flip_h(true)
	
	if (move_left or move_right) and chao:
			nova_anim = "MoveOya"
	elif (move_right or move_left) and not chao:
		nova_anim = "parada"
	else:
		nova_anim = "parada"

	
	
	if (velocity.y < 0 or jump):
		nova_anim = "pulando"
	elif ( not chao):
		nova_anim = "caindo"
		
		
	
	
	#if not vivo: return
	
	if get_pos().y > 400: morrer()
	
		
	
	
				
		
	
	
				
	
	if animacao != nova_anim:
		get_node("anim").play(nova_anim)
		animacao = nova_anim
			#if jump:
			#	nova_anim = "pulando"
			#else:
			#	nova_anim = "MoveOya"

				
	
		

	


	

	
func _ready():
	set_fixed_process(true)
	set_process_input(true)



func _on_corpo_body_enter( body ):
	if not vivo: return
	morrer()
	print("morreu")
	
func morrer():
	if not vivo: return
	vivo = false
	velocity.y = -300
	velocity.x = -300
	get_node("shape").set_trigger(true)
	emit_signal("morreu")
	


func _on_touchLeft_pressed():
	bLeft = true



func _on_touchLeft_released():
	bLeft = false 


func _on_touchRight_pressed():
	bRight = true 


func _on_touchRight_released():
	bRight = false


func _on_touchUp_pressed():
	bUp = true


func _on_touchUp_released():
	bUp = false
	
func reviver():
	velocity = Vector2(0, 0)
	get_node("shape").set_trigger(false)
	get_node("camera").make_current()
	vivo = true
	
func acaraje():
	emit_signal("acaraje")

func ameixa():
	emit_signal("ameixa")

func manga():
	emit_signal("manga")


func maca():
	emit_signal("maca")
	
