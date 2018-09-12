package bootstrap

import domain.Agenda
import domain.Contacto

class Bootstrap {
	
	static def getAgenda() {
		
		var agenda = new Agenda
		
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Rick Grimes"
			email = "rick@hotmail.com"
			telefono = "1523467980"
		])
		
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Walter White"
			email = "wally@gmail.com"
			telefono = "1523467981"
			favorito = true
		])
		
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Barry Allen"
			email = "barry@yahoo.com"
			telefono = "1523467983"
		])
		
		return agenda
	}
	
}