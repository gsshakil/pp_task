import 'package:pet_perfect/data/models/post_model.dart';
import 'package:pet_perfect/data/models/random_file_model.dart';
import 'package:pet_perfect/domain/entities/random_file_entity.dart';

abstract class MainDataSource {
  Future<RandomFileModel> getRandomFiles();
  Future<List<PostModel>> getPosts();
}
