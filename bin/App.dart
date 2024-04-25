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
       await verCarrito();
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
  verCarrito() async {
      int? opcion;
     do {
      stdout.writeln('''¿Quieres consultar tu carrito?:
          1 - Si
          2 - No''');
      opcion = int.tryParse(stdin.readLineSync() ?? 'e');
     } while (opcion == null || opcion != 1 && opcion !=2);
    switch (opcion) {
      case 1:
        await carrito();
        break;
      case 2:
        print("pringao");
        break;
    }
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

    pedirProducto() {
      stdout.writeln("Este es nuestro catalogo");
      print(Scatalogo);}

    mostrarOferta() {
      //stdout.writeln("¡Aun no hay ofertas!");
      stdout.writeln('''
  Descuento del 20% en todas las verduras orgánicas.
  Compra uno, llévate el segundo al 50% de descuento" en yogures de marca propia.
  2x1 en leche en cartón de un litro.''');
}

    listaCompra() {
      stdout.writeln("Escribe el nombre del producto que quieres añadir a la lista");
      String? lista = stdin.readLineSync() ?? "error";
      lista;      
      print ("¡Añadido a tu carrito!");
}


    consultarCarrito() {
      stdout.writeln("Tu carrito esta vacio😪");
      //stdout.writeln("¡Aqui tienes tu carrito!");
      //print(lista);
}



    catalogo() async {
      pedirProducto();  
      }

    lista() async {
      listaCompra();
      }

    ofertas() async {
      mostrarOferta();
      }

    carrito() async {
      consultarCarrito();
      }




    