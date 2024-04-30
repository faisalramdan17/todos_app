import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/core/core.dart';
import 'package:todos_app/src/todo/domain/entities/todo_entity.dart';
import 'package:todos_app/src/todo/presentation/cubit/todo_cubit.dart';

class TodoAddingScreen extends StatefulWidget {
  const TodoAddingScreen({super.key});

  @override
  State<TodoAddingScreen> createState() => _TodoAddingScreenState();
}

class _TodoAddingScreenState extends State<TodoAddingScreen> {
  final taskController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<String> selectedTopics = [];

  void addTodo() {
    if (formKey.currentState!.validate()) {
      context.read<TodoCubit>().addTodo(TodoEntity(
          task: taskController.text.trim(), description: descriptionController.text.trim(), createdAt: DateTime.now()));
    }
  }

  @override
  void dispose() {
    super.dispose();
    taskController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new task'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => addTodo(),
            icon: const Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: ErrorMessageListener<TodoCubit, TodoState>(
        listenWhen: (state) => state.addingStatus.isError,
        mapStateToError: (state) => state.error,
        child: BlocConsumer<TodoCubit, TodoState>(
          listener: (context, state) {
            if (state.addingStatus.isSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            if (state.addingStatus.isLoading) return const Loader();

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: taskController,
                        decoration: const InputDecoration(hintText: 'Task'),
                        maxLines: null,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Task is missing!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: descriptionController,
                        decoration: const InputDecoration(hintText: 'Description'),
                        minLines: 3,
                        maxLines: null,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Description is missing!';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
