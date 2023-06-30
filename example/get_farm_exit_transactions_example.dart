import 'package:decentrifi/decentrifi.dart';

void main() async {
  /// Initialize the main object
  Decentrifi decentrifi = Decentrifi();

  /// Call the api
  List<dynamic>? data = await decentrifi.getFarmExitTransactions(
    protocol: 'beefy',
    id: 'frm_arbitrum-beefy-solidlizard-wbtc-weth',
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
