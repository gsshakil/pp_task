import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pet_perfect/core/error/exceptions.dart';
import 'network_client.dart';

class DioNetworkClientImpl implements NetworkClient {
  final Dio dio;

  DioNetworkClientImpl({required this.dio});

  @override
  Future<String> get({required NetworkParams paramas}) async {
    Response response;
    try {
      response = await dio.get(
        paramas.endPoint,
        options: Options(
          headers: paramas.headers,
          contentType: paramas.contentType,
        ),
      );

      return jsonEncode(response.data);
    } on DioError catch (e) {
      throw ServerException(
        errorMessage: e.message,
        errorData:
            e.response != null ? e.response!.data : e.requestOptions.data,
      );
    }
  }

  @override
  Future<dynamic> post({required PostParamas paramas}) async {
    Response response;
    try {
      var formData;
      if (paramas.body != null) {
        if (paramas.isJsonBody) {
          formData = jsonEncode(paramas.body);
        } else {
          formData = FormData.fromMap(paramas.body);
        }
      }
      response = await dio.post(
        paramas.endPoint,
        data: formData,
        options: Options(
          contentType: paramas.contentType,
          headers: paramas.headers,
        ),
      );

      return response.data;
    } on DioError catch (e) {
      if (kDebugMode) print('post exception is $e');
      if (e.type == DioErrorType.other) {
        throw ServerException(errorMessage: 'No Internet connection!');
      } else if (e.type == DioErrorType.response) {
        return e.response!.data;
      } else {
        throw ServerException(
            errorMessage: e.message,
            errorData:
                e.response != null ? e.response!.data : e.requestOptions.data);
      }
    }
  }
}
