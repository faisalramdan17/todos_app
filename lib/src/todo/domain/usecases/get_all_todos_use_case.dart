import 'package:dartz/dartz.dart';
import 'package:todos_app/core/usecase/usecase.dart';
import 'package:todos_app/src/todo/domain/entities/todo_entity.dart';
import 'package:todos_app/src/todo/domain/repositories/todo_repository.dart';

class GetAllTodosUseCase implements FutureUseCaseNoParams<List<TodoEntity>> {
  final TodoRepository blogRepository;

  GetAllTodosUseCase(this.blogRepository);

  @override
  Future<Either<Exception, List<TodoEntity>>> call() async {
    return await blogRepository.getAllTodos();
  }
}
