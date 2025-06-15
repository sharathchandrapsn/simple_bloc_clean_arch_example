import 'package:simple_bloc_clean_arch_example/features/get_posts/data/models/user_model.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/domain/repositories/get_repository.dart';

import '../entities/user_entity.dart';

class AddUsecase {
  final GetRepository getRepository;
  AddUsecase(this.getRepository);

  Future<UserEntity> call(UserModel userModel) async {
    return await getRepository.addPost(userModel);
  }
}
