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

  test('should get claimables', () async {
    await decentrifi
        .getClaimables(
          protocol: 'beefy',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
        )
        .then((value) => expect(
              value.runtimeType,
              List<dynamic>,
            ));
  });

  test('should not get claimables - protocol malformed', () async {
    await decentrifi
        .getClaimables(
          protocol: 'beef',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });
}
