// lib/
// │
// ├── main.dart           # Entry point
// ├── pages/
// │   ├── home_page.dart  # Home Page
// │   ├── profile_page.dart  # Profile Page
// │   └── todo_list_page.dart  # Todo List Page
// ├── models/
// │   └── todo_task.dart  # TodoTask Class
// ├── widgets/
// │   └── task_card.dart  # Card Widget for tasks
// ├── services/
// │   └── api_service.dart  # API Service for fetching tasks
// ├── assets/
// │   ├── images/         # Image assets
// │   └── fonts/          # Font assets
// └── utils/
//     └── constants.dart  # App-wide constants







import 'package:flutter/material.dart';
import '../models/todo_task.dart';
import '../widgets/task_card.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<TodoTask> tasks = []; // List to store tasks
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  String _title = '';
  String _description = '';
  DateTime _dueDate = DateTime.now();

  // Add task function
  void _addTask() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        tasks.add(TodoTask(
          title: _title,
          description: _description,
          dueDate: _dueDate,
        ));
      });
      Navigator.pop(context); // Close the dialog
    }
  }

  // Edit task function
  void _editTask(TodoTask task) {
    // Load task details into the form
    setState(() {
      _title = task.title;
      _description = task.description;
      _dueDate = task.dueDate;
    });

    // Show task form dialog with current task data
    showDialog(
      context: context,
      builder: (_) => _buildTaskForm(
        onSave: () {
          // Update the task's data
          setState(() {
            task.title = _title;
            task.description = _description;
            task.dueDate = _dueDate;
          });
          Navigator.pop(context); // Close the dialog after saving changes
        },
      ),
    );
  }

  // Delete task function
  void _deleteTask(TodoTask task) {
    setState(() {
      tasks.remove(task);
    });
  }

  // Build task form for both adding and editing tasks
  Widget _buildTaskForm({required VoidCallback onSave}) {
    return AlertDialog(
      title: Text('Task Details'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                initialValue: _title,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                initialValue: _description,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              SizedBox(height: 20),
              Text('Due Date: ${_dueDate.toLocal()}'.split(' ')[0]),
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _dueDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null && pickedDate != _dueDate) {
                    setState(() {
                      _dueDate = pickedDate;
                    });
                  }
                },
                child: Text('Select Due Date'),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
        ElevatedButton(onPressed: onSave, child: Text('Save')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => _buildTaskForm(onSave: _addTask),
            ),
          ),
        ],
      ),
      body: tasks.isEmpty
          ? Center(child: Text('No tasks yet. Add a new task!'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return TaskCard(
                  task: task,
                  onEdit: () => _editTask(task),   // Edit task
                  onDelete: () => _deleteTask(task), // Delete task
                );
              },
            ),
    );
  }
}



