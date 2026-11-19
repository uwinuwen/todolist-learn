import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_learn/presentation/bloc/todo/todo_cubit.dart';
import 'package:todolist_learn/presentation/pages/add_todo_page.dart';

class HomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todolist'), centerTitle: true),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              context.read<TodoCubit>().fetchTodos();
              return Center(child: const Text('Belum ada tugas.'));
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (todos) => ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (_) => context.read<TodoCubit>().toggleTodo(
                      todo.copyWith(isCompleted: !todo.isCompleted),
                    ),
                  ),
                  title: Text(todo.title),
                  trailing: IconButton(
                    onPressed: () {
                      if (todo.id != null) {
                        context.read<TodoCubit>().deleteTodo(todo.id!);
                      }
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                );
              },
            ),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddTodoPage()),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
