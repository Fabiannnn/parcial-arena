package runnable

import org.uqbar.arena.Application
import bootstrap.Bootstrap
import domain.Agenda
import view.AgendaWindow
import modelo.AgendaModel

class AgendaContactosApp extends Application {

	new(Agenda agenda) {
	}

	def static void main(String[] args) {
		new AgendaContactosApp(Bootstrap.getAgenda()).start
	}

	override protected createMainWindow() {
		new AgendaWindow(this, new AgendaModel)
	}
}
