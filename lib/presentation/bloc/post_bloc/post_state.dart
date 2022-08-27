part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostError extends PostState {
  final String error;
  const PostError({required this.error});
}

class PostSuccess extends PostState {
  final List<PostEntity?> postEntity;

  const PostSuccess({required this.postEntity});
}
