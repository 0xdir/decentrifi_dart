import 'package:decentrifi/decentrifi.dart';

void main() async {
  /// Initialize the main object
  Decentrifi decentrifi = Decentrifi();

  /// Call the api
  String? data = await decentrifi.getAddressByENS(
    ensName: 'resolver.eth',
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
