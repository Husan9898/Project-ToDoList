import 'package:myapp/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  //TaskService handle database operation (add, read,update,delete tasks)
  final TaskService taskService = TaskService();

  //This list stores all tasks in the app memory for display in UI
  List<Task> tasks = [];

  //Loads all tasks from the database and update the UI
  Future<void> loadTasks() async {
    tasks = await taskService.fetchtasks();
    notifyListeners();
  }

  // Adds a new task to the database and also to the local list
  Future<void> addTask(String name) async {
    if (name.isNotEmpty) {
      final id = await taskService.addTask(name.trim());
      tasks.add(Task(id: id, name: name.trim(), completed: false));
    }
  }

  // Updates a task's completed status in the database
  Future<void> updateTask(int index, bool completed) async {
    final task = tasks[index];
    await taskService.updateTask(task.id, completed);
  }

  // Removes a task from the database and refreshes the UI
  Future<void> removeTask(int index) async {
    final task = tasks[index];
    await taskService.deleteTask(task.id);
    notifyListeners();
  }
}
