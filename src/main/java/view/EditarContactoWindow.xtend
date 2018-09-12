package view

import domain.Contacto
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.commons.model.utils.ObservableUtils

class EditarContactoWindow extends TransactionalDialog<Contacto> {
	
	new(WindowOwner owner, Contacto model) {
		super(owner, model)
	}

	override protected createFormPanel(Panel mainPanel) {

		mainPanel.layout = new ColumnLayout(2)

		new Label(mainPanel) => [
			text = "Agregar Contacto"
			fontSize = 10
		]
		new Label(mainPanel)

		new Label(mainPanel) => [
			text = "Nombre y Apellido:"
		]
		new TextBox(mainPanel) => [
			width = 150
			// value <=> "nuevoContacto.nombreApellido"
			value <=> "nombreApellido"
		]

		new Label(mainPanel) => [
			text = "Teléfono:"
		]
		new TextBox(mainPanel) => [
			width = 150
			// value <=> "nuevoContacto.telefono"
			value <=> "telefono"
		]

		new Label(mainPanel) => [
			text = "Email:"
		]
		new TextBox(mainPanel) => [
			width = 150
			// value <=> "nuevoContacto.email"
			value <=> "email"
		]
	}

	override protected void addActions(Panel actions) { // BOTONES POR DEFECTO DE PANEL
		new Button(actions) => [
			alignCenter
			caption = "ACEPTAR"
			onClick [|this.accept]
//			setAsDefault // En un botón hace que se accione cuando presionas enter en el cuadro de dialogo.
//			disableOnError
//			bindEnabledToProperty("enable") // Activa/desactiva botón.
		]

	}
}
