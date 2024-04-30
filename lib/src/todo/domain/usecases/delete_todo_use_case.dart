import 'package:dartz/dartz.dart';
import 'package:todos_app/core/usecase/usecase.dart';
import 'package:todos_app/src/todo/domain/repositories/todo_repository.dart';

class DeleteTodoUseCase implements FutureUseCase<bool, int> {
  final TodoRepository blogRepository;

  DeleteTodoUseCase(this.blogRepository);

  @override
  Future<Either<Exception, bool>> call(int id) async {
    return await blogRepository.deleteTodo(id);
  }
}
