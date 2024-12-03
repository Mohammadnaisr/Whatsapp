import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../widgets/task_input.dart';
import '../widgets/task_list.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<Task> _tasks = [];

  void _addTask(String title) {
    setState(() {
      _tasks.add(Task(title: title));
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index].completed = !_tasks[index].completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do-List'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu action
          },
        ),
      ),
      body: Column(
        children: [
          TaskInput(onAddTask: _addTask),
          Expanded(
            child: TaskList(
              tasks: _tasks,
              onToggleTaskCompletion: _toggleTaskCompletion,
              onRemoveTask: _removeTask,
            ),
          ),
        ],
      ),
    );
  }
}
