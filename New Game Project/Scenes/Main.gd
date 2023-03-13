extends Node2D
onready var game_over: AudioStreamPlayer = $GameOver
onready var sound_meteor_destoryed: AudioStreamPlayer = $SoundMeteorDestoryed


var meteor1 = preload("res://Scenes/Meteor1.tscn")
var meteor2 = preload("res://Scenes/Meteor2.tscn")
var meteor3 = preload("res://Scenes/Meteor3.tscn")

var arrMeteors = [meteor1, meteor2, meteor3]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("gameOver", self, "gameOver")
	Global.connect("meteorDestroyed", self, "meteorDestroyed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_SpawnTimer_timeout() -> void:
	var m = arrMeteors[randi()%3].instance()
	m.start()
	get_parent().add_child(m)

func gameOver():
	game_over.play()

func meteorDestroyed():
	Global.playerScore += 1
	sound_meteor_destoryed.play()
	print(Global.playerScore)
