import 'dart:io';

import 'Supermercado.dart';

class App {
static  inicioApp() async {
    int? seleccion = pedirOpcion();
    switch (seleccion) {
      case 1:
        catalogo();
        break;

      default:
        inicioApp();
    }
  }


  
  static int? pedirOpcion() {
    int? opcion;
    do {
      stdout.writeln('''Selecciona una de las siguientes opciones:
        1 - Catalogo de productos
        2 - Busqueda de productos
        3 - Lista de la compra
        4 - Ofertas
        5 - Carrito de la compra''');
      opcion = int.tryParse(stdin.readLineSync() ?? 'e');
    } while (opcion == null);
    return opcion; }

 static String pedirNombre() {
    stdout.writeln("Escribe el nombre del producto a consultar");
    return stdin.readLineSync() ?? "error";
  }
  static  catalogo() async {
    String respuesta = pedirNombre();
      }
}