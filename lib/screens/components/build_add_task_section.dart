import 'package:flutter/material.dart';
import 'package:myapp/services/task_service.dart';

// This widget creates the input section where the user types a task
// It takes a controller for the text field and a function to add the task
Widget buildAddTaskSection(
  TextEditingController nameController,
  VoidCallback addTask,
) {
  return Container(
    decoration: BoxDecoration(color: Colors.white),
    child: Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: TextField(
                maxLength: 32,
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Add Task',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          ElevatedButton(onPressed: addTask, child: Text("Add Task")),
        ],
      ),
    ),
  );
}
