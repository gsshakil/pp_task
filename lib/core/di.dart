import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_perfect/core/network/dio_network_client_impl.dart';
import 'package:pet_perfect/core/network/network_client.dart';
import 'package:pet_perfect/data/data_sources/main_data_source.dart';
import 'package:pet_perfect/data/data_sources/main_data_source_impl.dart';
import 'package:pet_perfect/data/repositories/main_repository_impl.dart';
import 'package:pet_perfect/domain/repositories/main_repository.dart';
import 'package:pet_perfect/domain/use_cases/get_post_use_case.dart';
import 'package:pet_perfect/domain/use_cases/get_random_file_use_case.dart';
import 'package:pet_perfect/presentation/bloc/post_bloc/post_bloc.dart';
import 'package:pet_perfect/presentation/bloc/random_file_bloc/random_file_bloc.dart';

final injector = GetIt.instance;

Future<void> injectDependencies() async {
  injector.registerLazySingleton<Dio>(() => Dio());

  injector.registerLazySingleton<NetworkClient>(
      () => DioNetworkClientImpl(dio: injector()));

  injector.registerLazySingleton<MainDataSource>(
      () => MainDataSourceImpl(networkClient: injector()));

  injector.registerLazySingleton<MainRepository>(
      () => MainRepositoryImpl(mainDataSource: injector()));

  injector.registerLazySingleton<GetPostsUseCase>(
      () => GetPostsUseCase(mainRepository: injector()));

  injector.registerLazySingleton<GetRandomFileUseCase>(
      () => GetRandomFileUseCase(mainRepository: injector()));

  injector.registerLazySingleton<PostBloc>(
      () => PostBloc(getPostsUseCase: injector()));

  injector.registerLazySingleton<RandomFileBloc>(
      () => RandomFileBloc(getRandomFileUseCase: injector()));
}
