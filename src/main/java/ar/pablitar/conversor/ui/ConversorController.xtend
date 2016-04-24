package ar.pablitar.conversor.ui

import ar.pablitar.conversor.Conversores
import ar.pablitar.conversor.ui.protocol.PedidoConversion
import ar.pablitar.conversor.ui.protocol.RespuestaConversion
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.json.JSONUtils

@Controller
class ConversorController {
	extension JSONUtils = new JSONUtils
	
	@Post("/convertir")
	def convertir(@Body String body) {
		var pedido = body.fromJson(PedidoConversion)
		response.contentType = "application/json"
		val millasDouble = pedido.valor
		responderMillas(millasDouble)
	}
	
	def responderMillas(Double millasDouble) {
		ok(new RespuestaConversion(Conversores.millasAKilometros.convertir(millasDouble)).toJson)
	}
	
	@Get("/convertir/:millas")
	def convertir2() {
		var millasDouble = Double.valueOf(millas)
		response.contentType = "application/json"
		ok(new RespuestaConversion(Conversores.millasAKilometros.convertir(millasDouble)).toJson)
	}
	
	@Get("/convertirConQuery")
	def convertir3(String millas) {
		var millasDouble = Double.valueOf(millas)
		response.contentType = "application/json"
		ok(new RespuestaConversion(Conversores.millasAKilometros.convertir(millasDouble)).toJson)
	}
	
	def static void main(String[] args) {
		XTRest.start(ConversorController, 9000)
	}
	
}