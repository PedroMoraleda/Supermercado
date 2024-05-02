import 'dart:io';
import 'Usuario.dart';
import 'Pruebas.dart';
import 'Domicilio.dart';
class App {
List<String> carritoDeCompra = [];
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
        await Usuario().crearUsuario();
        inicioApp();
        break;
      case 2:
        Usuario usuario = await Usuario().login();
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
          4 - Carrito de la compra
          5 - Compra en casa
          6 - Salir''');
      opcion = int.tryParse(stdin.readLineSync() ?? 'e');
     } while (opcion == null || opcion != 1 && opcion !=2 && opcion !=3 && opcion !=4 && opcion !=5 && opcion !=6);
    switch (opcion) {
      case 1:
        await catalogo();
        await menuLogueado(usuario);
        break;
      case 2:
       await lista();
       await verCarrito();
       await menuLogueado(usuario);
        break;
      case 3:
        await ofertas();
        await menuLogueado(usuario);
        break;
      case 4:
        await carrito();
        await menuLogueado(usuario);
        break;
      case 5: 
      await aDomicilio();
      break;
      case 6: 
      print("¡¡Vuelve pronto!!");
      break;
      default:
        await inicioApp();
    }
  }
  verCarrito() async {
    stdout.writeln("Tu carrito de compra:");
    if (carritoDeCompra.isEmpty) {
      stdout.writeln("El carrito está vacío.");
    } else {
      for (var producto in carritoDeCompra) {
        stdout.writeln(producto);
    }
  }
}
    pedirProducto() {
      stdout.writeln("Este es nuestro catalogo");
      Scatalogo.forEach((producto, precio) {
      print("$producto - \$$precio");
      });}


    mostrarOferta() {
      stdout.writeln('''
  Descuento del 20% en todas las verduras orgánicas.
  Compra uno, llévate el segundo al 50% de descuento" en yogures de marca propia.
  2x1 en leche en cartón de un litro.''');
}

    listaCompra() {
      stdout.writeln("Escribe el nombre del producto que quieres añadir a la lista");
        String? producto = stdin.readLineSync();
        if (producto != null && producto.isNotEmpty) {
           carritoDeCompra.add(producto);
           stdout.writeln("¡Añadido a tu carrito!");
         } else {
           stdout.writeln("Por favor, ingresa un nombre de producto válido.");
      }
    }









    catalogo() async {
      pedirProducto();}

    lista() async {
      listaCompra();}

    ofertas() async {
      mostrarOferta();}

    carrito() async {
      verCarrito();}
}