```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataFetchException implements Exception {
  final String message;
  DataFetchException(this.message);
  @override
  String toString() => 'DataFetchException: $message';
}

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        print('Data fetched successfully: $jsonData');
      } on FormatException catch (e) {
        print('Invalid JSON format: $e');
        throw DataFetchException('Invalid JSON response from server.');
      }
    } else {
      throw DataFetchException('Failed to load data. Status code: ${response.statusCode}');
    }
  } on Exception catch (e) {
    print('An error occurred: $e'); // log to a more robust logging system in a production app
    rethrow; //Re-throw to allow higher-level handling
  }
}

void main() async {
  try {
    await fetchData();
  } catch (e) {
    print('A critical error occurred: $e');
    // Handle critical error (e.g., alert, retry logic)
  }
}
```