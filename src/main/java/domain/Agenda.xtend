package domain

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Agenda {

	List<Contacto> contactos = new ArrayList

	def agregarContacto(Contacto contacto) {
		contactos.add(contacto)
	}

}
