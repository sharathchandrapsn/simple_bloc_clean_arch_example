import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/presentation/bloc/person_bloc.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Person Screen"),
      ),
      body: BlocBuilder<PersonBloc, PersonState>(builder: (context, state) {
        if (state is PersonLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PersonSuccessState) {
          return ListView.builder(
              itemCount: state.persons.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text(
                                  state.persons[index].name!,
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Text(
                                      state.persons[index].email!
                                          .toString()
                                          .replaceAll("\n", ", "),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                  ),
                );
              });
        } else if (state is PersonErrorState) {
          return Center(
            child: Text(state.errorMsg),
          );
        } else {
          return Container();
        }
      }),
      // floatingActionButton: FloatingActionButton(
      //     child: const Icon(
      //       Icons.add,
      //     ),
      //     onPressed: () {
      //       context.read<PersonBloc>().add(LoadPersonsEvent());
      //     }),
    );
  }
}
