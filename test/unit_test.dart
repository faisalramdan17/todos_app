// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import "package:bloc_test/bloc_test.dart";
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todos_app/core/error/error_handler.dart';
import 'package:todos_app/core/error/exceptions.dart';
import 'package:todos_app/src/todo/data/datasources/todo_database_helper.dart';
import 'package:todos_app/src/todo/data/datasources/todo_local_datasource.dart';
import 'package:todos_app/src/todo/data/repositories/todo_repository_impl.dart';
import 'package:todos_app/src/todo/domain/entities/todo_entity.dart';
import 'package:todos_app/src/todo/domain/repositories/todo_repository.dart';
import 'package:todos_app/src/todo/domain/usecases/add_todo_use_case.dart';
import 'package:todos_app/src/todo/domain/usecases/delete_todo_use_case.dart';
import 'package:todos_app/src/todo/domain/usecases/get_all_todos_use_case.dart';
import 'package:todos_app/src/todo/domain/usecases/update_todo_use_case.dart';
import 'package:todos_app/src/todo/presentation/cubit/todo_cubit.dart';

import 'unit_test.mocks.dart';

@GenerateMocks(
  [
    /// data/datasources
    TodoDatabaseHelper,
    TodoLocalDataSource,

    /// domain/repositories
    TodoRepository,

    /// domain/usecases
    GetAllTodosUseCase,
    AddTodoUseCase,
    UpdateTodoUseCase,
    DeleteTodoUseCase,

    /// presentation
    TodoCubit,
  ],
  customMocks: [
    // MockSpec<Cat>(as: #MockCat)
  ],
)
void main() {
  late ErrorHandler errorHandler;
  late MockTodoDatabaseHelper mockTodoDatabaseHelper;
  late MockTodoLocalDataSource mockTodoLocalDataSource;
  late MockTodoRepository mockTodoRepository;
  late MockGetAllTodosUseCase mockGetAllTodosUseCase;
  late MockAddTodoUseCase mockAddTodoUseCase;
  late MockUpdateTodoUseCase mockUpdateTodoUseCase;
  late MockDeleteTodoUseCase mockDeleteTodoUseCase;

  late TodoLocalDataSourceImpl todoLocalDataSourceImpl;
  late TodoRepositoryImpl todoRepositoryImpl;
  late GetAllTodosUseCase getAllTodosUseCase;
  late AddTodoUseCase addTodoUseCase;
  late UpdateTodoUseCase updateTodoUseCase;
  late DeleteTodoUseCase deleteTodoUseCase;
  late TodoCubit todoCubit;

  final testTask1 = TodoEntity(
    id: 1,
    task: 'task-1',
    description: 'description-1',
    createdAt: DateTime.now(),
  );

  setUp(() async {
    errorHandler = ErrorHandlerImpl();
    mockTodoDatabaseHelper = MockTodoDatabaseHelper();
    mockTodoLocalDataSource = MockTodoLocalDataSource();
    mockTodoRepository = MockTodoRepository();
    mockGetAllTodosUseCase = MockGetAllTodosUseCase();
    mockAddTodoUseCase = MockAddTodoUseCase();
    mockUpdateTodoUseCase = MockUpdateTodoUseCase();
    mockDeleteTodoUseCase = MockDeleteTodoUseCase();

    todoLocalDataSourceImpl = TodoLocalDataSourceImpl(mockTodoDatabaseHelper);
    todoRepositoryImpl = TodoRepositoryImpl(mockTodoLocalDataSource, errorHandler);
    getAllTodosUseCase = GetAllTodosUseCase(mockTodoRepository);
    addTodoUseCase = AddTodoUseCase(mockTodoRepository);
    updateTodoUseCase = UpdateTodoUseCase(mockTodoRepository);
    deleteTodoUseCase = DeleteTodoUseCase(mockTodoRepository);

    todoCubit = TodoCubit(
      getAllTodosUseCase: mockGetAllTodosUseCase,
      addTodoUseCase: mockAddTodoUseCase,
      updateTodoUseCase: mockUpdateTodoUseCase,
      deleteTodoUseCase: mockDeleteTodoUseCase,
    );
  });

  group('Test Data Resource', () {
    group('getAllTodoLocal', () {
      test('should return all todos', () async {
        // arrange
        when(mockTodoDatabaseHelper.getAllTodosLocal()).thenAnswer((_) async => [testTask1]);
        // act
        todoLocalDataSourceImpl.getTodos();
        // assert
        verify(mockTodoDatabaseHelper.getAllTodosLocal());
      });
      test('should throw LocalServerException when getAllTodosLocal is failed', () async {
        // arrange
        when(mockTodoDatabaseHelper.getAllTodosLocal()).thenThrow(Exception());
        // act
        final call = todoLocalDataSourceImpl.getTodos;
        // assert
        expect(() => call(), throwsA(isA<LocalServerException>()));
      });
    });

    group('insertTodoLocal', () {
      test('should return todo object when save to database is success', () async {
        // arrange
        when(mockTodoDatabaseHelper.insertTodoLocal(any)).thenAnswer((_) async => testTask1);
        // act
        todoLocalDataSourceImpl.addTodo(testTask1);
        // assert
        verify(mockTodoDatabaseHelper.insertTodoLocal(testTask1));
      });
      test('should throw LocalServerException when save to database is failed', () async {
        // arrange
        when(mockTodoDatabaseHelper.insertTodoLocal(any)).thenThrow(Exception());
        // act
        final call = todoLocalDataSourceImpl.addTodo;
        // assert
        expect(() => call(testTask1), throwsA(isA<LocalServerException>()));
      });
    });

    group('updateTodoLocal', () {
      test('should return true when save to database is success', () async {
        // arrange
        when(mockTodoDatabaseHelper.updateTodoLocal(any)).thenAnswer((_) async => true);
        // act
        todoLocalDataSourceImpl.updateTodo(testTask1);
        // assert
        verify(mockTodoDatabaseHelper.updateTodoLocal(testTask1));
      });
      test('should throw LocalServerException when save to database is failed', () async {
        // arrange
        when(mockTodoDatabaseHelper.updateTodoLocal(any)).thenThrow(Exception());
        // act
        final call = todoLocalDataSourceImpl.updateTodo;
        // assert
        expect(() => call(testTask1), throwsA(isA<LocalServerException>()));
      });
    });

    group('removeTodoLocal', () {
      test('should return true when save to database is success', () async {
        // arrange
        when(mockTodoDatabaseHelper.removeTodoLocal(any)).thenAnswer((_) async => true);
        // act
        todoLocalDataSourceImpl.deleteTodo(testTask1.id);
        // assert
        verify(mockTodoDatabaseHelper.removeTodoLocal(testTask1.id));
      });
      test('should throw LocalServerException when save to database is failed', () async {
        // arrange
        when(mockTodoDatabaseHelper.removeTodoLocal(any)).thenThrow(Exception());
        // act
        final call = todoLocalDataSourceImpl.deleteTodo;
        // assert
        expect(() => call(testTask1.id), throwsA(isA<LocalServerException>()));
      });
    });
  });

  group('Test Repository', () {
    group('getTodos', () {
      test('should return all todos', () async {
        // arrange
        when(mockTodoLocalDataSource.getTodos()).thenAnswer((_) async => [testTask1]);
        //act
        final result = await todoRepositoryImpl.getAllTodos();
        // assert
        verify(mockTodoLocalDataSource.getTodos());
        expect(result.getOrElse(() => []), [testTask1]);
      });
    });

    group('insertTodoLocal', () {
      test('should return true when save to repository is success', () async {
        // arrange
        when(mockTodoLocalDataSource.addTodo(any)).thenAnswer((_) async => testTask1);
        // act
        final result = await todoRepositoryImpl.addTodo(testTask1);
        // assert
        verify(mockTodoLocalDataSource.addTodo(testTask1));
        expect(result.map((r) => r), right(testTask1));
      });
    });

    group('updateTodoLocal', () {
      test('should return true when save to repository is success', () async {
        // arrange
        when(mockTodoLocalDataSource.updateTodo(any)).thenAnswer((_) async => true);
        // act
        final result = await todoRepositoryImpl.updateTodo(testTask1);
        // assert
        verify(mockTodoLocalDataSource.updateTodo(testTask1));
        expect(result.map((r) => r), right(true));
      });
    });

    group('removeTodoLocal', () {
      test('should return true when delete to repository is success', () async {
        // arrange
        when(mockTodoLocalDataSource.deleteTodo(any)).thenAnswer((_) async => true);
        // act
        final result = await todoRepositoryImpl.deleteTodo(testTask1.id);
        // assert
        verify(mockTodoLocalDataSource.deleteTodo(testTask1.id));
        expect(result.map((r) => r), right(true));
      });
    });
  });

  group('Test Use Cases', () {
    group('getAllTodosUseCase', () {
      test("should return all todos when call getAllTodos from the repository", () async {
        //arrange
        when(mockTodoRepository.getAllTodos()).thenAnswer((_) async => Right([testTask1]));
        //actual
        final result = await getAllTodosUseCase();
        verify(mockTodoRepository.getAllTodos());
        expect(result.getOrElse(() => []), [testTask1]);
      });
    });

    group('addTodoUseCase', () {
      test("should return object when call addTodo from the repository", () async {
        //arrange
        when(mockTodoRepository.addTodo(any)).thenAnswer((_) async => Right(testTask1));
        //actual
        final result = await addTodoUseCase(testTask1);
        verify(mockTodoRepository.addTodo(testTask1));
        expect(result, Right(testTask1));
      });
    });

    group('updateTodoUseCase', () {
      test("should return true when call updateTodo from the repository", () async {
        //arrange
        when(mockTodoRepository.updateTodo(any)).thenAnswer((_) async => const Right(true));
        //actual
        final result = await updateTodoUseCase(testTask1);
        verify(mockTodoRepository.updateTodo(testTask1));
        expect(result, const Right(true));
      });
    });

    group('deleteTodoUseCase', () {
      test("should return true when call deleteTodo from the repository", () async {
        //arrange
        when(mockTodoRepository.deleteTodo(any)).thenAnswer((_) async => const Right(true));
        //actual
        final result = await deleteTodoUseCase(testTask1.id);
        verify(mockTodoRepository.deleteTodo(testTask1.id));
        expect(result, const Right(true));
      });
    });
  });

  group('Test Cubit/Bloc', () {
    group('Test TodoCubit', () {
      test("Initial state should be TodoState.init", () {
        // assert
        expect(todoCubit.state, TodoState.init);
      });

      blocTest<TodoCubit, TodoState>(
        'Call fetchAllBlogs() when data is gotten successfully',
        build: () {
          when(mockGetAllTodosUseCase.call()).thenAnswer((_) async => Right([testTask1]));
          return todoCubit;
        },
        act: (bloc) => bloc.fetchAllBlogs(),
        expect: () => [
          const TodoState(fetchingStatus: TodoStatus.loading),
          TodoState(fetchingStatus: TodoStatus.success, todos: [testTask1]),
        ],
        verify: (bloc) {
          verify(mockGetAllTodosUseCase.call());
        },
      );

      blocTest<TodoCubit, TodoState>(
        'Call addTodo() when data is gotten successfully',
        build: () {
          when(mockAddTodoUseCase.call(any)).thenAnswer((_) async => Right(testTask1));
          return todoCubit;
        },
        act: (bloc) => bloc.addTodo(testTask1),
        expect: () => [
          const TodoState(addingStatus: TodoStatus.loading),
          TodoState(addingStatus: TodoStatus.success, todos: [testTask1]),
        ],
        verify: (bloc) {
          verify(mockAddTodoUseCase.call(testTask1));
        },
      );

      blocTest<TodoCubit, TodoState>(
        'Call updateTodo() when data is gotten successfully',
        build: () {
          when(mockUpdateTodoUseCase.call(any)).thenAnswer((_) async => const Right(true));
          return todoCubit;
        },
        act: (bloc) => bloc.updateTodo(testTask1),
        expect: () => [
          const TodoState(updatingStatus: TodoStatus.loading),
          const TodoState(updatingStatus: TodoStatus.success),
        ],
        verify: (bloc) {
          verify(mockUpdateTodoUseCase.call(testTask1));
        },
      );

      blocTest<TodoCubit, TodoState>(
        'Call deleteTodo() when data is gotten successfully',
        build: () {
          when(mockDeleteTodoUseCase.call(any)).thenAnswer((_) async => const Right(true));
          return todoCubit;
        },
        act: (bloc) => bloc.deleteTodo(testTask1),
        expect: () => [
          const TodoState(deletingStatus: TodoStatus.loading),
          TodoState(
            deletingStatus: TodoStatus.success,
            lastDeletedTodos: testTask1,
            todos: [],
          ),
        ],
        verify: (bloc) {
          verify(mockDeleteTodoUseCase.call(testTask1.id));
        },
      );
    });
  });
}
