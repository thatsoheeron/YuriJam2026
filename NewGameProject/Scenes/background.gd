extends Node2D

@onready var bottom_background = $Bottom_Background
@onready var top_background = $Top_Background

var top_layer = top_background
var bottom_layer = bottom_background

func fade_background():
	var tween = create_tween()
	tween.tween_property(top_background, "modulate", Color(100, 100, 100, 0), 3)
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
