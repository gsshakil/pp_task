import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pet_perfect/core/error/failure.dart';
import 'package:pet_perfect/domain/entities/random_file_entity.dart';
import 'package:pet_perfect/domain/use_cases/get_random_file_use_case.dart';

part 'random_file_event.dart';
part 'random_file_state.dart';

class RandomFileBloc extends Bloc<RandomFileEvent, RandomFileState> {
  final GetRandomFileUseCase getRandomFileUseCase;
  RandomFileBloc({required this.getRandomFileUseCase})
      : super(RandomFileInitial()) {
    on<GetRandomFile>((event, emit) async {
      emit(RandomFileLoading());
      Either<Failure, RandomFileEntity> result = await getRandomFileUseCase();
      result.fold((l) => emit(RandomFileError(error: l.message)), (r) {
        emit(RandomFileSuccess(randomFileEntity: r));
      });
    });
  }
}
