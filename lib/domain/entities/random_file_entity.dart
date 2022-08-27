import 'package:equatable/equatable.dart';

class RandomFileEntity extends Equatable {
  final int fileSizeBytes;
  final String url;

  const RandomFileEntity({
    required this.fileSizeBytes,
    required this.url,
  });
  @override
  List<Object?> get props => [fileSizeBytes, url];
}
