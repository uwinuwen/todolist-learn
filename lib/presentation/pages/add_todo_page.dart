import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_learn/presentation/bloc/todo/todo_cubit.dart';

class AddTodoPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(label: Text('Judul')),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<TodoCubit>().addTodo(titleController.text);
                Navigator.pop(context);
              },
              child: Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}
