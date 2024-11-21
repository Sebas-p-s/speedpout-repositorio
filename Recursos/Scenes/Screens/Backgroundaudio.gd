extends AudioStreamPlayer


func _on_finished():
	self.seek(0)
	self.play()
