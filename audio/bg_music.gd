# BackgroundMusicManager.gd
extends Node

@export var music_player: AudioStreamPlayer2D
@export var songs: Array[AudioStream] = []

func _ready():
	if songs.size() > 0:
		play_random_song()

func play_random_song():
	var random_index = randi() % songs.size()
	music_player.stream = songs[random_index]
	music_player.play()
	music_player.connect("finished", Callable(self, "_on_music_finished"))

func _on_music_finished():
	music_player.disconnect("finished", Callable(self, "_on_music_finished"))
	play_random_song()
