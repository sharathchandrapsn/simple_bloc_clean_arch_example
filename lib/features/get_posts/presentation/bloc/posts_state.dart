part of 'posts_bloc.dart';

abstract class PostsState {}

final class PostsInitialState extends PostsState {}

final class PostsLoadingState extends PostsState {}

final class PostsSuccessState extends PostsState {
  final List<UserEntity> userEntityList;

  PostsSuccessState(this.userEntityList);
}

final class PostsFailureState extends PostsState {
  final String errorMsg;

  PostsFailureState(this.errorMsg);
}


