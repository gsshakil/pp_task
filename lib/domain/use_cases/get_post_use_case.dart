import 'package:dartz/dartz.dart';
import 'package:pet_perfect/core/error/failure.dart';
import 'package:pet_perfect/domain/entities/post_entity.dart';
import 'package:pet_perfect/domain/repositories/main_repository.dart';

class GetPostsUseCase {
  MainRepository mainRepository;

  GetPostsUseCase({required this.mainRepository});

  Future<Either<Failure, List<PostEntity?>>> call() async {
    return await mainRepository.getPosts();
  }
}
