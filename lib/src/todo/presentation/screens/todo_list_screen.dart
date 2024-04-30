import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/core/core.dart';
import 'package:todos_app/src/todo/domain/entities/todo_entity.dart';
import 'package:todos_app/src/todo/presentation/cubit/todo_cubit.dart';
import 'package:todos_app/src/todo/presentation/screens/todo_adding_screen.dart';
import 'package:todos_app/src/todo/presentation/widgets/todo_item_tile.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  /// Will used to access the Animated list
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  /// This holds the items
  final List<TodoEntity> _items = [];

  @override
  void initState() {
    super.initState();
    context.read<TodoCubit>().fetchAllBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo-List App'),
        actions: [
          IconButton(
            onPressed: () => context.push(const TodoAddingScreen()),
            icon: const Icon(
              CupertinoIcons.add_circled,
            ),
          ),
        ],
      ),
      body: ErrorMessageListener<TodoCubit, TodoState>(
        listenWhen: (state) => state.addingStatus.isError,
        mapStateToError: (state) => state.error,
        child: MultiBlocListener(
          listeners: [
            BlocListener<TodoCubit, TodoState>(
              listenWhen: (previous, current) =>
                  previous.fetchingStatus != current.fetchingStatus && current.fetchingStatus.isSuccess,
              listener: (context, state) {
                _items
                  ..clear()
                  ..addAll(state.todos);
              },
            ),
            BlocListener<TodoCubit, TodoState>(
              listenWhen: (previous, current) {
                return previous.addingStatus != current.addingStatus && current.addingStatus.isSuccess;
              },
              listener: (context, state) {
                listKey.currentState?.insertItem(0, duration: kTabScrollDuration);
                _items.insert(0, state.todos.first);
              },
            ),
            BlocListener<TodoCubit, TodoState>(
              listenWhen: (previous, current) {
                return previous.deletingStatus != current.deletingStatus && current.deletingStatus.isSuccess;
              },
              listener: (context, state) {
                final index = _items.indexWhere((it) => it.id == state.lastDeletedTodos!.id);
                listKey.currentState?.removeItem(
                  index,
                  (_, animation) => TodoItemTile(
                    todo: state.lastDeletedTodos!,
                    animation: animation,
                  ),
                  duration: kTabScrollDuration,
                );
                _items.removeAt(index);
              },
            ),
          ],
          child: BlocBuilder<TodoCubit, TodoState>(
            buildWhen: (previous, current) =>
                previous.fetchingStatus != current.fetchingStatus && current.fetchingStatus.isSuccess ||
                previous.updatingStatus != current.updatingStatus && current.updatingStatus.isSuccess,
            builder: (context, state) {
              if (state.fetchingStatus.isLoading) return const Loader();

              return AnimatedList(
                key: listKey,
                initialItemCount: _items.length,
                itemBuilder: (context, index, animation) {
                  final todo = _items[index];
                  return TodoItemTile(
                    todo: todo,
                    animation: animation,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
