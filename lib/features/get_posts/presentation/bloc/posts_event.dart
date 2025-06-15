part of 'posts_bloc.dart';

sealed class PostsEvent {}

final class GetPostsEvent extends PostsEvent {}

final class AddPostsEvent extends PostsEvent {
  final UserModel userModel;
  AddPostsEvent(this.userModel);
}
