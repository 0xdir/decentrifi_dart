import 'package:decentrifi/decentrifi.dart';

void main() async {
  /// Initialize the main object
  Decentrifi decentrifi = Decentrifi();

  /// Call the api
  BigInt? data = await decentrifi.getTokenBalance(
    network: 'ETHEREUM',
    token: '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48',
    address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
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
