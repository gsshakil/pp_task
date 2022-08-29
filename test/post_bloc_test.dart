import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_perfect/data/data_sources/main_data_source.dart';
import 'package:pet_perfect/data/models/random_file_model.dart';
import 'package:pet_perfect/data/models/post_model.dart';
import 'package:pet_perfect/domain/entities/post_entity.dart';
import 'package:pet_perfect/domain/repositories/main_repository.dart';
import 'package:pet_perfect/domain/use_cases/get_post_use_case.dart';
import 'package:pet_perfect/presentation/bloc/post_bloc/post_bloc.dart';

class MockMainDataSource extends MockBloc implements MainDataSource {}

class MockGetPostUseCase extends MockBloc implements GetPostsUseCase {}

void main() {
  MockMainDataSource mockMainDataSource;
  MockGetPostUseCase mockGetPostUseCase;
  setUp(() {
    mockMainDataSource = MockMainDataSource();
    mockGetPostUseCase = MockGetPostUseCase();
  });

  group('GetPosts', () {
    final posts = [
      PostEntity(userId: 1, id: 1, title: 'qui est esse', body: 'body'),
    ];
    mockMainDataSource = MockMainDataSource();
    mockGetPostUseCase = MockGetPostUseCase();

    blocTest<PostBloc, PostState>(
      'emits [PostsLoading, PostsSucess] when successfull.',
      build: () => PostBloc(getPostsUseCase: mockGetPostUseCase),
      act: (bloc) => bloc.add(GetPosts()),
      expect: () => [
        PostLoading(),
        PostSuccess(postEntity: posts),
      ],
    );
  });
}
