extends Node2D

const textbox = preload("res://Scenes/textbox.tscn")
const characters = preload("res://Scenes/characters.tscn")

var characters_on = false

var textbox_instance = textbox.instantiate()
var characters_instance = characters.instantiate()

func add_textbox():
	add_child(textbox_instance)

func add_characters():
	add_child(characters_instance)

func set_dialogue(param):
	Globals.current_dialogue = param
	add_textbox()

func chars_enter(number: int,
	char1_pos: String,
	char2_pos: String,
	char1_emotion: String, 
	char2_emotion: String, 
	char3_emotion: String,
	direction: String):
	
	characters_on = true
	
	if number == 1:
		characters_instance.one_char_anim(char1_pos, char1_emotion, "on", direction)
	elif number == 2:
		characters_instance.two_chars_anim(char1_pos, char2_pos, char1_emotion, char2_emotion, "on", direction)
	elif number == 3:
		characters_instance.all_chars_anim(char1_emotion, char2_emotion, char3_emotion, "on", direction)

func chars_exit(number: int,
	char1_pos: String,
	char2_pos: String,
	char1_emotion: String,
	char2_emotion: String,
	char3_emotion: String,
	direction: String):
	
	if number == 1:
		characters_instance.one_char_anim(char1_pos, char1_emotion, "off", direction)
	elif number == 2:
		characters_instance.two_chars_anim(char1_pos, char2_pos, char1_emotion, char2_emotion, "off", direction)
	elif number == 3:
		characters_instance.all_chars_anim(char1_emotion, char2_emotion, char3_emotion, "off", direction)
	characters_on = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_characters()
	chars_enter(1, "mid", "", "happy", "", "", "left")
	set_dialogue(Dialogue.opening_text)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if !is_instance_valid(textbox_instance) and characters_on == true:
		chars_exit(1, "mid", "", "sad", "", "", "left")
