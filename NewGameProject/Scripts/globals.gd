extends Node

@onready var chara = preload("res://Scenes/characters.tscn")
@onready var text = preload("res://Scenes/textbox.tscn")
@onready var background = preload("res://Scenes/background.tscn")

var current_dialogue = [
	"",
]

var char_count = 0

var onechar_moved = false
var twochar_moved = false
var threechar_moved = false
var nameplate_moved = false

var onechar_onscreen = false
var twochar_onscreen = false
var threechar_onscreen = false

var onechar_expression = "neutral"
var twochar_expression = "neutral"
var threechar_expression = "neutral"
var one_expression_changed = false
var two_expression_changed = false
var three_expression_changed = false

var character_flipped = false

var characterone = "one/"
var charactertwo = "two/"
var characterthree = "three/"

var current_speaker = ""

var background_changed = false

func change_current_speaker(param):
	current_speaker = param["current speaker"]

func char_enter(instance, character: String, dir: String, pos: String):
	var animation = dir + "_slideon_" + pos
	if character == "one" and onechar_onscreen == false:
		animation = characterone + animation
		instance.onechar_anim.play(animation)
		await instance.onechar_anim.animation_finished
		onechar_onscreen = true
	elif character == "two" and twochar_onscreen == false:
		animation = charactertwo + animation
		instance.twochar_anim.play(animation)
		await instance.twochar_anim.animation_finished
		twochar_onscreen = true
	elif character == "three" and threechar_onscreen == false:
		animation = characterthree + animation
		instance.threechar_anim.play(animation)
		await instance.threechar_anim.animation_finished
		threechar_onscreen = true

func char_exit(instance, character: String, dir: String, pos: String):
	var animation = dir + "_slideoff_" + pos
	if character == "one" and onechar_onscreen == true:
		animation = characterone + animation
		instance.onechar_anim.play(animation)
		await instance.onechar_anim.animation_finished
		onechar_onscreen = false
	elif character == "two" and twochar_onscreen == true:
		animation = charactertwo + animation
		instance.twochar_anim.play(animation)
		await instance.twochar_anim.animation_finished
		twochar_onscreen = false
	elif character == "three" and threechar_onscreen == true:
		animation = characterthree + animation
		instance.threechar_anim.play(animation)
		await instance.threechar_anim.animation_finished
		threechar_onscreen = false

func char_move(instance, character: String, startpos: String, endpos: String):
	var animation = startpos + "_move_" + endpos
	if character == "one" and onechar_onscreen == true and onechar_moved == false:
		animation = characterone + animation
		instance.onechar_anim.play(animation)
		await instance.onechar_anim.animation_finished
		onechar_moved = true
	elif character == "two" and twochar_onscreen == true and twochar_moved == false:
		animation = charactertwo + animation
		instance.twochar_anim.play(animation)
		await instance.twochar_anim.animation_finished
		twochar_moved = true
	elif character == "three" and threechar_onscreen == true and threechar_moved == false:
		animation = characterthree + animation
		instance.threechar_anim.play(animation)
		await instance.threechar_anim.animation_finished
		threechar_moved = true

func flip_char(instance, character: String):
	instance.flip_char(character)

func assign_background(instance, top, bottom):
	instance.bottom_background.texture = bottom
	instance.top_background.texture = top

func fade_background(instance, preload_next_scene):
	if background_changed == false:
		instance.fade_background(preload_next_scene)
		background_changed = true
	else:
		pass

func change_expression(character: String, express: String):
	if character == "one" and one_expression_changed == false:
		onechar_expression = express
		one_expression_changed = true
	elif character == "two" and two_expression_changed == false:
		twochar_expression = express
		two_expression_changed = true
	elif character == "three" and three_expression_changed == false:
		threechar_expression = express
		three_expression_changed = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
