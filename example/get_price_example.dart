import 'package:decentrifi/decentrifi.dart';

void main() async {
  /// Initialize the main object
  Decentrifi decentrifi = Decentrifi();

  /// Call the api
  double? data = await decentrifi.getPrice(
    network: 'POLYGON',
    address: '0x971039bf0a49c8d8a675f839739ee7a42511ec91',
    amount: '100',
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
