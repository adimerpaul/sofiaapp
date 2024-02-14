import 'package:appsofia/pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define tu color personalizado
    final Color myCustomColor = Color(0xFFED1C24); // Ejemplo: Verde

    return MaterialApp(
      title: 'Sofia App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Establece el color personalizado en el tema de la aplicación
        appBarTheme: AppBarTheme(
          color: myCustomColor,
        ),
      ),
      home: HomePage(),
    );
  }
}
