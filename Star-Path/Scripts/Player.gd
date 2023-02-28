extends KinematicBody2D

var speed = 0;
var friction = 0.05;
var acceleration = 0.1;
var velocity = Vector2.ZERO;
var rotation_dir = 0;
var heat = 0.0;
var engine_mode = 0;

func _physics_process(delta):
	var input_velocity = Vector2();
	self.look_at(get_global_mouse_position());
	if Input.is_action_just_pressed("1"):
		engine_mode=1;
		speed=100;
		print(engine_mode)
		get_parent().get_node("Node2D/Camera2D/PlayerUI/HUD/lab_md").text = ">"
	elif Input.is_action_just_pressed("2"):
		speed=200;
		engine_mode=2;
		get_parent().get_node("Node2D/Camera2D/PlayerUI/HUD/lab_md").text = ">>"
	elif Input.is_action_just_pressed("3"):
		speed=300;
		engine_mode=3;
		get_parent().get_node("Node2D/Camera2D/PlayerUI/HUD/lab_md").text = ">>>"
	elif Input.is_action_just_pressed("4"):
		speed=400;
		engine_mode=4;
		get_parent().get_node("Node2D/Camera2D/PlayerUI/HUD/lab_md").text = ">>>>"
	elif Input.is_action_just_pressed("5"):
		speed=500;
		engine_mode=5;
		get_parent().get_node("Node2D/Camera2D/PlayerUI/HUD/lab_md").text = ">>>>>"
	elif Input.is_action_just_pressed("6"):
		speed=600;
		engine_mode=6;
		get_parent().get_node("Node2D/Camera2D/PlayerUI/HUD/lab_md").text = ">>>>>>"
	elif Input.is_action_just_pressed("0"):
		engine_mode=0;
		speed=0;
		get_parent().get_node("Node2D/Camera2D/PlayerUI/HUD/lab_md").text = " -- "
	
	if Input.is_action_pressed("ui_left"):
		input_velocity.x -= 1
	if Input.is_action_pressed("DOWN"):
		input_velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed("UP"):
		input_velocity = Vector2(speed, 0).rotated(rotation)
		
	#velocity = Vector2(-speed, 0).rotated(rotation)
	input_velocity = input_velocity.normalized() * speed;

	# If there's input, accelerate to the input velocity
	if input_velocity.length() > 0:
		velocity = velocity.linear_interpolate(input_velocity, acceleration);
	else:
		# If there's no input, slow down to (0, 0)
		velocity = velocity.linear_interpolate(Vector2.ZERO, friction);
	velocity = move_and_slide(velocity);
	
	add_heat()
	#velocity = move_and_slide(input_velocity);

func add_heat():
	if not heat >= 32:
		heat = heat + float(engine_mode) / 1000.0
	get_parent().get_node("Node2D/Camera2D/PlayerUI/HUD/AsciiDisplay").set_level(int(heat))
	print(heat)
