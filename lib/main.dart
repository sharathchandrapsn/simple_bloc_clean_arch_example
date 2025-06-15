import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/data/data_source/get_data_source.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/data/repository/get_repository_impl.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/domain/usecases/get_usecase.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/presentation/bloc/posts_bloc.dart';
import 'package:simple_bloc_clean_arch_example/features/get_posts/presentation/pages/home_screen.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/data/data_source/person_data_source.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/data/repo_impl/person_repo_impl.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/domain/usecases/person_usecase.dart';
import 'package:simple_bloc_clean_arch_example/features/update_posts/presentation/bloc/person_bloc.dart';

import 'dependency_injection/service_locator.dart' as di;
import 'dependency_injection/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.getIt();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => sl<PersonBloc>()..add(LoadPersonsEvent())),
    BlocProvider(create: (_) => sl<PostsBloc>()..add(GetPostsEvent()))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Global Theme
        dividerColor: Colors.transparent, // Removes ExpansionTile lines
        expansionTileTheme: const ExpansionTileThemeData(
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          iconColor: Colors.blue,
          collapsedIconColor: Colors.blue,
          textColor: Colors.blue,
          collapsedTextColor: Colors.blue,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
