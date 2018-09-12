package modelo

import domain.Contacto
import domain.Agenda
import org.uqbar.commons.model.annotations.Dependencies
import bootstrap.Bootstrap
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@TransactionalAndObservable
class AgendaModel {
	Agenda agenda
	Contacto contactoSeleccionado
	Contacto nuevoContacto = new Contacto()
	/*1. Forma fea. */
	String nombre = ""
	String email = ""
	String telefono = ""

	new() {
		agenda = Bootstrap.getAgenda()
	}

	def getContactosAgenda() {
		return agenda.contactos
	}

	def editarEstadoContacto() { // Para modificar el estado contacto seleccionada.
		contactoSeleccionado.toggleFavorito()
	}

	def agregarContacto() { // Para agregar el contacto.
//		agenda.agregarContacto(nuevoContacto)
//		nuevoContacto = new Contacto()
		/*1. Forma fea */
		nuevoContacto.nombreApellido = nombre
		nuevoContacto.email = email
		nuevoContacto.telefono = telefono
		agenda.agregarContacto(nuevoContacto)
		nuevoContacto = new Contacto()
		ObservableUtils.firePropertyChanged(this, "contactosAgenda")
	}

	@Dependencies("contactoSeleccionado") // Habilita/deshabilita botón FAVORITO".
	def Boolean getHabilitarFavorito() {
		return contactoSeleccionado !== null
	}

	@Dependencies("nombre", "email", "telefono") // Habilita/deshabilita botón AGREGAR".
	def Boolean getHabilitarAgregar() {
		//return nuevoContacto.nombreApellido !== "" && nuevoContacto.telefono !== "" && nuevoContacto.email !== ""
		/*1. Forma fea */
		return nombre !== "" && email !== "" && telefono !== ""
	}
}
