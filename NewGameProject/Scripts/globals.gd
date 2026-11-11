extends Node

@onready var chara = preload("res://Scenes/characters.tscn")
@onready var text = preload("res://Scenes/textbox.tscn")

var current_dialogue = [
	"",
]

var char_count = 0

var leftchar_moved = false
var midchar_moved = false
var rightchar_moved = false
var nameplate_moved = false

var leftchar_onscreen = false
var midchar_onscreen = false
var rightchar_onscreen = false

var leftchar_expression = ""
var midchar_expression = ""
var rightchar_expression = ""
var expression_changed = false

var current_speaker = ""

func change_current_speaker(param):
	current_speaker = param["current speaker"]

func char_enter(instance, pos: String, dir: String):
	if pos == "left" and leftchar_onscreen == false:
		instance.leftchar_anim.play(pos + "_char_slideon" + dir)
		await instance.leftchar_anim.animation_finished
		leftchar_onscreen = true
	elif pos == "mid" and midchar_onscreen == false:
		instance.midchar_anim.play(pos + "_char_slideon" + dir)
		await instance.midchar_anim.animation_finished
		midchar_onscreen = true
	elif pos == "right" and rightchar_onscreen == false:
		instance.rightchar_anim.play(pos + "_char_slideon" + dir)
		await instance.rightchar_anim.animation_finished
		rightchar_onscreen = true

func char_exit(instance, pos: String, dir: String):
	if pos == "left" and leftchar_onscreen == true:
		instance.leftchar_anim.play(pos + "_char_slideoff" + dir)
		await instance.leftchar_anim.animation_finished
		leftchar_onscreen = false
	elif pos == "mid" and midchar_onscreen == true:
		instance.midchar_anim.play(pos + "_char_slideoff" + dir)
		await instance.midchar_anim.animation_finished
		midchar_onscreen = false
	elif pos == "right" and rightchar_onscreen == true:
		instance.rightchar_anim.play(pos + "_char_slideoff" + dir)
		await instance.rightchar_anim.animation_finished
		rightchar_onscreen = false

func char_move(instance, pos: String, dir: String):
	if pos == "left" and leftchar_onscreen == true and leftchar_moved == false:
		instance.leftchar_anim.play(pos + "_char_move" + dir)
		await instance.leftchar_anim.animation_finished
		leftchar_moved = true
	elif pos == "mid" and midchar_onscreen == true and midchar_moved == false:
		instance.midchar_anim.play(pos + "_char_move" + dir)
		await instance.midchar_anim.animation_finished
		midchar_moved = true
	elif pos == "right" and rightchar_onscreen == true and rightchar_moved == false:
		instance.rightchar_anim.play(pos + "_char_move" + dir)
		await instance.rightchar_anim.animation_finished
		rightchar_moved = true

func change_expression(pos: String, express: String):
	if pos == "left":
		leftchar_expression = express
	elif pos == "mid":
		midchar_expression = express
	elif pos == "right":
		rightchar_expression = express

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
