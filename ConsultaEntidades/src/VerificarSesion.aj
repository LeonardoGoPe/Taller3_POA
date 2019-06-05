public aspect VerificarSesion {	
    //Definir el pointcut, es decir, el punto donde ocurrirá la llamada al inicio de sesión.
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
        //Ya se inició sesión
		if(IniciarSesion.sesionIniciada) {
			System.out.println("Bienvenido");
			System.out.println("Consultando...");
			Entidad.mensaje.setVisible(true);
		}else {
			System.out.println("Inicie Sesion por favor");
		}
    }  
}  
