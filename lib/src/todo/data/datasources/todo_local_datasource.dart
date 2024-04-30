import 'package:todos_app/core/error/exceptions.dart';
import 'package:todos_app/src/todo/data/datasources/todo_database_helper.dart';
import 'package:todos_app/src/todo/domain/entities/todo_entity.dart';

/// Interface for local data source of Todo entity
abstract interface class TodoLocalDataSource {
  /// Get all Todo entities from local data source
  Future<List<TodoEntity>> getTodos();

  /// Add a Todo entity to local data source
  Future<TodoEntity> addTodo(TodoEntity todo);

  /// Update a Todo entity in local data source
  Future<bool> updateTodo(TodoEntity todo);

  /// Delete a Todo entity from local data source
  Future<bool> deleteTodo(int id);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final TodoDatabaseHelper todoDatabaseHelper;
  TodoLocalDataSourceImpl(this.todoDatabaseHelper);

  @override
  Future<List<TodoEntity>> getTodos() async {
    try {
      return await todoDatabaseHelper.getAllTodosLocal();
    } catch (e) {
      throw LocalServerException(e.toString());
    }
  }

  @override
  Future<TodoEntity> addTodo(TodoEntity todo) async {
    try {
      return await todoDatabaseHelper.insertTodoLocal(todo);
    } catch (e) {
      throw LocalServerException(e.toString());
    }
  }

  @override
  Future<bool> updateTodo(TodoEntity todo) async {
    try {
      return await todoDatabaseHelper.updateTodoLocal(todo);
    } catch (e) {
      throw LocalServerException(e.toString());
    }
  }

  @override
  Future<bool> deleteTodo(int id) async {
    try {
      return await todoDatabaseHelper.removeTodoLocal(id);
    } catch (e) {
      throw LocalServerException(e.toString());
    }
  }
}
