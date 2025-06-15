part of 'person_bloc.dart';

abstract class PersonState {}

final class PersonInitial extends PersonState {}

final class PersonLoadingState extends PersonState {}

final class PersonSuccessState extends PersonState {
  final List<Person> persons;
  PersonSuccessState(this.persons);
}

final class PersonErrorState extends PersonState {
final String errorMsg;
PersonErrorState(this.errorMsg);
}
