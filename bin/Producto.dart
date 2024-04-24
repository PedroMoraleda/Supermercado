import 'package:mysql1/mysql1.dart';

class Producto {
   
  // Propiedades
  int? idProducto;
  String? nombre;
  double? precio;
  int? stock;

  // Getters y setters
  get getIdProducto => this.idProducto;

 set setIdProducto( idProducto) => this.idProducto = idProducto;

  get getNombre => this.nombre;

 set setNombre( nombre) => this.nombre = nombre;

  get getPrecio => this.precio;

 set setPrecio( precio) => this.precio = precio;

  get getStock => this.stock;

 set setStock( stock) => this.stock = stock;

  // Constructores
  Producto();

  Producto.fromMap(ResultRow map) {
    this. idProducto = map['idPoducto'];
    this. nombre = map['nombre'];
    this. precio = map['precio'];
    this. stock = map['stock'];
  }

}