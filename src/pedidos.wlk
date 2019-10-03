class Pedido{
	var property distanciaARecorrer
	var property tiempoMaximo
	var property cantidadPasajeros
	var property coloresIncompatibles
	
	method velocidadRequerida(){
		return distanciaARecorrer / tiempoMaximo
	}
	method puedeSerSatisfechoPorAlguno(flota){
		return flota.any({f => self.puedeSerSatisfecho(f)})
	}
	method puedeSerSatisfecho(auto){
		return 	self.satisfaceVelocidad(auto) and 
				self.satisfaceCapacidad(auto) and
				self.satisfaceColor(auto)
	}
	method satisfaceVelocidad(auto){
		return auto.velocidad() >= self.velocidadRequerida() + 10
	}
	method satisfaceCapacidad(auto){
		return auto.capacidad() >= cantidadPasajeros
	}
	method satisfaceColor(auto){
		return not coloresIncompatibles.contains(auto.color())
	}
	method acelerar(){
		tiempoMaximo -= 1
	}
	method relajar(){
		tiempoMaximo += 1
	}
	method esColorCompatible(color){
		return not coloresIncompatibles.contains(color)
	}
}
