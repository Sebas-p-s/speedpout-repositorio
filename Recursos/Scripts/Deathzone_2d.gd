extends Node2D

var send_oveja_to = Vector2()

func _ready():
	var Deathzones= get_tree().get_nodes_in_group("Deathzone")
	
	for i in range (Deathzones.size()):
		if Deathzones[i].position != position:
			print("El portal con posicion ", position, " ha detectado el otro portal con posicion ", Deathzones[i].position)
			send_oveja_to = Deathzones[i].position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_reset_area_entered(area):
	if area.get_parent().is_in_group("oveja"):
		area.get_parent().position =send_oveja_to
