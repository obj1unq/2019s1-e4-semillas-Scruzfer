class Planta {
	const property anioDeObtencion
	const property altura
	var property horasDeSolToleradas
	var property esFuerte = false
	var property daSemillas = false
	var property espacioQueOcupa = 0
	
	method esFuerte(){
		if(horasDeSolToleradas > 10) {esFuerte = true}
		return esFuerte
	}
	
	method daNuevasSemillas(){ return esFuerte or self.cumpleCondicion()}
	
	method cumpleCondicion()
	
	method seAsociaBienA(parcela){}
}

class Menta inherits Planta {
	
	override method cumpleCondicion(){
		if(altura>0.4){ daSemillas = true }
		return daSemillas
	}
	
	override method espacioQueOcupa(){
		espacioQueOcupa = altura*3
		return espacioQueOcupa
	}
	
	method esParcelaIdeal(parcela){
		return parcela.superficie() > 6
	}
	
	override method seAsociaBienA(parcela){
		
	}
}

class Soja inherits Planta {
	
	override method cumpleCondicion(){
		return anioDeObtencion > new Date(1,1,2007) and altura > 1
	}
	
	override method espacioQueOcupa(){
		espacioQueOcupa = altura / 2
	}
	
	method esParcelaIdeal(parcela){
		return parcela.horasDeSolPorDia() == self.horasDeSolToleradas()
	}
}

class Quinoa inherits Planta {
	
	 override method espacioQueOcupa(){
	 	espacioQueOcupa = 0.5
	 }
	 
	 override method cumpleCondicion(){
	 	return anioDeObtencion < new Date(1,1,2005)
	 }
	 
	 method esParcelaIdeal(parcela){
	 	return not
	 	parcela.plantasQuePosee().any({ planta => planta.altura() > 1.5 })
	 }
}

class SojaTransgenica inherits Soja{
	override method cumpleCondicion(){
		return false
	}
	
	override method esParcelaIdeal(parcela){
		return parcela.cantidadMaximaDePlantas() == 1
	}
}

class HierbaBuena inherits Menta{
	override method espacioQueOcupa(){
		espacioQueOcupa = altura*6
		return espacioQueOcupa
	}
}

