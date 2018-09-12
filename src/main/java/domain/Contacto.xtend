package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Contacto {
	
	String nombreApellido=""
	String email=""
	String telefono=""
	boolean favorito = false
	
	def toggleFavorito() {
		favorito = !favorito
	}
	
}