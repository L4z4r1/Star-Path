extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	_level_zero()
	#set_level(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_level(level):
	level+=1
	var i = 1;
	while i != level and level <= 32:
		get_node(str(i)).visible=true;
		i+=1;

func _level_zero():
	var i = 1;
	while i != 32:
		get_node(str(i)).visible = false;
		i+=1;
