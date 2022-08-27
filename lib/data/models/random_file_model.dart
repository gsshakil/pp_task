import 'package:pet_perfect/domain/entities/post_entity.dart';
import 'package:pet_perfect/domain/entities/random_file_entity.dart';

class RandomFileModel extends RandomFileEntity {
  const RandomFileModel({
    required super.fileSizeBytes,
    required super.url,
  });

  factory RandomFileModel.fromJson(Map<String, dynamic> json) {
    return RandomFileModel(
      fileSizeBytes: json["fileSizeBytes"],
      url: json["url"],
    );
  }
}
