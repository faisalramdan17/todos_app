import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/core/core.dart';
import 'package:todos_app/main_dependencies.dart';
import 'package:todos_app/src/todo/presentation/cubit/todo_cubit.dart';
import 'package:todos_app/src/todo/presentation/screens/todo_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<TodoCubit>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo-List App',
      theme: AppTheme.darkThemeMode,
      home: const TodoListScreen(),
    );
  }
}
