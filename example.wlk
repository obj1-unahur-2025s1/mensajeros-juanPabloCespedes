object roberto {
  var acoplados = 1 
  var vehiculo = camion
  method pesoDeMensajero() = 10
  method puedeLlamar() = false
  method esVehiculo() = vehiculo
  method puedeLlevarPaqueteADestino(paquete) {
      return paquete.destino().puedePasar(self) and paquete.estaPago()     
  }
  
  method peso(){
    if(self.esVehiculo() == camion ){
        return self.pesoDeMensajero() + self.esVehiculo().peso() + acoplados * 500
    }
    else{
        return peso + 5 
    }
  }
}
object chuckNorris {
    
  method puedeLlevarPaqueteADestino(paquete) {
      return paquete.destino().puedePasar(self) and paquete.estaPago()     
  }
  method pesoDeMensajero()= 80
  method puedeLlamar() = true   
}
object juan {
    
  method puedeLlevarPaqueteADestino(paquete) {
      return paquete.destino().puedePasar(self) and paquete.estaPago()     
  }
  method pesoDeMensajero()= 65
  method puedeLlamar() = true   
}
object neo {
   var credito = 10 
   method pesoDeMensajero() = 0
   method puedeLlamar(){
      return credito > 0
   }

   method puedeLlevarPaqueteADestino(paquete) {
      return paquete.destino().puedePasar(self) and paquete.estaPago()     
  }
}


object puenteDeBrooklyn {
  method puedePasar(persona) {
      return persona.peso() < 1000   
  }
}
object laMatrix {
  method puedePasar(persona) {
      return persona.puedeLlamar() 
  }
}
object camion {
  method peso() {
    return 100
  }
}
object paquete1 {
  method estaPago() = true 
}

object paquete2 {
  method estaPago() = false 
}
object empresaDeMensajeria {
    var conjuntoDeMensajeros = []
    var paquetesPendientes = []
    method facturacionDeLaEmpresa() = 0 
    method contratarAMensajero(mensajero) {
        conjuntoDeMensajeros.add(mensajero)
    }
    method despedirMensajero(mensajero) {
        conjuntoDeMensajeros.remove(mensajero)
    }
    method despedirATodosLosMensajeros() {
        conjuntoDeMensajeros.clear()
    }
    method esGrandeLaMensajeria() {
        return conjuntoDeMensajeros.size() > 2
    }
    method puedeEntregarPaqueteElPrimerMensajero(paquete) {
        return conjuntoDeMensajeros.first().puedeLlevarPaqueteADestino(paquete)
    }
    method saberPesoDelUltimoMensajero() {
        conjuntoDeMensajeros.last().peso()
    }
    method puedeEntregarPaquete(paquete){
      return conjuntoDeMensajeros.any({e=>e.puedeLlevarPaqueteADestino(paquete)})
    }
    method mensajerosQuePuedenEntregarPaquete(paquete) {
        return conjuntoDeMensajeros.map({e=>e.puedeLlevarPaqueteADestino(paquete)})
    }
    method tieneSobrePesoLaMensajeria(){
      return conjuntoDeMensajeros.sum().pesoDeMensajero() > 500 
    }
    method enviarPaquete(paquete) {
        if (self.puedeEntregarPaquete(paquete)){
          self.facturacionDeLaEmpresa() + paquete.precio()
        }
        else{
          paquetesPendientes.add(paquete)
        }
    }
    method enviarTodosLosPaquetes(conjuntoDePaquetesAEnviar) {
      conjuntoDePaquetesAEnviar.forEach({e=>e.enviarPaquete(e)})    
    }
    method encontrarPaquetePendienteMasCaro(){
      var paqueteMaximo = paquetesPendientes.max({e=>e.precio()})
      if(self.puedeEntregarPaquete(paqueteMaximo)){
        self.enviarPaquete(paqueteMaximo)
        paquetesPendientes.remove(paqueteMaximo)
      }
    }

}
object paquetito {
    method  destino() {
      return  laMatrix
    }
    method precio() = 0
    method estaPago()= false

}
object paqueteOriginal {
    method precio() = 0
    method estaPago()= true
    method destino() {
      return puenteDeBrooklyn
    }
}
object paqueteGrande {
    method precio() = 1000
    method estaPago()= true

}
object paquetitoVajero {
    method destino()= puenteDeBrooklyn
    method precio() = 200
    method estaPago()= true
    
}