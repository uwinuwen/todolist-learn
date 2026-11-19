import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_learn/core/di/injection.dart';
import 'package:todolist_learn/presentation/bloc/todo/todo_cubit.dart';
import 'package:todolist_learn/presentation/pages/home_page.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<TodoCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: const HomePage()),
      ),
    );
  }
}
