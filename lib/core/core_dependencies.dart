part of 'package:todos_app/main_dependencies.dart';

void _initCoreDependencies() {
  serviceLocator.registerLazySingleton<ErrorHandler>(
    () => ErrorHandlerImpl(),
  );
}
