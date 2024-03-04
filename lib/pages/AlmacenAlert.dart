import 'dart:convert';

import 'package:appsofia/models/Almacen.dart';
import 'package:appsofia/models/Detalle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hive/hive.dart';

class AlmacenAlert extends StatefulWidget {
  final almacen;
  final VoidCallback? onClick;

  const AlmacenAlert({
    super.key,
    this.almacen,
    this.onClick,
  });

  @override
  State<AlmacenAlert> createState() => _AlmacenAlertState();
}

class _AlmacenAlertState extends State<AlmacenAlert> {
  var cantidad1 = TextEditingController();
  var vencimiento1 = TextEditingController();
  var cantidad2 = TextEditingController();
  var vencimiento2 = TextEditingController();
  var cantidad3 = TextEditingController();
  var vencimiento3 = TextEditingController();
  var cantidad4 = TextEditingController();
  var vencimiento4 = TextEditingController();
  var cantidad5 = TextEditingController();
  var vencimiento5 = TextEditingController();
  var cantidad6 = TextEditingController();
  var vencimiento6 = TextEditingController();
  var cantidad7 = TextEditingController();
  var vencimiento7 = TextEditingController();
  var cantidad8 = TextEditingController();
  var vencimiento8 = TextEditingController();
  var cantidad9 = TextEditingController();
  var vencimiento9 = TextEditingController();
  var cantidad10 = TextEditingController();
  var vencimiento10 = TextEditingController();
  double total = 0;
  @override
  void initState() {
    llenado();
    calcularTotal();
    super.initState();
  }
  void llenado() {
    cantidad1.text = widget.almacen.detalle[0].cantidad.toString();
    vencimiento1.text = widget.almacen.detalle[0].vencimiento.toString();
    cantidad2.text = widget.almacen.detalle.length > 1 ? widget.almacen.detalle[1].cantidad.toString() : '';
    vencimiento2.text = widget.almacen.detalle.length > 1 ? widget.almacen.detalle[1].vencimiento.toString() : '';
    cantidad3.text = widget.almacen.detalle.length > 2 ? widget.almacen.detalle[2].cantidad.toString() : '';
    vencimiento3.text = widget.almacen.detalle.length > 2 ? widget.almacen.detalle[2].vencimiento.toString() : '';
    cantidad4.text = widget.almacen.detalle.length > 3 ? widget.almacen.detalle[3].cantidad.toString() : '';
    vencimiento4.text = widget.almacen.detalle.length > 3 ? widget.almacen.detalle[3].vencimiento.toString() : '';
    cantidad5.text = widget.almacen.detalle.length > 4 ? widget.almacen.detalle[4].cantidad.toString() : '';
    vencimiento5.text = widget.almacen.detalle.length > 4 ? widget.almacen.detalle[4].vencimiento.toString() : '';
    cantidad6.text = widget.almacen.detalle.length > 5 ? widget.almacen.detalle[5].cantidad.toString() : '';
    vencimiento6.text = widget.almacen.detalle.length > 5 ? widget.almacen.detalle[5].vencimiento.toString() : '';
    cantidad7.text = widget.almacen.detalle.length > 6 ? widget.almacen.detalle[6].cantidad.toString() : '';
    vencimiento7.text = widget.almacen.detalle.length > 6 ? widget.almacen.detalle[6].vencimiento.toString() : '';
    cantidad8.text = widget.almacen.detalle.length > 7 ? widget.almacen.detalle[7].cantidad.toString() : '';
    vencimiento8.text = widget.almacen.detalle.length > 7 ? widget.almacen.detalle[7].vencimiento.toString() : '';
    cantidad9.text = widget.almacen.detalle.length > 8 ? widget.almacen.detalle[8].cantidad.toString() : '';
    vencimiento9.text = widget.almacen.detalle.length > 8 ? widget.almacen.detalle[8].vencimiento.toString() : '';
    cantidad10.text = widget.almacen.detalle.length > 9 ? widget.almacen.detalle[9].cantidad.toString() : '';
    vencimiento10.text = widget.almacen.detalle.length > 9 ? widget.almacen.detalle[9].vencimiento.toString() : '';
  }

  void calcularTotal() {
    double sum = 0;
    if (cantidad1.text.isNotEmpty) {
      sum += double.parse(cantidad1.text);
    }
    if (cantidad2.text.isNotEmpty) {
      sum += double.parse(cantidad2.text);
    }
    if (cantidad3.text.isNotEmpty) {
      sum += double.parse(cantidad3.text);
    }
    if (cantidad4.text.isNotEmpty) {
      sum += double.parse(cantidad4.text);
    }
    if (cantidad5.text.isNotEmpty) {
      sum += double.parse(cantidad5.text);
    }
    if (cantidad6.text.isNotEmpty) {
      sum += double.parse(cantidad6.text);
    }
    if (cantidad7.text.isNotEmpty) {
      sum += double.parse(cantidad7.text);
    }
    if (cantidad8.text.isNotEmpty) {
      sum += double.parse(cantidad8.text);
    }
    if (cantidad9.text.isNotEmpty) {
      sum += double.parse(cantidad9.text);
    }
    if (cantidad10.text.isNotEmpty) {
      sum += double.parse(cantidad10.text);
    }
    setState(() {
      total = sum;
    });
  }

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
                    'Producto: ',
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
            Row(children: [Text('Saldo: ',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 12,
            ),), Text(widget.almacen.saldo.toString(),style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 20,
            ),),]),
            Row(children: [Text('Registro: ',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 12,
            ),), Text(widget.almacen.registro.toString().substring(0,10),style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),),]),
            Row(children: [Text('Vencimiento: ',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 12,
            ),), Text(widget.almacen.vencimiento.toString().substring(0,10),style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),),]),
            Row(children: [Text('Grupo: ',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 12,
            ),), Text(widget.almacen.grupo!.trim(),style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),),]),
            Row(children: [Text('Estado: ',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 12,
            ),), Text(widget.almacen.estado!.trim(),style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),),]),
            Row(children: [Text('Cantidad: ',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 12,
            ),),
              Text(total.toString(),
                style: TextStyle(
                  color: double.parse(widget.almacen.saldo.toString()) == double.parse(total.toString()) ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
                  fontSize: 20,
                ),
              ),
            ]
            ),
            Text('Detalle: ',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Aquí puedes ajustar el valor de FontWeight
              fontSize: 12,
            ),),
            // Text(widget.almacen.detalle.length > 0 ? widget.almacen.detalle.length.toString() : 'Sin detalle',style: TextStyle(
            //   color: Colors.black,
            //   fontSize: 12,
            // ),),
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'cantidad1',
                    // controller: cantidad1,
                    decoration: InputDecoration(labelText: 'Cantidad1'),
                    initialValue: cantidad1.text,
                    onChanged: (value) {
                      setState(() {
                        cantidad1.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')) // Acepta solo números con un máximo de dos decimales
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    // controller: vencimiento1,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha1'),
                    initialValue: vencimiento1.text.isEmpty ? DateTime.now() : DateTime.parse(vencimiento1.text),
                    locale: const Locale('es', 'ES'),
                    onChanged: (value) {
                      setState(() {
                        vencimiento1.text = value.toString();
                        print(vencimiento1.text);
                        calcularTotal();
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'cantidad2',
                    // controller: cantidad2,
                    decoration: InputDecoration(labelText: 'Cantidad2'),
                    initialValue: cantidad2.text,
                    onChanged: (value) {
                      setState(() {
                        cantidad2.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')) // Acepta solo números con un máximo de dos decimales
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    // controller: vencimiento2,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha2'),
                    initialValue: vencimiento2.text.isEmpty ? DateTime.now() : DateTime.parse(vencimiento2.text),
                    locale: const Locale('es', 'ES'),
                    onChanged: (value) {
                      setState(() {
                        vencimiento2.text = value.toString();
                        calcularTotal();
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'cantidad3',
                    // controller: cantidad3,
                    decoration: InputDecoration(labelText: 'Cantidad3'),
                    initialValue: cantidad3.text,
                    onChanged: (value) {
                      setState(() {
                        cantidad3.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')) // Acepta solo números con un máximo de dos decimales
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    // controller: vencimiento3,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha3'),
                    initialValue: vencimiento3.text.isEmpty ? DateTime.now() : DateTime.parse(vencimiento3.text),
                    locale: const Locale('es', 'ES'),
                    onChanged: (value) {
                      setState(() {
                        vencimiento3.text = value.toString();
                        calcularTotal();
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'cantidad4',
                    // controller: cantidad4,
                    decoration: InputDecoration(labelText: 'Cantidad4'),
                    initialValue: cantidad4.text,
                    onChanged: (value) {
                      setState(() {
                        cantidad4.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')) // Acepta solo números con un máximo de dos decimales
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    // controller: vencimiento4,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha4'),
                    initialValue: vencimiento4.text.isEmpty ? DateTime.now() : DateTime.parse(vencimiento4.text),
                    locale: const Locale('es', 'ES'),
                    onChanged: (value) {
                      setState(() {
                        vencimiento4.text = value.toString();
                        calcularTotal();
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'cantidad5',
                    // controller: cantidad5,
                    decoration: InputDecoration(labelText: 'Cantidad5'),
                    initialValue: cantidad5.text,
                    onChanged: (value) {
                      setState(() {
                        cantidad5.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')) // Acepta solo números con un máximo de dos decimales
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    // controller: vencimiento5,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha5'),
                    initialValue: vencimiento5.text.isEmpty ? DateTime.now() : DateTime.parse(vencimiento5.text),
                    locale: const Locale('es', 'ES'),
                    onChanged: (value) {
                      setState(() {
                        vencimiento5.text = value.toString();
                        calcularTotal();
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'cantidad6',
                    // controller: cantidad6,
                    decoration: InputDecoration(labelText: 'Cantidad6'),
                    initialValue: cantidad6.text,
                    onChanged: (value) {
                      setState(() {
                        cantidad6.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')) // Acepta solo números con un máximo de dos decimales
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    // controller: vencimiento6,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha6'),
                    initialValue: vencimiento6.text.isEmpty ? DateTime.now() : DateTime.parse(vencimiento6.text),
                    locale: const Locale('es', 'ES'),
                    onChanged: (value) {
                      setState(() {
                        vencimiento6.text = value.toString();
                        calcularTotal();
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'cantidad7',
                    // controller: cantidad7,
                    decoration: InputDecoration(labelText: 'Cantidad7'),
                    initialValue: cantidad7.text,
                    onChanged: (value) {
                      setState(() {
                        cantidad7.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')) // Acepta solo números con un máximo de dos decimales
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    // controller: vencimiento7,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha7'),
                    initialValue: vencimiento7.text.isEmpty ? DateTime.now() : DateTime.parse(vencimiento7.text),
                    locale: const Locale('es', 'ES'),
                    onChanged: (value) {
                      setState(() {
                        vencimiento7.text = value.toString();
                        calcularTotal();
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'cantidad8',
                    // controller: cantidad8,
                    decoration: InputDecoration(labelText: 'Cantidad8'),
                    initialValue: cantidad8.text,
                    onChanged: (value) {
                      setState(() {
                        cantidad8.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')) // Acepta solo números con un máximo de dos decimales
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    // controller: vencimiento8,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha8'),
                    initialValue: vencimiento8.text.isEmpty ? DateTime.now() : DateTime.parse(vencimiento8.text),
                    locale: const Locale('es', 'ES'),
                    onChanged: (value) {
                      setState(() {
                        vencimiento8.text = value.toString();
                        calcularTotal();
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'cantidad9',
                    // controller: cantidad9,
                    decoration: InputDecoration(labelText: 'Cantidad9'),
                    initialValue: cantidad9.text,
                    onChanged: (value) {
                      setState(() {
                        cantidad9.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')) // Acepta solo números con un máximo de dos decimales
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    // controller: vencimiento9,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha9'),
                    initialValue: vencimiento9.text.isEmpty ? DateTime.now() : DateTime.parse(vencimiento9.text),
                    locale: const Locale('es', 'ES'),
                    onChanged: (value) {
                      setState(() {
                        vencimiento9.text = value.toString();
                        calcularTotal();
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'cantidad10',
                    // controller: cantidad10,
                    decoration: InputDecoration(labelText: 'Cantidad10'),
                    initialValue: cantidad10.text,
                    onChanged: (value) {
                      setState(() {
                        cantidad10.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')) // Acepta solo números con un máximo de dos decimales
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    // controller: vencimiento10,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha10'),
                    initialValue: vencimiento10.text.isEmpty ? DateTime.now() : DateTime.parse(vencimiento10.text),
                    locale: const Locale('es', 'ES'),
                    onChanged: (value) {
                      setState(() {
                        vencimiento10.text = value.toString();
                        calcularTotal();
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () async {
                var almacenBox = await Hive.openBox<Almacen>('almacen');
                // this.id, this.codigo, this.codigoProducto, this.producto, this.unidad, this.saldo, this.registro, this.vencimiento, this.grupo, this.estado, this.cantidad, this.detalle
                var almacenInsert=Almacen(
                  id: widget.almacen.id,
                  codigo: widget.almacen.codigo,
                  codigoProducto: widget.almacen.codigoProducto,
                  producto: widget.almacen.producto,
                  unidad: widget.almacen.unidad,
                  saldo: widget.almacen.saldo,
                  registro: widget.almacen.registro,
                  vencimiento: widget.almacen.vencimiento,
                  grupo: widget.almacen.grupo,
                  estado: 'REALIZADO',
                  cantidad: total,
                  detalle: [
                    Detalle(cantidad: cantidad1.text, vencimiento: vencimiento1.text),
                    Detalle(cantidad: cantidad2.text, vencimiento: vencimiento2.text),
                    Detalle(cantidad: cantidad3.text, vencimiento: vencimiento3.text),
                    Detalle(cantidad: cantidad4.text, vencimiento: vencimiento4.text),
                    Detalle(cantidad: cantidad5.text, vencimiento: vencimiento5.text),
                    Detalle(cantidad: cantidad6.text, vencimiento: vencimiento6.text),
                    Detalle(cantidad: cantidad7.text, vencimiento: vencimiento7.text),
                    Detalle(cantidad: cantidad8.text, vencimiento: vencimiento8.text),
                    Detalle(cantidad: cantidad9.text, vencimiento: vencimiento9.text),
                    Detalle(cantidad: cantidad10.text, vencimiento: vencimiento10.text),
                  ],
                );
                almacenBox.put( widget.almacen.id, almacenInsert);
                // print(jsonEncode(almacenInsert.toJson()));
                widget.onClick!();
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red, // Color de fondo del botón
                // primary: Colors.white, // Color del texto del botón
                minimumSize: Size(double.infinity, 60.0), // Ancho completo y altura de 60.0
              ),
              child: Text(
                'Aceptar',
                style: TextStyle(fontSize: 20.0), // Tamaño de texto
              ),
            ),
          ),
        ),
      ],
    );
  }
}
