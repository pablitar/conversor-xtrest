package ar.pablitar.conversor.ui.protocol

import org.eclipse.xtend.lib.annotations.Accessors

class RespuestaConversion {
	
	@Accessors
	Double resultado
	
	new(Double resultado) {
		this.resultado = resultado
	}
}