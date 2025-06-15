import 'package:simple_bloc_clean_arch_example/features/update_posts/domain/repos/person_repo.dart';

import '../entities/person.dart';

class PersonUseCase {
  final PersonRepo personRepo;
  PersonUseCase(this.personRepo);

  Future<List<Person>> call() async {
    return await personRepo.getPersons();
  }
}
