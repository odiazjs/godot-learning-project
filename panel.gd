extends Panel
# Called when the node enters the scene tree for the first time.
func _ready():
	var btn = get_node("Button")
	btn.connect("pressed", self, "_on_btn_pressed")

func _on_btn_pressed():
	var label = get_node("Label")
	label.text = "Changed Label"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
