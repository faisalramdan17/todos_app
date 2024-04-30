// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodoState {
  TodoStatus get fetchingStatus => throw _privateConstructorUsedError;
  TodoStatus get addingStatus => throw _privateConstructorUsedError;
  TodoStatus get updatingStatus => throw _privateConstructorUsedError;
  TodoStatus get deletingStatus => throw _privateConstructorUsedError;
  List<TodoEntity> get todos => throw _privateConstructorUsedError;
  TodoEntity? get lastDeletedTodos => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoStateCopyWith<TodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateCopyWith<$Res> {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) then) =
      _$TodoStateCopyWithImpl<$Res, TodoState>;
  @useResult
  $Res call(
      {TodoStatus fetchingStatus,
      TodoStatus addingStatus,
      TodoStatus updatingStatus,
      TodoStatus deletingStatus,
      List<TodoEntity> todos,
      TodoEntity? lastDeletedTodos,
      Exception? error});
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res, $Val extends TodoState>
    implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchingStatus = null,
    Object? addingStatus = null,
    Object? updatingStatus = null,
    Object? deletingStatus = null,
    Object? todos = null,
    Object? lastDeletedTodos = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      fetchingStatus: null == fetchingStatus
          ? _value.fetchingStatus
          : fetchingStatus // ignore: cast_nullable_to_non_nullable
              as TodoStatus,
      addingStatus: null == addingStatus
          ? _value.addingStatus
          : addingStatus // ignore: cast_nullable_to_non_nullable
              as TodoStatus,
      updatingStatus: null == updatingStatus
          ? _value.updatingStatus
          : updatingStatus // ignore: cast_nullable_to_non_nullable
              as TodoStatus,
      deletingStatus: null == deletingStatus
          ? _value.deletingStatus
          : deletingStatus // ignore: cast_nullable_to_non_nullable
              as TodoStatus,
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoEntity>,
      lastDeletedTodos: freezed == lastDeletedTodos
          ? _value.lastDeletedTodos
          : lastDeletedTodos // ignore: cast_nullable_to_non_nullable
              as TodoEntity?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoStateImplCopyWith<$Res>
    implements $TodoStateCopyWith<$Res> {
  factory _$$TodoStateImplCopyWith(
          _$TodoStateImpl value, $Res Function(_$TodoStateImpl) then) =
      __$$TodoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TodoStatus fetchingStatus,
      TodoStatus addingStatus,
      TodoStatus updatingStatus,
      TodoStatus deletingStatus,
      List<TodoEntity> todos,
      TodoEntity? lastDeletedTodos,
      Exception? error});
}

/// @nodoc
class __$$TodoStateImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateImpl>
    implements _$$TodoStateImplCopyWith<$Res> {
  __$$TodoStateImplCopyWithImpl(
      _$TodoStateImpl _value, $Res Function(_$TodoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchingStatus = null,
    Object? addingStatus = null,
    Object? updatingStatus = null,
    Object? deletingStatus = null,
    Object? todos = null,
    Object? lastDeletedTodos = freezed,
    Object? error = freezed,
  }) {
    return _then(_$TodoStateImpl(
      fetchingStatus: null == fetchingStatus
          ? _value.fetchingStatus
          : fetchingStatus // ignore: cast_nullable_to_non_nullable
              as TodoStatus,
      addingStatus: null == addingStatus
          ? _value.addingStatus
          : addingStatus // ignore: cast_nullable_to_non_nullable
              as TodoStatus,
      updatingStatus: null == updatingStatus
          ? _value.updatingStatus
          : updatingStatus // ignore: cast_nullable_to_non_nullable
              as TodoStatus,
      deletingStatus: null == deletingStatus
          ? _value.deletingStatus
          : deletingStatus // ignore: cast_nullable_to_non_nullable
              as TodoStatus,
      todos: null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoEntity>,
      lastDeletedTodos: freezed == lastDeletedTodos
          ? _value.lastDeletedTodos
          : lastDeletedTodos // ignore: cast_nullable_to_non_nullable
              as TodoEntity?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$TodoStateImpl extends _TodoState {
  const _$TodoStateImpl(
      {this.fetchingStatus = TodoStatus.initial,
      this.addingStatus = TodoStatus.initial,
      this.updatingStatus = TodoStatus.initial,
      this.deletingStatus = TodoStatus.initial,
      final List<TodoEntity> todos = const [],
      this.lastDeletedTodos,
      this.error})
      : _todos = todos,
        super._();

  @override
  @JsonKey()
  final TodoStatus fetchingStatus;
  @override
  @JsonKey()
  final TodoStatus addingStatus;
  @override
  @JsonKey()
  final TodoStatus updatingStatus;
  @override
  @JsonKey()
  final TodoStatus deletingStatus;
  final List<TodoEntity> _todos;
  @override
  @JsonKey()
  List<TodoEntity> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  final TodoEntity? lastDeletedTodos;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'TodoState(fetchingStatus: $fetchingStatus, addingStatus: $addingStatus, updatingStatus: $updatingStatus, deletingStatus: $deletingStatus, todos: $todos, lastDeletedTodos: $lastDeletedTodos, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoStateImpl &&
            (identical(other.fetchingStatus, fetchingStatus) ||
                other.fetchingStatus == fetchingStatus) &&
            (identical(other.addingStatus, addingStatus) ||
                other.addingStatus == addingStatus) &&
            (identical(other.updatingStatus, updatingStatus) ||
                other.updatingStatus == updatingStatus) &&
            (identical(other.deletingStatus, deletingStatus) ||
                other.deletingStatus == deletingStatus) &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.lastDeletedTodos, lastDeletedTodos) ||
                other.lastDeletedTodos == lastDeletedTodos) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fetchingStatus,
      addingStatus,
      updatingStatus,
      deletingStatus,
      const DeepCollectionEquality().hash(_todos),
      lastDeletedTodos,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoStateImplCopyWith<_$TodoStateImpl> get copyWith =>
      __$$TodoStateImplCopyWithImpl<_$TodoStateImpl>(this, _$identity);
}

abstract class _TodoState extends TodoState {
  const factory _TodoState(
      {final TodoStatus fetchingStatus,
      final TodoStatus addingStatus,
      final TodoStatus updatingStatus,
      final TodoStatus deletingStatus,
      final List<TodoEntity> todos,
      final TodoEntity? lastDeletedTodos,
      final Exception? error}) = _$TodoStateImpl;
  const _TodoState._() : super._();

  @override
  TodoStatus get fetchingStatus;
  @override
  TodoStatus get addingStatus;
  @override
  TodoStatus get updatingStatus;
  @override
  TodoStatus get deletingStatus;
  @override
  List<TodoEntity> get todos;
  @override
  TodoEntity? get lastDeletedTodos;
  @override
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$TodoStateImplCopyWith<_$TodoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
