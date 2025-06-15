import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/data/models/user_model.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/presentation/bloc/posts_bloc.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/presentation/pages/person_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
        if (state is PostsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PostsSuccessState) {
          return ListView.builder(
              itemCount: state.userEntityList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const PersonScreen(),
                    //   ),
                    // );
                    UserModel userModel = UserModel(
                        id: 1,
                        title: "title112",
                        userId: 112,
                        body: "body112");
                    context.read<PostsBloc>().add(AddPostsEvent(userModel));
                  },
                  child: Card(
                    elevation: 5,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.userEntityList[index].id.toString()!,
                            style: const TextStyle(color: Colors.blue),
                          ),
                          Text(
                            state.userEntityList[index].title!,
                            style: const TextStyle(color: Colors.green),
                          ),
                          Text(
                            state.userEntityList[index].body!
                                .toString()
                                .replaceAll("\n", ", "),
                            style: TextStyle(color: Colors.redAccent.shade100),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else if (state is PostsFailureState) {
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
      //       context.read<PostsBloc>().add(GetPostsEvent());
      //     }),
    );
  }
}
