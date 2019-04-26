extends Panel
# Called when the node enters the scene tree for the first time.

var btn
var label

func _ready():
	btn = get_node("Button")
	btn.connect("pressed", self, "_on_btn_pressed")

func _on_btn_pressed():
	label = get_node("Label")
	label.text = "Changed Label"

# Called every frame. 'delta' is the elapsed time since the previous frame.
var accum = 0

func _process(delta):
	accum += delta
	if label != null:
		label.text = str(accum)
		
#func _physics_process(delta):
#	accum += delta
#	if label != null:
#		label.text = str(accum)