import 'package:get_it/get_it.dart';
import 'package:todos_app/core/core.dart';
import 'package:todos_app/src/todo/data/datasources/todo_database_helper.dart';
import 'package:todos_app/src/todo/data/datasources/todo_local_datasource.dart';
import 'package:todos_app/src/todo/data/repositories/todo_repository_impl.dart';
import 'package:todos_app/src/todo/domain/repositories/todo_repository.dart';
import 'package:todos_app/src/todo/domain/usecases/add_todo_use_case.dart';
import 'package:todos_app/src/todo/domain/usecases/delete_todo_use_case.dart';
import 'package:todos_app/src/todo/domain/usecases/get_all_todos_use_case.dart';
import 'package:todos_app/src/todo/domain/usecases/update_todo_use_case.dart';
import 'package:todos_app/src/todo/presentation/cubit/todo_cubit.dart';

part 'package:todos_app/core/core_dependencies.dart';
part 'package:todos_app/src/todo/todo_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initCoreDependencies();
  _initTodoDependencies();
}
