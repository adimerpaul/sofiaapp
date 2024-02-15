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
}