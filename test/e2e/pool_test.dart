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

  test('should get pools', () async {
    await decentrifi
        .getPools(
          protocol: 'curve',
        )
        .then((value) => expect(
              value.runtimeType,
              List<dynamic>,
            ));
  });

  test('should not get pools - protocol malformed', () async {
    await decentrifi
        .getPools(
          protocol: 'curv',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });

  test('should get pools for token', () async {
    await decentrifi
        .getPoolsForToken(
          network: 'POLYGON',
          protocol: 'curve',
          token: '0xe2aa7db6da1dae97c5f5c6914d285fbfcc32a128,',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });

  test('should get pool positions', () async {
    await decentrifi
        .getPoolPositions(
          protocol: 'quickswap',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
        )
        .then((value) => expect(
              value?.isEmpty,
              true,
            ));
  });

  test('should get pool history', () async {
    await decentrifi
        .getPoolHistory(
          protocol: 'quickswap',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
        )
        .then((value) => expect(
              value?.isEmpty,
              true,
            ));
  });
}