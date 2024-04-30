import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todos_app/core/annotations/freezed_annotations.dart';
import 'package:todos_app/src/todo/domain/entities/todo_entity.dart';
import 'package:todos_app/src/todo/domain/usecases/add_todo_use_case.dart';
import 'package:todos_app/src/todo/domain/usecases/delete_todo_use_case.dart';
import 'package:todos_app/src/todo/domain/usecases/get_all_todos_use_case.dart';
import 'package:todos_app/src/todo/domain/usecases/update_todo_use_case.dart';

part 'todo_cubit.freezed.dart';
part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final GetAllTodosUseCase _getAllTodosUseCase;
  final AddTodoUseCase _addTodoUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;

  TodoCubit({
    required GetAllTodosUseCase getAllTodosUseCase,
    required AddTodoUseCase addTodoUseCase,
    required UpdateTodoUseCase updateTodoUseCase,
    required DeleteTodoUseCase deleteTodoUseCase,
  })  : _getAllTodosUseCase = getAllTodosUseCase,
        _addTodoUseCase = addTodoUseCase,
        _updateTodoUseCase = updateTodoUseCase,
        _deleteTodoUseCase = deleteTodoUseCase,
        super(TodoState.init);

  Future<void> fetchAllBlogs() async {
    emit(state.copyWith(fetchingStatus: TodoStatus.loading));
    final res = await _getAllTodosUseCase.call();

    res.fold(
      (error) => emit(state.copyWith(fetchingStatus: TodoStatus.error, error: error)),
      (data) => emit(state.copyWith(fetchingStatus: TodoStatus.success, todos: data)),
    );
  }

  Future<void> addTodo(TodoEntity todo) async {
    emit(state.copyWith(addingStatus: TodoStatus.loading));

    final res = await _addTodoUseCase.call(todo);

    res.fold(
      (error) => emit(state.copyWith(
        addingStatus: TodoStatus.error,
        error: error,
      )),
      (data) => emit(state.copyWith(
        addingStatus: TodoStatus.success,
        todos: [data, ...state.todos],
      )),
    );
  }

  Future<void> updateTodo(TodoEntity todo) async {
    emit(state.copyWith(updatingStatus: TodoStatus.loading));

    final res = await _updateTodoUseCase.call(todo);

    res.fold(
      (error) => emit(state.copyWith(
        updatingStatus: TodoStatus.error,
        error: error,
      )),
      (_) => emit(state.copyWith(
        updatingStatus: TodoStatus.success,
      )),
    );
  }

  Future<void> deleteTodo(TodoEntity todo) async {
    emit(state.copyWith(deletingStatus: TodoStatus.loading));

    final res = await _deleteTodoUseCase.call(todo.id);

    res.fold(
      (error) => emit(state.copyWith(
        deletingStatus: TodoStatus.error,
        error: error,
      )),
      (_) => emit(state.copyWith(
        deletingStatus: TodoStatus.success,
        lastDeletedTodos: todo,
        todos: state.todos.where((t) => t.id != todo.id).toList(),
      )),
    );
  }
}
