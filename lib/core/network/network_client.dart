import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class NetworkClient {
  Future<dynamic> post({required PostParamas paramas});
  Future<String> get({required NetworkParams paramas});
}

class NetworkParams extends Equatable {
  final String endPoint;
  final String? contentType;
  final Map<String, dynamic>? headers;

  const NetworkParams({required this.endPoint, this.headers, this.contentType});

  @override
  List<Object?> get props => [this.endPoint, this.contentType, this.headers];
}

class PostParamas extends NetworkParams {
  final body;
  final String? contentType;
  final bool isJsonBody;
  const PostParamas(
      {required String endPoint,
      Map<String, dynamic>? headers,
      this.isJsonBody = false,
      this.body,
      this.contentType})
      : super(endPoint: endPoint, headers: headers);
}

class UploadParams extends PostParamas {
  final File file;

  UploadParams({required this.file, required body, String? contentType})
      : super(body: body, contentType: contentType, endPoint: '');
}
