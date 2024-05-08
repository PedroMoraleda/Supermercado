import 'dart:io';


aDomicilio()async{
      stdout.writeln("Introduzca su direccion");
      String? direccion =stdin.readLineSync();
      stdout.writeln("Introduzca su numero de telefono");
      String? ntelefono =stdin.readLineSync();
      stdout.writeln("Introduzca el dia de entrega");
      String? eDia =stdin.readLineSync();      
      stdout.writeln("Introduzca una hora de entrega");
      String? eHora =stdin.readLineSync();      
      int? opcion;
      do {
        stdout.writeln('''¡Escoge que una de las siguientes opciones!:
           1 - Ver packs
           2 - Pedir pack''');
       opcion = int.tryParse(stdin.readLineSync() ?? 'e');
      } while (opcion == null || opcion != 1 && opcion !=2);
     switch (opcion) {
       case 1:
       await packdomicilio();
       await pedidoadomicilio();
         break;
       case 2:
        await pedidoadomicilio();
         break;
    }
}
  pedidoadomicilio(){
    stdout.writeln('''Escoge un pack:
           1 - Pack de Cocina Italiana
           2 - Pack de Desayuno y Abastecimiento Básico
           3 - Pack de Abastecimiento Doméstico''');
    var respuesta = stdin.readLineSync();
    
    int? epack = int.tryParse(respuesta!);

    if (epack==1) {
      print("Su Pack de Cocina Italiana se entregara en su direccion el dia indicado");
    } else if (epack==2) {
      print("Su Pack de Desayuno y Abastecimiento Básico se entregara en su direccion el dia indicado");
    } else if (epack==3) {
      print("Su Pack de Abastecimiento Doméstico se entregara en su direccion el dia indicado");
    } else {
      print("Error");
    }

  }



  packdomicilio(){
        stdout.writeln('''Estos son los packs disponibles
           1 - Pack de Cocina Italiana (100€)
              - 4kg de pasta (espaguetis, macarrones, etc.)
              - 5 botes de salsa de tomate (500g cada uno)
              - 5 paquetes de queso rallado (200g cada uno)
              - 4 paquetes de pan de ajo congelado (4 unidades cada uno)
              - 4 botellas de vino tinto (750ml cada una)
              - 3 paquetes de especias variadas (orégano, albahaca, etc.)

           2 - Pack de Desayuno y Abastecimiento Básico (60€)
              - 5 panes integrales (2.5kg)
              - 3 mermeladas sin azúcar añadido (750g)
              - 12 yogures naturales
              - 18 piezas de frutas frescas variadas (6 manzanas, 6 plátanos, 6 naranjas)
              - 3 paquetes de granola o cereales integrales (750g cada uno)
              - 1 bolsa de arroz (2kg)
              - 1 botella de aceite de oliva (1 litro)
              - 1 paquete de sal (1kg)
              - 1 paquete de azúcar (2kg)
           3 - Pack de Abastecimiento Doméstico(70€)
              - 5 packs de agua mineral (24 botellas de 500ml cada uno)
              - 3 botellas de leche (1 litro cada una)
              - 1 paquete de papel higiénico (12 rollos)
              - 5 paquetes de pasta (500g cada uno)
              - 2 bolsas de harina (2kg cada una)
              - 5 botes de salsa de tomate (500g cada uno)
           ''');
  }



    

