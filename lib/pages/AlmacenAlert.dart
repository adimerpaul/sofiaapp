import 'package:appsofia/models/Detalle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
  var total = 0;
  @override
  void initState() {
    llenado();
    calcularTotal();
    super.initState();
  }
  void llenado() {
    cantidad1.text = widget.almacen.detalle.length > 0 ? widget.almacen.detalle[0].cantidad.toString() : '';
    vencimiento1.text = widget.almacen.detalle.length > 0 ? widget.almacen.detalle[0].vencimiento.toString() : '';
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
    int sum = 0;
    if (cantidad1.text.isNotEmpty) {
      sum += int.parse(cantidad1.text);
    }
    if (cantidad2.text.isNotEmpty) {
      sum += int.parse(cantidad2.text);
    }
    if (cantidad3.text.isNotEmpty) {
      sum += int.parse(cantidad3.text);
    }
    if (cantidad4.text.isNotEmpty) {
      sum += int.parse(cantidad4.text);
    }
    if (cantidad5.text.isNotEmpty) {
      sum += int.parse(cantidad5.text);
    }
    if (cantidad6.text.isNotEmpty) {
      sum += int.parse(cantidad6.text);
    }
    if (cantidad7.text.isNotEmpty) {
      sum += int.parse(cantidad7.text);
    }
    if (cantidad8.text.isNotEmpty) {
      sum += int.parse(cantidad8.text);
    }
    if (cantidad9.text.isNotEmpty) {
      sum += int.parse(cantidad9.text);
    }
    if (cantidad10.text.isNotEmpty) {
      sum += int.parse(cantidad10.text);
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
                  color: int.parse(widget.almacen.saldo.toString()) == int.parse(total.toString()) ? Colors.green : Colors.red,
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
                    decoration: InputDecoration(labelText: 'Cantidad1'),
                    onChanged: (value) {
                      setState(() {
                        cantidad1.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.number, // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Acepta solo dígitos
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    controller: vencimiento1,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha1'),
                    // initialValue: DateTime.now(),
                    locale: const Locale('es', 'ES'),
                    onChanged: (value) {
                      setState(() {
                        vencimiento1.text = value.toString();
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
                    decoration: InputDecoration(labelText: 'Cantidad2'),
                    onChanged: (value) {
                      setState(() {
                        cantidad2.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.number, // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Acepta solo dígitos
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    controller: vencimiento2,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha2'),
                    // initialValue: DateTime.now(),
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
                    decoration: InputDecoration(labelText: 'Cantidad3'),
                    onChanged: (value) {
                      setState(() {
                        cantidad3.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.number, // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Acepta solo dígitos
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    controller: vencimiento3,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha3'),
                    // initialValue: DateTime.now(),
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
                    decoration: InputDecoration(labelText: 'Cantidad4'),
                    onChanged: (value) {
                      setState(() {
                        cantidad4.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.number, // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Acepta solo dígitos
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    controller: vencimiento4,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha4'),
                    // initialValue: DateTime.now(),
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
                    decoration: InputDecoration(labelText: 'Cantidad5'),
                    onChanged: (value) {
                      setState(() {
                        cantidad5.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.number, // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Acepta solo dígitos
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    controller: vencimiento5,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha5'),
                    // initialValue: DateTime.now(),
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
                    decoration: InputDecoration(labelText: 'Cantidad6'),
                    onChanged: (value) {
                      setState(() {
                        cantidad6.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.number, // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Acepta solo dígitos
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    controller: vencimiento6,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha6'),
                    // initialValue: DateTime.now(),
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
                    decoration: InputDecoration(labelText: 'Cantidad7'),
                    onChanged: (value) {
                      setState(() {
                        cantidad7.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.number, // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Acepta solo dígitos
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    controller: vencimiento7,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha7'),
                    // initialValue: DateTime.now(),
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
                    decoration: InputDecoration(labelText: 'Cantidad8'),
                    onChanged: (value) {
                      setState(() {
                        cantidad8.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.number, // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Acepta solo dígitos
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    controller: vencimiento8,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha8'),
                    // initialValue: DateTime.now(),
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
                    decoration: InputDecoration(labelText: 'Cantidad9'),
                    onChanged: (value) {
                      setState(() {
                        cantidad9.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.number, // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Acepta solo dígitos
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    controller: vencimiento9,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha9'),
                    // initialValue: DateTime.now(),
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
                    decoration: InputDecoration(labelText: 'Cantidad10'),
                    onChanged: (value) {
                      setState(() {
                        cantidad10.text = value!;
                        calcularTotal();
                      });
                    },
                    keyboardType: TextInputType.number, // Asegura que el teclado que se muestra sea numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Acepta solo dígitos
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FormBuilderDateTimePicker(
                    name: 'date',
                    controller: vencimiento10,
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha10'),
                    // initialValue: DateTime.now(),
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
