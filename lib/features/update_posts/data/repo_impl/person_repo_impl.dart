import 'package:simple_bloc_clean_arch_example/features/update_posts/data/data_source/person_data_source.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/domain/entities/person.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/domain/repos/person_repo.dart';

import '../models/person_model.dart';

class PersonRepoImpl implements PersonRepo {
  PersonDataSource personDataSource;
  PersonRepoImpl(this.personDataSource);
  @override
  Future<List<Person>> getPersons() async {
    List<PersonModel> personList = await personDataSource.fetchPersons();
    return personList
        .map((e) => Person(e.id, e.name, e.username, e.email))
        .toList();
  }
}
