import 'App.dart';
import 'Database.dart';
main()async {
  await Database().instalacion();
  print("¡¡Bienvenido al supermercado!!");
  App().inicioApp();
  

}