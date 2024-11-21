extends CanvasLayer

@onready var menu : Node2D = $menu

var time= 0.0
var star = true


# Called when the node enters the scene tree for the first time.
func _ready():
	inicia_sliders()
	menu.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if star:
		time += delta
		$Label.text = "Tiempo" + " " + str ("%.2f" % time)

func _on_area_2d_body_entered(body):
	if body.is_in_group("oveja"):
		star = false

func inicia_sliders():
	for slider in menu.get_children():
		if slider is HSlider:
			slider.value = 100


func _on_button_pressed():
	get_tree().paused = true
	menu.visible = get_tree().paused


func _on_continuar_pressed():
	get_tree().paused = false
	menu.visible = get_tree().paused

func _on_reinicio_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false


func _on_salir_pressed():
	get_tree().quit()


func _on_musicaslider_value_changed(value):
	AudioServer.set_bus_volume_db(1, value - 100)


func _on_sonidoslider_value_changed(value):
	AudioServer.set_bus_volume_db(2, value - 100)
