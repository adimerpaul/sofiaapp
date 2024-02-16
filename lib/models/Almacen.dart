import 'package:hive/hive.dart';
part 'Almacen.g.dart';

@HiveType(typeId: 1)
class Almacen {
  @HiveField(0)
  int id;
  @HiveField(1)
  String? codigo;
  @HiveField(2)
  String? codigoProducto;
  @HiveField(3)
  String? producto;
  @HiveField(4)
  String? unidad;
  @HiveField(5)
  int? saldo;
  @HiveField(6)
  DateTime? registro;
  @HiveField(7)
  DateTime? vencimiento;
  @HiveField(8)
  String? grupo;
  @HiveField(9)
  String? estado;
  @HiveField(10)
  int? cantidad;
  @HiveField(11)
  List<dynamic>? detalle;

  Almacen({required this.id, this.codigo, this.codigoProducto, this.producto, this.unidad, this.saldo, this.registro, this.vencimiento, this.grupo, this.estado, this.cantidad, this.detalle});
}