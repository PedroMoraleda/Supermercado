import 'package:mysql1/mysql1.dart';

class Database {
  // Propiedades
  final String _host = 'localhost';
  final int _port = 3306;
  final String _user = 'root';

  // Métodos
  instalacion() async {
    var settings = ConnectionSettings(
      host: this._host, 
      port: this._port,
      user: this._user,
    );
    var conn = await MySqlConnection.connect(settings);
    try{
      await _crearSupermercado(conn);
      await _crearTablaUsuarios(conn);
      await _crearTablaProductos(conn);
      await conn.close();
    } catch(e){
      print(e);
      await conn.close();
    } 
  }

  Future<MySqlConnection> conexion() async {
    var settings = ConnectionSettings(
      host: this._host, 
      port: this._port,
      user: this._user,
      db: 'supermercado'
    );
      
    return await MySqlConnection.connect(settings);
 
  }
  
  _crearSupermercado (conn) async {
    await conn.query('CREATE DATABASE IF NOT EXISTS supermercado');
    await conn.query('USE supermercado');
    //print('Conectado a supermercado');
  }

  _crearTablaUsuarios(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS usuarios(
        idusuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL UNIQUE,
        password VARCHAR(10) NOT NULL
    )''');
    //print('Tabla usuarios creada');
  }

  _crearTablaProductos(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS productos(
        idproducto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50),
        precio INT,
        stock BOOL
    )''');
    //print('Tabla productos creada');
  }
}