import 'package:simple_bloc_clean_arch_example/features/get_posts/domain/repositories/get_repository.dart';

import '../entities/user_entity.dart';

class GetUsecase {
  final GetRepository getRepository;
  GetUsecase(this.getRepository);

  Future<List<UserEntity>> call() async {
    return await getRepository.getPosts();
  }
}
