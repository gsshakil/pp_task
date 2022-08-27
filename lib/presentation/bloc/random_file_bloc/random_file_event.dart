part of 'random_file_bloc.dart';

abstract class RandomFileEvent extends Equatable {
  const RandomFileEvent();

  @override
  List<Object> get props => [];
}

class GetRandomFile extends RandomFileEvent {}
