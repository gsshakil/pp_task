part of 'random_file_bloc.dart';

abstract class RandomFileState extends Equatable {
  const RandomFileState();

  @override
  List<Object> get props => [];
}

class RandomFileInitial extends RandomFileState {}

class RandomFileLoading extends RandomFileState {}

class RandomFileError extends RandomFileState {
  final String error;
  const RandomFileError({required this.error});
}

class RandomFileSuccess extends RandomFileState {
  final RandomFileEntity randomFileEntity;

  const RandomFileSuccess({required this.randomFileEntity});
}
