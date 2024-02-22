import 'dart:convert';

import 'package:appsofia/models/Almacen.dart';
import 'package:appsofia/models/User.dart';
import 'package:appsofia/pages/AlmacenAlert.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AlmacenPage extends StatefulWidget {
  const AlmacenPage({super.key});

  @override
  State<AlmacenPage> createState() => _AlmacenPageState();
}

class _AlmacenPageState extends State<AlmacenPage> {
  var almacen = [];
  var user = User(id: 0);
  @override
  void initState() {
    getDatos();
    super.initState();
  }
  void getDatos() async {
    var almacenBox = await Hive.openBox<Almacen>('almacen');
    var userBox = await Hive.openBox<User>('user');
    setState(() {
      almacen = almacenBox.values.toList();
      // print(jsonEncode(almacen));
      user = User(id: userBox.getAt(0)!.id, name: userBox.getAt(0)!.name);
    });
    // print(user.name);
  }
  void logout(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Salir'),
          content: Text('Se perderán los datos no guardados'),
          actions: <Widget>[
            // Botón para cancelar el cierre de sesión
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
            ),
            // Botón para confirmar el cierre de sesión
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                var almacenBox = Hive.box<Almacen>('almacen');
                almacenBox.deleteAll(almacenBox.keys);
                Navigator.of(context).pop(); // Cerrar el diálogo
                Navigator.pop(context); // Cerrar la página actual
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Almacen',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              logout(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            // padding: EdgeInsets.all(10),
            child: Column(
              //centrear
              mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos horizontalmente
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text('Usuario: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900, // Aquí puedes ajustar el valor de FontWeight
                          fontSize: 11,
                        ),
                      ),
                      Text('${user.name}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                        ),
                      ),
                      Text(' Codigo: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900, // Aquí puedes ajustar el valor de FontWeight
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        almacen.length > 0 ? almacen[0].codigo.toString() : '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: double.infinity,
                    color: Colors.blueGrey[900],
                    child: Center(
                      child: Text(
                        'Total: ${almacen.length} | Pendientes: ${almacen.where((element) => element.estado == 'PENDIENTE').length} | Registrados: ${almacen.where((element) => element.estado == 'REGISTRADO').length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                ),

              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: almacen.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // print(almacen[index].id);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlmacenAlert(
                          almacen: almacen[index],
                          onClick: () {
                            getDatos();
                          },
                        );
                      },
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text(
                                  (index+1).toString()+' '+almacen[index].producto!.trim()+ ' ' ,style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
                                  fontSize: 11,
                                ),),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2), // Ajusta el padding del Container
                                  decoration: BoxDecoration(
                                    color: almacen[index].estado == 'PENDIENTE' ? Colors.red : Colors.green, // Establece el color de fondo del Container según el estado
                                    borderRadius: BorderRadius.circular(3), // Ajusta el radio de borde del Container
                                  ),
                                  child: Text(
                                    almacen[index].estado!.trim(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11, // Ajusta el tamaño del texto del Chip
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text('Saldo: '),
                              Text(almacen[index].saldo.toString(),style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900, // Aquí puedes ajustar el valor de FontWeight
                                fontSize: 11,
                              ),),
                              Text(' Vencimiento: '),
                              Text(almacen[index].vencimiento.toString().substring(0,10),style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900, // Aquí puedes ajustar el valor de FontWeight
                                fontSize: 11,
                              ),),
                              Text(' Cantidad: '),
                              Container(
                                decoration: BoxDecoration(
                                  color: int.parse(almacen[index].cantidad.toString()) == int.parse(almacen[index].saldo.toString()) ? Colors.green : Colors.red, // Establece el color de fondo del Container según la cantidad (saldo y cantidad iguales: verde, saldo y cantidad diferentes: rojo
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(almacen[index].cantidad.toString(),style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900, // Aquí puedes ajustar el valor de FontWeight
                                    fontSize: 11,
                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}