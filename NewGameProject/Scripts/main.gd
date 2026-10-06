extends Node2D

const textbox = preload("res://Scenes/textbox.tscn")

var textbox_instance = textbox.instantiate()

func add_textbox():
	add_child(textbox_instance)

func set_dialogue(param):
	Globals.current_dialogue = param
	add_textbox()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_dialogue(Dialogue.opening_text)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
