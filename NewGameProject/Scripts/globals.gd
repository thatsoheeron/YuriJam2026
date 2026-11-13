extends Node

@onready var chara = preload("res://Scenes/characters.tscn")
@onready var text = preload("res://Scenes/textbox.tscn")

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
var expression_changed = false

var current_speaker = ""

func change_current_speaker(param):
	current_speaker = param["current speaker"]

func char_enter(instance, character: String, dir: String, pos: String):
	var animation = dir + "_slideon_" + pos
	if character == "one" and onechar_onscreen == false:
		instance.onechar_anim.play(animation)
		await instance.onechar_anim.animation_finished
		onechar_onscreen = true
	elif character == "two" and twochar_onscreen == false:
		instance.twochar_anim.play(animation)
		await instance.twochar_anim.animation_finished
		twochar_onscreen = true
	elif character == "three" and threechar_onscreen == false:
		instance.threechar_anim.play(animation)
		await instance.threechar_anim.animation_finished
		threechar_onscreen = true

func char_exit(instance, character: String, dir: String, pos: String):
	var animation = dir + "_slideoff_" + pos
	if character == "one" and onechar_onscreen == true:
		instance.onechar_anim.play(animation)
		await instance.onechar_anim.animation_finished
		onechar_onscreen = false
	elif character == "two" and twochar_onscreen == true:
		instance.twochar_anim.play(animation)
		await instance.twochar_anim.animation_finished
		twochar_onscreen = false
	elif character == "three" and threechar_onscreen == true:
		instance.threechar_anim.play(animation)
		await instance.threechar_anim.animation_finished
		threechar_onscreen = false

func char_move(instance, character: String, dir: String):
	var animation = character + "_char_move" + dir
	if character == "one" and onechar_onscreen == true and onechar_moved == false:
		instance.onechar_anim.play(animation)
		await instance.onechar_anim.animation_finished
		onechar_moved = true
	elif character == "two" and twochar_onscreen == true and twochar_moved == false:
		instance.twochar_anim.play(animation)
		await instance.twochar_anim.animation_finished
		twochar_moved = true
	elif character == "three" and threechar_onscreen == true and threechar_moved == false:
		instance.threechar_anim.play(animation)
		await instance.threechar_anim.animation_finished
		threechar_moved = true

func change_expression(character: String, express: String):
	if character == "one":
		onechar_expression = express
	elif character == "two":
		twochar_expression = express
	elif character == "three":
		threechar_expression = express

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
