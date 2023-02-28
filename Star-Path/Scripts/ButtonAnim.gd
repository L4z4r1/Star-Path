extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var popupstate = false;

var startpos = self.get_position().x;

export var popup_name = "";
export var button_name = "";
var button;
# Called when the node enters the scene tree for the first time.
func _ready():
	button = get_parent().get_node(button_name);
	print(button_name);
	print(button);
	button.connect("pressed", self, "_button_pressed");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.is_hovered() and self.get_position().x <= startpos + 6:
		# print("-->")
		self.set_position(Vector2(self.get_position().x + 2, self.get_position().y));
	
	elif not self.is_hovered() and self.get_position().x >= startpos:
		# print("<--")
		self.set_position(Vector2(self.get_position().x - 2, self.get_position().y));
	
	if get_parent().get_node(popup_name).visible:
		popupstate = true;
		self.disabled = true;
	else:
		#print("disabled: false");
		popupstate = false;
		self.disabled = false;
	
	#if get_parent().get_node(popup_name).popup_hide():
	#	 get_parent().get_node(popup_name+"/#Anim").play("Slide-out")
	
func _button_pressed():
	self.disabled = true;
	get_parent().get_node(popup_name).show();
	get_parent().get_node(popup_name+"/#Anim").play("Slide-in");
	popupstate = true
