import 'package:dartz/dartz.dart';
import 'package:pet_perfect/core/error/failure.dart';
import 'package:pet_perfect/domain/entities/random_file_entity.dart';
import 'package:pet_perfect/domain/repositories/main_repository.dart';

class GetRandomFileUseCase {
  MainRepository mainRepository;

  GetRandomFileUseCase({required this.mainRepository});

  Future<Either<Failure, RandomFileEntity>> call() async {
    return await mainRepository.getRandomFiles();
  }
}
