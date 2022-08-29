import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_perfect/data/data_sources/main_data_source.dart';
import 'package:pet_perfect/domain/entities/random_file_entity.dart';
import 'package:pet_perfect/domain/use_cases/get_random_file_use_case.dart';
import 'package:pet_perfect/presentation/bloc/random_file_bloc/random_file_bloc.dart';

class MockMainDataSource extends MockBloc implements MainDataSource {}

class MockGetRandomFileUseCase extends MockBloc
    implements GetRandomFileUseCase {}

void main() {
  MockMainDataSource mockMainDataSource;
  MockGetRandomFileUseCase mockGetRandomFileUseCase;
  setUp(() {
    mockMainDataSource = MockMainDataSource();
    mockGetRandomFileUseCase = MockGetRandomFileUseCase();
  });

  group('GetPosts', () {
    final randomFile = RandomFileEntity(fileSizeBytes: 1212, url: '');
    mockMainDataSource = MockMainDataSource();
    mockGetRandomFileUseCase = MockGetRandomFileUseCase();

    blocTest<RandomFileBloc, RandomFileState>(
      'emits [RandomFileLoading, RandomFileSucess] when successfull.',
      build: () =>
          RandomFileBloc(getRandomFileUseCase: mockGetRandomFileUseCase),
      act: (bloc) => bloc.add(GetRandomFile()),
      expect: () => [
        RandomFileLoading(),
        RandomFileSuccess(randomFileEntity: randomFile),
      ],
    );
  });
}
