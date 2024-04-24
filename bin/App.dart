import 'dart:io';
import 'Pruebas.dart';
import 'Database.dart';
import 'Usuario.dart';

class App {
static  inicioApp() async {
    int? opcion;
    do{
      stdout.writeln('''Elige una opción
      1 - Registrate
      2 - Iniciar Sesion''');
      String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while(opcion == null || opcion != 1 && opcion !=2);
    switch(opcion){
      case 1:
        crearUsuario();
        break;
      case 2:
        login();
        break;
      
    }
}

  menuLogueado(Usuario usuario) async {
    String? nombre = usuario.nombre;
    int? opcion;
    do {
      stdout.writeln('''Hola, $nombre selecciona una de las siguientes opciones:
        1 - Busqueda de productos
        2 - Lista de la compra
        3 - Ofertas
        4 - Carrito de la compra''');
      opcion = int.tryParse(stdin.readLineSync() ?? 'e');
    } while (opcion == null || opcion != 1 && opcion !=2 && opcion !=3 && opcion !=4);
    
    switch (opcion) {
      case 1:
        busqueda();
        break;
      case 2:
        lista();
        break;
      case 3:
        ofertas();
        break;
      case 4:
        carrito();
        break;
      default:
        inicioApp();
    }
  }

  






 static pedirProducto() {
    stdout.writeln("Escribe el nombre del producto a consultar");
    stdin.readLineSync() ?? "error";
    print (imprimirProducto);

}
  static String listaCompra() {
    stdout.writeln("Escribe el nombre del producto que quieres añadir a la lista");
    return stdin.readLineSync() ?? "error";
}
  static  mostrarOferta() {
   //stdout.writeln("¡Aun no hay ofertas!");
    stdout.writeln("¡3x2 en cereales hasta el miercoles!");
}
  static String consultarCarrito() {
    stdout.writeln("Tu carrito esta vacio");
    return stdin.readLineSync() ?? "error"; // mal
}
 static login() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce tu nombre de usuario');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu constraseña');
    usuario.password = stdin.readLineSync();
    var resultado = await usuario.loginUsuario();
    if(resultado == false){
      stdout.writeln('Tu nombre de usuario o contraseña son incorrectos');
    }
  }
  static crearUsuario() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce un nombre de usuario');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce una constraseña');
    usuario.password = stdin.readLineSync();
    await usuario.insertarUsuario();

  }

  static  busqueda() async {
    String respuesta = pedirProducto();  
      }

  static  lista() async {
    String respuesta = listaCompra();
      }

  static  ofertas() async {
    String respuesta = mostrarOferta();
      }

  static  carrito() async {
    String respuesta = consultarCarrito();
      }


}
    
    imprimirProducto(Producto producto) {
    stdout.writeln("Nombre: ${producto.nombre}");
    stdout.writeln("Precio: ${producto.precio}");
    }