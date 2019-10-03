import wollok.game.*

class Corsa {
	var property color
	var position
	method position(){
		return self.Position()
	}
	method velocidad() = 150
	method peso() = 1300
	method capacidad()= 4	
	
}

class Kwid{
	var property tieneTanqueAdicional = false
	
	method color() = "azul"
	method velocidad() = if(not self.tieneTanqueAdicional()) {120} else {110}
	method peso()= if(self.tieneTanqueAdicional()) {1200 + 150} else {1200}
	method capacidad() = if(not self.tieneTanqueAdicional()) {4} else {3}		
	
}

class Especial{
	var property capacidad
	var property velocidad
	var property peso
	var property color
}

object trafic{
	var property interior
	var property motor
	
	method capacidad() = interior.capacidad()
	method peso() = interior.peso() + motor.peso() + 4000 
	method velocidad() = motor.velocidad()
	method color() = "blanco"
}

object interiorComodo {
	method capacidad()= 5
	method peso() = 700
}

object interiorPopular {
	method capacidad()= 12
	method peso() = 1000
}

object motorPulenta{
	method peso() = 800
	method velocidad() = 130
}

object motorBataton{
	method peso() = 500
	method velocidad() = 80
	
}