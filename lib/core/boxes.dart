import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_perfect/domain/entities/random_file_entity.dart';

class Boxes {
  static Box<RandomFileEntity> saveFile() =>
      Hive.box<RandomFileEntity>('random_file');
}
