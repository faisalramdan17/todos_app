part of 'package:todos_app/main_dependencies.dart';

void _initTodoDependencies() {
  serviceLocator

    // Data Sources
    ..registerLazySingleton(() => TodoDatabaseHelper())
    ..registerLazySingleton<TodoLocalDataSource>(
      () => TodoLocalDataSourceImpl(serviceLocator()),
    )

    // Repository
    ..registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )

    // Use Cases
    ..registerFactory(() => GetAllTodosUseCase(serviceLocator()))
    ..registerFactory(() => AddTodoUseCase(serviceLocator()))
    ..registerFactory(() => UpdateTodoUseCase(serviceLocator()))
    ..registerFactory(() => DeleteTodoUseCase(serviceLocator()))

    // Bloc
    ..registerLazySingleton(
      () => TodoCubit(
        getAllTodosUseCase: serviceLocator(),
        addTodoUseCase: serviceLocator(),
        updateTodoUseCase: serviceLocator(),
        deleteTodoUseCase: serviceLocator(),
      ),
    );
}
