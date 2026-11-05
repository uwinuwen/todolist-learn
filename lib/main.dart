import 'package:flutter/material.dart';
import 'package:todolist_learn/domain/entities/todo_entity.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      TodoEntity(id: 1, title: 'Belajar Flutter', isCompleted: true),
      TodoEntity(id: 2, title: 'Belajar Jetpack Compose'),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = data[index];
              return ListTile(
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (newValue) {},
                ),
                title: Text(todo.title),
              );
            },
          ),
        ),
      ),
    );
  }
}
