import 'package:appsofia/models/User.dart';
import 'package:appsofia/services/ImportService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _fechaController = TextEditingController();
  final _codigo = TextEditingController();
  final _user = TextEditingController();
  var _users = [];
  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    await ImportService().users();
    var usersBox = await Hive.openBox<User>('users');
    // usersBox.values.forEach((user) {
    //   print(user.name);
    // });
    setState(() {
      _users = usersBox.values.toList();
      // _users.forEach((user) {
      //   print(user.name);
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //       'Importar y Datos',
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontWeight: FontWeight.bold,
      //       ),
      //   ),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          Text(
            'Importacion de Datos',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w900, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset('logo.png')
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:  FormBuilderDateTimePicker(
              name: 'date',
              controller: _fechaController,
              inputType: InputType.date,
              decoration: InputDecoration(labelText: 'Fecha'),
              initialValue: DateTime.now(),
              locale: const Locale('es', 'ES'),
              onChanged: (value) {
                setState(() {
                  _fechaController.text = value.toString();
                });
              },
            ),
          ),
          Text('fecha: ${_fechaController.text}'),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormBuilderDropdown(
              name: 'codigo',
              decoration: InputDecoration(labelText: 'Código'),
              items: ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
                  .map((codigo) => DropdownMenuItem(
                value: codigo,
                child: Text('$codigo'),
              )).toList(),
              onChanged: (value) {
                setState(() {
                  _codigo.text = value.toString();
                });
              },
            ),
          ),
          Text('codigo: ${_codigo.text}'),
          //users
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormBuilderDropdown(
              name: 'user',
              decoration: InputDecoration(labelText: 'Usuario'),
              items: _users
                .map((user) => DropdownMenuItem(
                  value: user.id,
                  child: Text('${user.name}'),
                )).toList(),
              onChanged: (value) {
                setState(() {
                  _user.text = value.toString();
                });
              },
            ),
          ),
          Text('user: ${_user.text}'),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  // print('fecha: ${_fecha.currentState?.value}');
                  // if (_fecha.currentState!.saveAndValidate() &&
                  //     _codigo.currentState!.saveAndValidate() &&
                  //     _user.currentState!.saveAndValidate()) {
                  //   print(_fecha.currentState!.value);
                  //   print(_codigo.currentState!.value);
                  //   print(_user.currentState!.value);
                  // }
                },
                child: const Text('Importar Datos'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  onSurface: Colors.grey,
                ),
              ),
          ),
        ]
      ),
    );
  }
}
