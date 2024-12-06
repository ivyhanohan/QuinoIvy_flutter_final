

// import 'package:flutter/material.dart';
// import 'pages/home_page.dart';
// import 'pages/profile_page.dart';
// import 'pages/todo_list_page.dart';

// void main() {
//   runApp(TaskifyApp());
// }

// class TaskifyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false, // Remove debug banner
//       title: 'Taskify',
//       theme: ThemeData(
//         primarySwatch: Colors.blue, // Main theme color
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(fontFamily: 'Montserrat', fontSize: 16.0),
//           bodyMedium: TextStyle(fontFamily: 'Montserrat', fontSize: 14.0),
//         ),
//       ),
//       initialRoute: '/', // Set the initial route
//       routes: {
//         '/': (context) => HomePage(),
//         '/profile': (context) => ProfilePage(),
//         '/todoList': (context) => TodoListPage(),
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/todo_list_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taskify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/todoList': (context) => TodoListPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
