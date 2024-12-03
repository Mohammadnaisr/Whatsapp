import 'package:flutter/material.dart';
import 'screens/todo_list_page.dart';
import './models/task_model.dart';
import './widgets/task_input.dart';
import './widgets/task_list.dart';
import './widgets/task_section.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListPage(),
    );
  }
}
