import 'package:decentrifi/decentrifi.dart';

void main() async {
  /// Initialize the main object
  Decentrifi decentrifi = Decentrifi();

  /// Call the api
  List<dynamic>? data = await decentrifi.getLendingForToken(
    network: 'ETHEREUM',
    protocol: 'compound',
    token: '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48',
  );

  /// Do stuff with the result
  if (data != null) {
    print('$data');
  } else {
    print('Nothing found');
  }

  /// Close the connection
  decentrifi.close();
}
