package view

import domain.Contacto
import modelo.AgendaModel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.commons.model.utils.ObservableUtils

class AgendaWindow extends SimpleWindow<AgendaModel> {

	new(WindowOwner parent, AgendaModel model) {
		super(parent, model)
	}

	override protected addActions(Panel actionsPanel) {
		// throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override protected createFormPanel(Panel mainPanel) {
		this.title = "Contactos"

		mainPanel.layout = new HorizontalLayout
		var panelContactos = new Panel(mainPanel)
		crearPanelContactos(panelContactos)
		var panelAgregarContactos = new Panel(mainPanel)
		panelAgregarContactos.layout = new ColumnLayout(2)

		crearPanelAgregarContacto(panelAgregarContactos)
	}

	def crearPanelAgregarContacto(Panel panel) {
//		var panelTitulo = new Panel(panel)
//		panelTitulo.layout = new HorizontalLayout
//		new Label(panelTitulo) => [
//			text = "Agregar Contacto"
//			fontSize = 10
//		]
		new Label(panel) => [
			text = "Agregar Contacto"
			fontSize = 10
		]
		new Label(panel)

		new Label(panel) => [
			text = "Nombre y Apellido:"
		]
		new TextBox(panel) => [
			width = 150
			//value <=> "nuevoContacto.nombreApellido"
			value <=> "nombre"
		]

		new Label(panel) => [
			text = "Teléfono:"
		]
		new TextBox(panel) => [
			width = 150
			//value <=> "nuevoContacto.telefono"
			value <=> "telefono"
		]

		new Label(panel) => [
			text = "Email:"
		]
		new TextBox(panel) => [
			width = 150
			//value <=> "nuevoContacto.email"
			value <=> "email"
		]
		new Button(panel) => [
			enabled <=> "habilitarAgregar"
			width = 150
			caption = "AGREGAR"
			onClick[modelObject.agregarContacto()]
		]
//		var panelBotones = new Panel(panel)
//		panelBotones.layout = new HorizontalLayout
//		new Button(panelBotones) => [
//			width = 150
//			caption = "AGREGAR"
//		]
	}

	def crearPanelContactos(Panel panel) {
		new Table(panel, typeof(Contacto)) => [
			numberVisibleRows = 4
			items <=> "contactosAgenda" // Apunta a la lista de "contactos" donde almaceno objetos tipo "Contacto".
			value <=> "contactoSeleccionado" // Guarda el contacto seleccionada.
			new Column(it) => [
				title = "NOMBRE Y APELLIDO"
				fixedSize = 150
				bindContentsToProperty("nombreApellido")
			]

			new Column(it) => [ // Uso de TRANSFORMER para cambiar booleano a texto.
				title = "FAVORITO"
				fixedSize = 150
				bindContentsToProperty("favorito").transformer = [Boolean favorito|if(favorito) "SI" else "NO"]
			]
		]
		new Button(panel) => [
			width = 100
			caption = "FAVORITO"
			onClick[modelObject.editarEstadoContacto()] // Cambia estado de la tarea.
			bindEnabledToProperty("habilitarFavorito") // desactiva o activa boton
		]
		
		new Button(panel) => [
			width = 150
			caption = "EDITAR"
			onClick[new EditarContactoWindow(this, modelObject.contactoSeleccionado) => [open]]
			bindEnabledToProperty("habilitarFavorito")
			ObservableUtils.firePropertyChanged(this, "contactosAgenda")
		]
	}

}
