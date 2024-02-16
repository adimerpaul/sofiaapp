// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Detalle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetalleAdapter extends TypeAdapter<Detalle> {
  @override
  final int typeId = 2;

  @override
  Detalle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Detalle(
      cantidad: fields[0] as String?,
      vencimiento: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Detalle obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.cantidad)
      ..writeByte(1)
      ..write(obj.vencimiento);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetalleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
