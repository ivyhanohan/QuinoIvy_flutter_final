// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiService {
//   final String _baseUrl = "https://jsonplaceholder.typicode.com";

//   Future<List<Map<String, dynamic>>> fetchTodoList() async {
//     final response = await http.get(Uri.parse('$_baseUrl/todos'));

//     if (response.statusCode == 200) {
//       // If the server returns a successful response
//       List<dynamic> data = json.decode(response.body);
//       return data.map((e) => e as Map<String, dynamic>).toList();
//     } else {
//       // If the server returns an error
//       throw Exception('Failed to load data');
//     }
//   }
// }



import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = "https://jsonplaceholder.typicode.com";

  // Fetch Todo List from the API
  Future<List<Map<String, dynamic>>> fetchTodoList() async {
    final response = await http.get(Uri.parse('$_baseUrl/todos'));

    if (response.statusCode == 200) {
      // If the server returns a successful response
      List<dynamic> data = json.decode(response.body);

      // Convert List<dynamic> to List<Map<String, dynamic>>
      return List<Map<String, dynamic>>.from(data);
    } else {
      // If the server returns an error
      throw Exception('Failed to load data');
    }
  }
}
