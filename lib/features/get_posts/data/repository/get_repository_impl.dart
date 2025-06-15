import 'package:simple_bloc_clean_arch_example/features/get_posts/data/models/user_model.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/domain/repositories/get_repository.dart';

import '../../domain/entities/user_entity.dart';
import '../data_source/get_data_source.dart';

class GetRepositoryImpl implements GetRepository {
  GetDataSource getDataSource;
  GetRepositoryImpl(this.getDataSource);

  @override
  Future<List<UserEntity>> getPosts() async {
    final List<UserModel> userModelList = await getDataSource.fetchPosts();
    return userModelList
        .map((post) => UserEntity(
            id: post.id,
            userId: post.userId,
            title: post.title,
            body: post.body))
        .toList();
  }

  @override
  Future<UserEntity> addPost(UserModel userModel) async {
    final userModelList = await getDataSource.addPost(userModel);
    // return userModelList
    //     .map((post) => UserEntity(
    //         id: post.id,
    //         userId: post.userId,
    //         title: post.title,
    //         body: post.body))
    //     .toList();
    return UserEntity(
        id: userModelList.id,
        userId: userModelList.userId,
        title: userModelList.title,
        body: userModelList.body);
  }
}
