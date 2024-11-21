extends CanvasLayer

@onready var area = $Area2D  # Asegúrate de que el nodo Area2D esté correctamente referenciado

var time = Global.speedrun_time
var contando = true  # Controla si el contador está en marcha

func _ready():
	# Conectar la señal de colisión del Area2D
	area.connect("body_entered", self, "_on_area_body_entered")

func _physics_process(delta):
	if contando:
		time = float(time) + delta
		update_ui()

func update_ui():
	# Formatear el tiempo con dos decimales
	var formatted_time = str(time)
	var decimal_index = formatted_time.find(".")
	
	if decimal_index > 0:
		formatted_time = formatted_time.left(decimal_index + 3)  # Tomar solo dos decimales
	
	Global.speedrun_time = formatted_time
	$Label.text = formatted_time

# Esta función se ejecuta cuando un cuerpo entra en el área
func _on_area_body_entered(body):
	if body.is_in_group("oveja"):  # Verifica si el cuerpo es el jugador
		stop_contador()  # Detener el contador

# Función para detener el contador
func stop_contador():
	contando = false
	print("Contador detenido.")


func _on_area_2d_body_entered(body):
	pass # Replace with function body.


func _on_area_2d_area_entered(area):
	pass # Replace with function body.
