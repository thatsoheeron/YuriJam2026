extends Node2D

@onready var bottom_background = $Bottom_Background
@onready var top_background = $Top_Background
@onready var background_animation = $AnimationPlayer

var top_layer_visible = true

func fade_background(preload_next_scene):
	if top_layer_visible == true:
		background_animation.play("fadeout_background")
		await background_animation.animation_finished
		top_background.texture = preload_next_scene
	elif top_layer_visible == false:
		background_animation.play("fadein_background")
		await background_animation.animation_finished
		bottom_background.texture = preload_next_scene
	top_layer_visible = !top_layer_visible

#top_background fades to bottom_background
#func fade_background():
#	background_animation.play("fadeout_background")
#	await background_animation.animation_finished
#	reassign_background()
#bottom_background is then reassigned to top_background for next animation
#func reassign_background():
#	background_animation.play("RESET")
#	top_background.texture = bottom_background.texture
#	await background_animation.animation_finished
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
