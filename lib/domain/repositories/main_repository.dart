import 'package:dartz/dartz.dart';
import 'package:pet_perfect/core/error/failure.dart';
import 'package:pet_perfect/domain/entities/post_entity.dart';
import 'package:pet_perfect/domain/entities/random_file_entity.dart';

abstract class MainRepository {
  Future<Either<Failure, List<PostEntity?>>> getPosts();
  Future<Either<Failure, RandomFileEntity>> getRandomFiles();
}
