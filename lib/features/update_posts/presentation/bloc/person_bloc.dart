import 'package:bloc/bloc.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/domain/usecases/person_usecase.dart';

import '../../domain/entities/person.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonUseCase personUseCase;
  PersonBloc(this.personUseCase) : super(PersonInitial()) {
    on<PersonEvent>((event, emit) async {
      emit(PersonLoadingState());
      try {
        var list = await personUseCase();
        emit(PersonSuccessState(list));
      } catch (e) {
        emit(PersonErrorState(e.toString()));
      }
    });
  }
}
