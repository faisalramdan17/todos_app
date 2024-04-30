part of 'todo_cubit.dart';

enum TodoStatus {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == initial;
  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
  bool get isError => this == error;
}

@freezedState
class TodoState with _$TodoState {
  const factory TodoState({
    @Default(TodoStatus.initial) TodoStatus fetchingStatus,
    @Default(TodoStatus.initial) TodoStatus addingStatus,
    @Default(TodoStatus.initial) TodoStatus updatingStatus,
    @Default(TodoStatus.initial) TodoStatus deletingStatus,
    @Default([]) List<TodoEntity> todos,
    TodoEntity? lastDeletedTodos,
    Exception? error,
  }) = _TodoState;

  const TodoState._();
  static const TodoState init = TodoState();
}
