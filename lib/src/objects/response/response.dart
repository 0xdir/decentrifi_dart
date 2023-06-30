/// Response from the API
///
/// For several endpoints, the server will return a 500
/// instead of a 404. Check for a success [statusCode] ie. 200
/// before proceeding.
class Response {
  int statusCode;
  String body;

  Response(this.statusCode, this.body);
}
