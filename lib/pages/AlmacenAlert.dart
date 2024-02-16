import 'package:flutter/material.dart';

class AlmacenAlert extends StatefulWidget {
  final almacen;

  const AlmacenAlert({
    super.key,
    this.almacen,
  });

  @override
  State<AlmacenAlert> createState() => _AlmacenAlertState();
}

class _AlmacenAlertState extends State<AlmacenAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Detalle'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    'Producto:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 5), // Añade un espacio entre el texto 'Producto:' y el contenido del producto
                  Text(
                    widget.almacen.producto.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Row(children: [Text('Saldo:',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 12,
            ),), Text(widget.almacen.saldo.toString(),style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),),]),
            Row(children: [Text('Registro:',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 12,
            ),), Text(widget.almacen.registro.toString().substring(0,10),style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),),]),
            Row(children: [Text('Vencimiento:',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 12,
            ),), Text(widget.almacen.vencimiento.toString().substring(0,10),style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),),]),
            Row(children: [Text('Grupo:',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 12,
            ),), Text(widget.almacen.grupo!.trim(),style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),),]),
            Row(children: [Text('Estado:',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 12,
            ),), Text(widget.almacen.estado!.trim(),style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),),]),
            Row(children: [Text('Cantidad:',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 12,
            ),), Text(widget.almacen.cantidad.toString(),style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),),]),
            Text('Detalle:',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 12,
            ),),
            Text(widget.almacen.detalle.length > 0 ? widget.almacen.detalle.length.toString() : 'Sin detalle',style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Aceptar'),
          onPressed: () {
            Navigator.of(context).pop(); // Cerrar el diálogo
          },
        ),
      ],
    );
  }
}
