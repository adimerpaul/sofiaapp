import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _fecha = GlobalKey<FormBuilderState>();
  final _codigo = GlobalKey<FormBuilderState>(); //['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Importar y Datos',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset('logo.png')
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:  FormBuilderDateTimePicker(
              name: 'date',
              key: _fecha,
              inputType: InputType.date,
              decoration: InputDecoration(labelText: 'Fecha'),
              initialValue: DateTime.now(),
              locale: const Locale('es', 'ES'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormBuilderDropdown(
              key: _codigo,
              name: 'codigo',
              decoration: InputDecoration(labelText: 'Código'),
              items: ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
                .map((codigo) => DropdownMenuItem(
                  value: codigo,
                  child: Text('$codigo'),
                )).toList(),
            ),
          )
        ]
      ),
    );
  }
}
