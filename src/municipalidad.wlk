import rodados.*
import pedidos.*

class Dependencia {
	var flota = []
	var pedidos = []
	var property empleados
	
	
	method agregarAFlota(rodado){
		flota.add(rodado)
	}
	method pesoTotalFlota(){
		return flota.sum({rodado => rodado.peso()})
	}
	method tieneTresRodados(){
		return flota.size() >= 3
	}
	method todosVanA100(){
		return flota.all({rodado => rodado.velocidad() >= 100})
	}
	method estaBienEquipada(){
		return self.tieneTresRodados() and self.todosVanA100()
	}
	method rodadosDelColor(color){
		return flota.filter({rodado => rodado.color() == color})
	}
	method capacidadTotalEnColor(color){
		return self.rodadosDelColor(color).sum({rodado => rodado.capacidad()})
	}
	method rodadoMasRapido(){
		return flota.max({rodado => rodado.velocidad()})
	}
	method colorDelRodadoMasRapido(){
		return self.rodadoMasRapido().color()
	}
	method capacidadTotal(){
		return flota.sum({rodado => rodado.capacidad()})
	}
	method capacidadFaltante(){
		return 0.max(empleados - self.capacidadTotal())
	}
	method esGrande(){
		return empleados >= 40 and flota.size() >= 5
	}
	method totalPasajerosEnPedidos(){
		return pedidos.sum({p => p.cantidadPasajeros()})
	}
	method pedidosInsatisfechos(){
		return pedidos.filter({p => not p.puedeSerSatisfechoPorAlguno(flota)})
	}
	method incompatibleConTodos(color){
		return pedidos.all({p => not p.esColorCompatible(color)})
	}
}

