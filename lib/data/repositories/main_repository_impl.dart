import 'package:pet_perfect/core/error/exceptions.dart';
import 'package:pet_perfect/data/data_sources/main_data_source.dart';
import 'package:pet_perfect/data/models/post_model.dart';
import 'package:pet_perfect/data/models/random_file_model.dart';
import 'package:pet_perfect/domain/entities/random_file_entity.dart';
import 'package:pet_perfect/domain/entities/post_entity.dart';
import 'package:pet_perfect/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pet_perfect/domain/repositories/main_repository.dart';

class MainRepositoryImpl extends MainRepository {
  MainDataSource mainDataSource;
  MainRepositoryImpl({required this.mainDataSource});

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    try {
      List<PostModel> result = await mainDataSource.getPosts();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessage, code: e.code));
    }
  }

  @override
  Future<Either<Failure, RandomFileEntity>> getRandomFiles() async {
    try {
      RandomFileModel result = await mainDataSource.getRandomFiles();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessage, code: e.code));
    }
  }
}
