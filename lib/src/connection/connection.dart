import 'dart:convert';
import 'package:http/http.dart' as http;
import '../objects/response/response.dart';

/// Handles low-level calls to the api
class Connection {
  late http.Client client;

  Connection() {
    client = http.Client();
  }

  /// Get without params
  Future<Response> get(String endpoint) async {
    try {
      final response = await client.get(
        Uri.parse(endpoint),
        headers: {},
      );
      return Response(response.statusCode, response.body);
    } catch (e) {
      rethrow;
    }
  }

  /// Post with payload
  Future<Response> post(String endpoint, final payload) async {
    try {
      final response = await client.post(
        Uri.parse(endpoint),
        headers: {
          'accept': 'application/json',
          'content-type': 'application/json',
        },
        body: json.encode(payload),
      );
      return Response(response.statusCode, response.body);
    } catch (e) {
      rethrow;
    }
  }

  /// Close the client
  void close() {
    client.close();
  }
}
