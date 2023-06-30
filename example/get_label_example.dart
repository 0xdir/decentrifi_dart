import 'package:decentrifi/decentrifi.dart';

void main() async {
  /// Initialize the main object
  Decentrifi decentrifi = Decentrifi();

  /// Call the api
  String? data = await decentrifi.getLabeledAddress(
    address: '0x3cc936b795a188f0e246cbb2d74c5bd190aecf18',
  );

  /// Do stuff with the result
  if (data != null) {
    print(data);
  } else {
    print('Nothing found');
  }

  /// Close the connection
  decentrifi.close();
}
