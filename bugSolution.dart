```dart
Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Error: HTTP status code ${response.statusCode}');
      return null; // Or throw an exception depending on your needs
    }
  } on SocketException catch (e) {
    print('Error: No Internet Connection. Please check your connection.');
    return null; // Or throw an exception
  } on FormatException catch (e) {
    print('Error: Invalid JSON format: $e');
    return null; // Or throw an exception
  } catch (e) {
    print('An unexpected error occurred: $e');
    return null; // Or throw an exception
  }
}
```