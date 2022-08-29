import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'random_file_entity.g.dart';

@HiveType(typeId: 0)
class RandomFileEntity extends Equatable {
  @HiveField(0)
  final int fileSizeBytes;

  @HiveField(1)
  final String url;

  const RandomFileEntity({
    required this.fileSizeBytes,
    required this.url,
  });
  @override
  List<Object?> get props => [fileSizeBytes, url];
}
