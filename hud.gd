extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()


func show_game_over():
	show_message("Perdiste :(")
	await $MessageTimer.timeout
	$MessageLabel.text = "Juego Godot"
	$MessageLabel.show()
	await get_tree().create_timer(1).timeout
	$StartButton.text = "Iniciar"
	$StartButton.show()


func update_score(score):
	$ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	start_game.emit()


func _on_MessageTimer_timeout():
	$MessageLabel.hide()
