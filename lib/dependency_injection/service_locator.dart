import 'package:get_it/get_it.dart';
import 'package:simple_bloc_clean_arch_example/core/network/dio_client.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/data/data_source/get_data_source.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/data/repository/get_repository_impl.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/domain/repositories/get_repository.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/domain/usecases/add_usecase.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/domain/usecases/get_usecase.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/presentation/bloc/posts_bloc.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/data/data_source/person_data_source.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/data/repo_impl/person_repo_impl.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/domain/entities/person.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/domain/repos/person_repo.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/domain/usecases/person_usecase.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/presentation/bloc/person_bloc.dart';

var sl = GetIt.instance;

Future<void> getIt() async {
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<PostsBloc>(() => PostsBloc(sl(), sl()));
  sl.registerLazySingleton<PersonBloc>(() => PersonBloc(sl()));

  sl.registerLazySingleton<PersonDataSource>(() => PersonDataSource(sl()));
  sl.registerLazySingleton<PersonRepo>(() => PersonRepoImpl(sl()));
  sl.registerLazySingleton<PersonUseCase>(() => PersonUseCase(sl()));

  sl.registerLazySingleton<GetDataSource>(() => GetDataSource(sl()));
  sl.registerLazySingleton<GetRepository>(() => GetRepositoryImpl(sl()));
  sl.registerLazySingleton<GetUsecase>(() => GetUsecase(sl()));

  sl.registerLazySingleton<AddUsecase>(() => AddUsecase(sl()));
}
