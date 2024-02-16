import 'package:appsofia/models/Almacen.dart';
import 'package:appsofia/models/User.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ImportService {
  static apiURL() {
    return dotenv.env['API_BACK'];
  }

  Future users() async {
    var usersBox = await Hive.openBox<User>('users');
    // await usersBox.put(1,User(id: 1, name: 'Juan'));
    if (usersBox.isEmpty) {
      // print(apiURL());
      var response = await http.get(Uri.parse(apiURL() + 'users'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        data.forEach((user) async {
          // print(user['id']);
          await usersBox.put(user['id'], User(id: user['id'], name: user['nombre']));
        });
      }
    }
  }
  Future importData(fecha,codigo,user) async {
    var usersBox = await Hive.openBox<User>('users');
    var userSearch = usersBox.get(int.parse(user));
    var userBox = await Hive.openBox<User>('user');
    userBox.put(1, userSearch!);
    // print(userSearch);
    var almacenBox = await Hive.openBox<Almacen>('almacen');
    almacenBox.deleteAll(almacenBox.keys);
    var uri = Uri.parse(apiURL() + 'importData');
    var response = await http.post(uri, body: {
      'fecha': fecha,
      'codigo': codigo,
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data.forEach((almacen) async {
        print(almacen['id']);
        await almacenBox.put(almacen['id'], Almacen(
          id: almacen['id'],
          codigo: almacen['codigo'],
          codigoProducto: almacen['codigo_producto'],
          producto: almacen['producto'],
          unidad: almacen['unidad'],
          saldo: almacen['saldo'],
          registro: DateTime.parse(almacen['registro']),
          vencimiento: DateTime.parse(almacen['vencimiento']),
          grupo: almacen['grupo'],
          estado: 'IMPORTADO'
        ));
      });
    }
  }
}