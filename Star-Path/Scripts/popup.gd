extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"#Anim".playback_speed = 2;
	
	var b_exit = $"#Exit";
	b_exit.connect("pressed", self, "_exit_pressed");
	var a_anim = $"#Anim";
	a_anim.connect("animation_finished", self, "_animation_finishedplaying");

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _exit_pressed():
	#print("pressed!");
	$"#Anim".play("Slide-out");

func _animation_finishedplaying(anim_name):
	if anim_name == "Slide-out":
		#print("finished playing the animation");
		self.visible = false;
