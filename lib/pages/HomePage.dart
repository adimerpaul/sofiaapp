import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Importar y Datos',
            style: TextStyle(
              color: Colors.white,
            ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Welcome to the Home Page'),
      ),
    );
  }
}
