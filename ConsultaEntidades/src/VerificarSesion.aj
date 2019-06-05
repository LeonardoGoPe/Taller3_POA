public aspect VerificarSesion {	
    //Definir el pointcut, es decir, el punto donde ocurrir� la llamada al inicio de sesi�n.
    pointcut inicioSesion(): call(void Entidad.consultar(String)); 
    
    before() : inicioSesion() {
    	//Si no se ha inicio sesion, se obliga a iniciar
        if(!IniciarSesion.sesionIniciada && !Entidad.mensaje.isVisible()) {
        	IniciarSesion.initialize();
        }else if(IniciarSesion.sesionIniciada && !Entidad.mensaje.isVisible()) {
        	Entidad.mensaje.setVisible(true);
        }
    } 
    after() : inicioSesion()  {
        //Ya se inici� sesi�n
		if(IniciarSesion.sesionIniciada) {
			System.out.println("Bienvenido");
			System.out.println("Consultando...");
			Entidad.mensaje.setVisible(true);
		}else {
			System.out.println("Inicie Sesion por favor");
		}
    }  
}  
