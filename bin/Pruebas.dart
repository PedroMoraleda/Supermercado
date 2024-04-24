import 'dart:io';

// Clase Producto
class Producto {
  final String nombre;
  final double precio;

  Producto(this.nombre, this.precio);

}


// Clase Supermercado
class Supermercado {
  List<Producto> catalogo = [
    Producto("Manzanas", 1.5),
    Producto("Leche", 0.8),
    Producto("Pan", 1.0),
    Producto("Huevos", 2.0),
  ];

  List<Producto> listaCompra = [];
  
}