import plantas.*

class Parcela {
	var property largo
	var property ancho
	var property horasDeSolPorDia
	var property plantasQuePosee = []
	var property porcentajeAsoc = 0
	
	method superficie(){
		return largo*ancho
	}
	
	method cantidadMaximaDePlantas(){
		return
		if(ancho > largo){ self.superficie() / 5 }
		else{ self.superficie() / 3 + largo }
	}
	
	method tieneComplicaciones(){
		return
		plantasQuePosee.any({ planta => planta.horasDeSolToleradas() < horasDeSolPorDia})
	}
	
	method plantar(planta){
		if(not self.hayLugarParaPlantar() or not self.toleraSolDelDia(planta)){
			throw new Exception("No se puede plantar.")
		}else{
			plantasQuePosee.add(planta)
		}
	}
	
	method toleraSolDelDia(planta){
		return horasDeSolPorDia - planta.horasDeSolQueTolera() >= 2
	}
	
	method hayLugarParaPlantar(){
		return plantasQuePosee.size() < self.cantidadMaximaDePlantas()
	}
}

class ParcelaEcologica inherits Parcela {
	/*override method tieneComplicaciones(){
		return false
	}
	
	override method superficie(){
		return 10
	}
	
	override method horasDeSolPorDia(planta){
		horasDeSolPorDia = planta.horasDeSolToleradas()
	}
	
	override method plantasQuePosee(){
		return plantasQuePosee.map({planta => planta.altura() == 1.4})
	}
	
	override method cantidadMaximaDePlantas(){
		return 1
	}*/
}

class ParcelaIndustrial inherits Parcela {
	method cantidadDePlantasQuePosee(){
		return plantasQuePosee.size() <= 2
	}
}

object inta{
	var property listaDeParcelas = []
	var cantidadPlantas
		
	method promedioDePlantas(){
		return self.cantidadDePlantas() / self.cantidadDeParcelas()
	}
	
	method cantidadDePlantas(){
		return
		listaDeParcelas.forEach({ parcela => cantidadPlantas += parcela.plantasQuePosee().size()})
	}
	
	method cantidadDeParcelas(){
		return listaDeParcelas.size()
	}
	
	method parcelaMasAutosustentable(){
		return self.parcelaConMayorPorcentajeBienAsoc()
	}
	
	method parcelaConMayorPorcentajeBienAsoc(){
		listaDeParcelas.filter({parcela => parcela.plantasQuePosee().size() > 4})
		return
		listaDeParcelas.max({ parcela => parcela.porcentajeAsoc()})
	}
}