import '../entities/person.dart';

abstract class PersonRepo {
 Future<List<Person>> getPersons();
}
