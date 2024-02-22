import 'package:hive_flutter/adapters.dart';
part 'Detalle.g.dart';

@HiveType(typeId: 2)
class Detalle {
  @HiveField(0)
  String? cantidad;
  @HiveField(1)
  String? vencimiento;
  Detalle({this.cantidad, this.vencimiento});
  Map<String, dynamic> toJson() {
    return {
      'cantidad': cantidad,
      'vencimiento': vencimiento,
    };
  }
}