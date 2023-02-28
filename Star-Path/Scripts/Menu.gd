extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$BG/AnimationPlayer.play_backwards("RESET");
	$Main/MenuAnim.playback_speed = 2;
	$NewGame/NGAnim.playback_speed = 2;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cgButton_pressed():
	$Main/NewGamePopup.hide();
	$BG/AnimationPlayer.play_backwards("Shift");
	$Main/MenuAnim.play("Slide-out");
	#$Main.visible = false;
	$NewGame.visible = true;
	$NewGame/NGAnim.play("Slide-in");


func _on_Cancel_pressed():
	$BG/AnimationPlayer.play("Shift")
	$NewGame/NGAnim.play("Slide-out");
	$Main/MenuAnim.play("Slide-in");
