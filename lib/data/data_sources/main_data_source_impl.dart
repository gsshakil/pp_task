import 'dart:convert';
import 'dart:developer';

import 'package:pet_perfect/core/api_endpoints.dart';
import 'package:pet_perfect/core/network/network_client.dart';
import 'package:pet_perfect/data/data_sources/main_data_source.dart';
import 'package:pet_perfect/data/models/random_file_model.dart';
import 'package:pet_perfect/data/models/post_model.dart';

class MainDataSourceImpl extends MainDataSource {
  final NetworkClient networkClient;

  MainDataSourceImpl({required this.networkClient});

  //Get Posts
  @override
  Future<List<PostModel>> getPosts() async {
    String result = await networkClient.get(
        paramas: const NetworkParams(endPoint: APIEndPoints.postEndPoint));
    List<PostModel> response = List<PostModel>.from(
        json.decode(result).map((x) => PostModel.fromJson(x)));

    return response;
  }

  //Get Random Files
  @override
  Future<RandomFileModel> getRandomFiles() async {
    String result = await networkClient.get(
        paramas:
            const NetworkParams(endPoint: APIEndPoints.randomFileEndPoint));
    log('Random File Result: $result');
    RandomFileModel response = RandomFileModel.fromJson(jsonDecode(result));
    return response;
  }
}
