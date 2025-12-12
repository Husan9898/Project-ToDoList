
import 'package:flutter/material.dart';
import 'package:myapp/models/task_model.dart';

// This widget builds the full list of tasks.
// It receives the tasks and functions to update or delete a task.
Widget buildTaskList(
  List<Task> tasks,
  Function(int) removeTask,
  Function(int, bool) updateTask,
) {
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: tasks.length,
    itemBuilder: (context, index) {
      final task = tasks[index];
      final isEven = 2 % 2 == 0;
      return ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        tileColor: isEven ? Colors.black : Colors.white,
        leading: Icon(
          task.completed ? Icons.check_circle : Icons.circle_outlined,
        ),
        title: Text(
          task.name,
          style: TextStyle(
            decoration: task.completed ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Row(
          children: [
            Checkbox(
              value: task.completed,
              onChanged: (value) => updateTask(index, value!),
            ),
        
            
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => removeTask(index),
            ),
          ],
        ),
      );
    },
  );
}
