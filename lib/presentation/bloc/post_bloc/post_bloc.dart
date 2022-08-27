import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pet_perfect/core/error/failure.dart';
import 'package:pet_perfect/domain/entities/post_entity.dart';
import 'package:pet_perfect/domain/use_cases/get_post_use_case.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostsUseCase getPostsUseCase;
  PostBloc({required this.getPostsUseCase}) : super(PostInitial()) {
    on<GetPosts>((event, emit) async {
      emit(PostLoading());
      Either<Failure, List<PostEntity?>> result = await getPostsUseCase();
      result.fold((l) => emit(PostError(error: l.message)), (r) {
        emit(PostSuccess(postEntity: r));
      });
    });
  }
}
