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

  test('should get token info', () async {
    await decentrifi
        .getPrice(
          network: 'POLYGON',
          address: '0x971039bf0a49c8d8a675f839739ee7a42511ec91',
          amount: '100',
        )
        .then((value) => expect(
              value.runtimeType,
              double,
            ));
  });

  test('should not get token info - network malformed', () async {
    await decentrifi
        .getPrice(
          network: 'POLYGO',
          address: '0x971039bf0a49c8d8a675f839739ee7a42511ec91',
          amount: '100',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });
}
