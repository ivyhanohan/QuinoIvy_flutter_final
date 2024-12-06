// import 'package:flutter/material.dart';
// import '../models/todo_task.dart';

// class TaskCard extends StatelessWidget {
//   final TodoTask task;
//   final VoidCallback onEdit;
//   final VoidCallback onDelete;

//   TaskCard({required this.task, required this.onEdit, required this.onDelete});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       child: ListTile(
//         title: Text(task.title),
//         subtitle: Text(task.description),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(icon: Icon(Icons.edit), onPressed: onEdit),
//             IconButton(icon: Icon(Icons.delete), onPressed: onDelete),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../models/todo_task.dart';

class TaskCard extends StatelessWidget {
  final TodoTask task;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  TaskCard({required this.task, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEdit,  // Edit task
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,  // Delete task
            ),
          ],
        ),
      ),
    );
  }
}
