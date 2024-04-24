import 'dart:io';
import 'Usuario.dart';
import 'Pruebas.dart';
class App {
 inicioApp() async {
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
        await crearUsuario();
        inicioApp();
        break;
      case 2:
        Usuario usuario = await login();
        menuLogueado(usuario);
        break;
      
    }
}
  menuLogueado(Usuario usuario) async {
    String? nombre = usuario.nombre;
    int? opcion;
    do {
      stdout.writeln('''Hola, $nombre selecciona una de las siguientes opciones:
        1 - Catalogo de productos
        2 - Lista de la compra
        3 - Ofertas
        4 - Carrito de la compra''');
      opcion = int.tryParse(stdin.readLineSync() ?? 'e');
    } while (opcion == null || opcion != 1 && opcion !=2 && opcion !=3 && opcion !=4);
    switch (opcion) {
      case 1:
        await catalogo();
        break;
      case 2:
       await lista();
        break;
      case 3:
        await ofertas();
        break;
      case 4:
        await carrito();
        break;
      default:
        await inicioApp();
    }
  }

  login() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce tu nombre de usuario');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu constraseña');
    usuario.password = stdin.readLineSync();
    var resultado = await usuario.loginUsuario();
    if(resultado == false){
      stdout.writeln('Tu nombre de usuario o contraseña son incorrectos');
    }
    return resultado;
  }
   crearUsuario() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce un nombre de usuario');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce una constraseña');
    usuario.password = stdin.readLineSync();
    await usuario.insertarUsuario();
  }
}
    String? pedirProducto() {
    stdout.writeln("Este es nuestro catalogo");
    print(Scatalogo);}

    String? mostrarOferta() {
   //stdout.writeln("¡Aun no hay ofertas!");
    stdout.writeln("¡3x2 en cereales hasta el miercoles!");
}

   String listaCompra() {
    stdout.writeln("Escribe el nombre del producto que quieres añadir a la lista");
    return stdin.readLineSync() ?? "error";
}


   String? consultarCarrito() {
    stdout.writeln("Tu carrito esta vacio");
}



    catalogo() async {
    String? respuesta = await pedirProducto();  
      }

    lista() async {
    String respuesta = await listaCompra();
      }

    ofertas() async {
    String? respuesta = await mostrarOferta();
      }

    carrito() async {
    String? respuesta = await consultarCarrito();
      }




    