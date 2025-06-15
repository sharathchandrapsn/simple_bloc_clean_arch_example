import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/data/models/user_model.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/domain/entities/user_entity.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/domain/usecases/add_usecase.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/domain/usecases/get_usecase.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetUsecase getUsecase;
  final AddUsecase addUsecase;

  PostsBloc(this.getUsecase, this.addUsecase) : super(PostsInitialState()) {
    on<GetPostsEvent>((event, emit) async {
      emit(PostsLoadingState());
      try {
        final data = await getUsecase();
        emit(PostsSuccessState(data));
      } catch (e) {
        emit(PostsFailureState(e.toString()));
      }
    });

    on<AddPostsEvent>((event, emit) async {
      // emit(PostsLoadingState());
      try {
        final userModel = await addUsecase(event.userModel);
        var addState = state as PostsSuccessState;
        var data = addState.userEntityList;
        data.add(userModel);
        emit(PostsSuccessState(data));
      } catch (e) {
        emit(PostsFailureState(e.toString()));
      }
    });
  }
}
