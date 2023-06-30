import 'package:decentrifi/decentrifi.dart';
import 'package:test/test.dart';

void main() async {
  late Decentrifi decentrifi;

  setUp(() {
    decentrifi = Decentrifi();
  });

  tearDown(() {
    decentrifi.close();
  });

  test('should get ens name', () async {
    await decentrifi
        .getENSName(
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
        )
        .then((value) => expect(
              value,
              'resolver.eth',
            ));
  });

  test('should not get ens name - address malformed', () async {
    await decentrifi
        .getENSName(
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E6',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });

  test('should not get ens name - address has no ens', () async {
    await decentrifi
        .getENSName(
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E6A',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });

  test('get address from name', () async {
    await decentrifi
        .getAddressByENS(
          ensName: 'resolver.eth',
        )
        .then((value) => expect(
              value,
              '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63'.toLowerCase(),
            ));
  });

  test('should not get address from name - address malformed', () async {
    await decentrifi
        .getAddressByENS(
          ensName: 'resolver.et',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });
}
