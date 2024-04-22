import 'dart:io';

import 'Supermercado.dart';

class App {
static  inicioApp() async {
    int? seleccion = pedirOpcion();
    switch (seleccion) {
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
      default:
        inicioApp();
    }
  }


  
  static int? pedirOpcion() {
    int? opcion;
    do {
      stdout.writeln('''Selecciona una de las siguientes opciones:
        1 - Busqueda de productos
        2 - Lista de la compra
        3 - Ofertas
        4 - Carrito de la compra''');
      opcion = int.tryParse(stdin.readLineSync() ?? 'e');
    } while (opcion == null);
    return opcion; }

 static String pedirProducto() {
    stdout.writeln("Escribe el nombre del producto a consultar");
    return stdin.readLineSync() ?? "error";//falta
}
  static String listaCompra() {
    stdout.writeln("Escribe el nombre del producto que quieres añadir a la lista");
    return stdin.readLineSync() ?? "error";
}
  static String mostrarOferta() {
    stdout.writeln("¡Aun no hay ofertas!");
    return stdin.readLineSync() ?? "error";// mal
}
  static String consultarCarrito() {
    stdout.writeln("Tu carrito esta vacio");
    return stdin.readLineSync() ?? "error"; // mal
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