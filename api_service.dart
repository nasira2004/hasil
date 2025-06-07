import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todo.dart'; 

class ApiService {
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/todos';

  static Future<List<Todo>> fetchTodos() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);

        return jsonData.map((item) => Todo.fromJson(item)).toList();
      } else {
        throw Exception('Gagal mengambil data dari server. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Terjadi error saat mengambil data: $e');
    }
  }
}
