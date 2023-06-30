import 'package:decentrifi/decentrifi.dart';

void main() async {
  /// Initialize the main object
  Decentrifi decentrifi = Decentrifi();

  /// Call the api
  List<dynamic>? data = await decentrifi.getLendingExitTransactions(
    protocol: 'compound',
    id: 'lnd_ethereum-compound-0x6c8c6b02e7b2be14d4fa6022dfd6d75921d90e4e',
    address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
    amount: '1000',
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
