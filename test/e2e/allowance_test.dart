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

  test('should get allowance', () async {
    await decentrifi
        .getAllowance(
          network: 'ETHEREUM',
          token: '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48',
          user: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
          spender: '0x0297e37f1873d2dab4487aa67cd56b58e2f27875',
        )
        .then((value) => expect(
              value,
              BigInt.from(0),
            ));
  });

  test('should not get allowance - network malformed', () async {
    await decentrifi
        .getAllowance(
          network: 'ETHEREU',
          token: '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48',
          user: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
          spender: '0x0297e37f1873d2dab4487aa67cd56b58e2f27875',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });
}
