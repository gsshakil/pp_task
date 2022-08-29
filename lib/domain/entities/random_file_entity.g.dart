// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_file_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RandomFileEntityAdapter extends TypeAdapter<RandomFileEntity> {
  @override
  final int typeId = 0;

  @override
  RandomFileEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RandomFileEntity(
      fileSizeBytes: fields[0] as int,
      url: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RandomFileEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fileSizeBytes)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RandomFileEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
