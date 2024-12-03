import 'package:flutter/material.dart';
import '../models/task_model.dart';
import 'task_section.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onToggleTaskCompletion;
  final Function(int) onRemoveTask;

  TaskList({
    required this.tasks,
    required this.onToggleTaskCompletion,
    required this.onRemoveTask,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskSection(
          title: tasks[index].title,
          completed: tasks[index].completed,
          onToggleComplete: () => onToggleTaskCompletion(index),
          onDelete: () => onRemoveTask(index),
        );
      },
    );
  }
}
