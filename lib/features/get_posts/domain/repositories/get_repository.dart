import 'package:simple_bloc_clean_arch_example/features/get_posts/data/models/user_model.dart';

import '../entities/user_entity.dart';

abstract class GetRepository {
  Future<List<UserEntity>> getPosts();
  Future<UserEntity> addPost(UserModel userModel);
}
