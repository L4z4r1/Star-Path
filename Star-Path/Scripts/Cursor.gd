extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.set_position(get_viewport().get_mouse_position());
	self.rotate(0.02);
	if Input.is_action_just_pressed("mouseL"):
		$CurAnim.play("Lclick");
	elif Input.is_action_just_released("mouseL"):
		$CurAnim.play("RESET");
	elif Input.is_action_just_pressed("mouseR"):
		$CurAnim.play("Rclick");
	elif Input.is_action_just_released("mouseR"):
		$CurAnim.play("RESET");
