import 'package:dartz/dartz.dart';
import 'package:todos_app/src/todo/domain/entities/todo_entity.dart';

abstract interface class TodoRepository {
  /// Adds a new TodoEntity to the data source.
  ///
  /// The [todo] is the TodoEntity to be added.
  ///
  /// Returns a Future that completes when the TodoEntity has been added.
  /// The returned TodoEntity contains the id of the newly added TodoEntity.
  Future<Either<Exception, TodoEntity>> addTodo(TodoEntity todo);

  /// Updates an existing TodoEntity in the data source.
  ///
  /// The [todo] is the TodoEntity to be updated.
  ///
  /// Returns a Future that completes when the TodoEntity has been updated.
  /// The returned TodoEntity contains the updated data.
  Future<Either<Exception, bool>> updateTodo(TodoEntity todo);

  /// Deletes a TodoEntity from the data source.
  ///
  /// The [id] is the id of the TodoEntity to be deleted.
  ///
  /// Returns a Future that completes when the TodoEntity has been deleted.
  /// The returned boolean value indicates whether the deletion was successful.
  Future<Either<Exception, bool>> deleteTodo(int id);

  /// Retrieves all Todos from the data source.
  ///
  /// Returns a Future that completes when all Todos have been retrieved.
  /// The returned List of TodoEntity objects contains all the Todos in the data source.
  Future<Either<Exception, List<TodoEntity>>> getAllTodos();
}
