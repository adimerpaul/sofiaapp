import 'package:flutter/material.dart';

class AlmacenPage extends StatefulWidget {
  const AlmacenPage({super.key});

  @override
  State<AlmacenPage> createState() => _AlmacenPageState();
}

class _AlmacenPageState extends State<AlmacenPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Almacen Page'),
      ),
    );
  }
}
