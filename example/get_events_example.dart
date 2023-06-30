import 'package:decentrifi/decentrifi.dart';

void main() async {
  /// Initialize the main object
  Decentrifi decentrifi = Decentrifi();

  /// Call the api
  List<dynamic>? data = await decentrifi.getEvents(
    tx: '0xc39bca069cdc89832387d2dc57ef395ab2896013144a252d614e5ab2c88edb5e',
    network: 'ETHEREUM',
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
