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

  test('should get farms', () async {
    await decentrifi
        .getFarms(
          protocol: 'beefy',
          network: 'ARBITRUM',
        )
        .then((value) => expect(
              value.runtimeType,
              List<dynamic>,
            ));
  });

  test('should not get farm  - protocol malformed', () async {
    await decentrifi
        .getFarms(
          protocol: 'beef',
          network: 'ARBITRUM',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });

  test('should get farms for token', () async {
    await decentrifi
        .getFarmsForToken(
          network: 'ARBITRUM',
          protocol: 'beefy',
          token: '0x3e01dd8a5e1fb3481f0f589056b428fc308af0fb',
        )
        .then((value) => expect(
              value.runtimeType,
              List<dynamic>,
            ));
  });

  test('should not get farms for token - no farms', () async {
    await decentrifi
        .getFarmsForToken(
          network: 'POLYGON',
          protocol: 'HOP',
          token: '0x3e01dd8a5e1fb3481f0f589056b428fc308af0fb',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });

  test('should get farm positions', () async {
    await decentrifi
        .getFarmPositions(
          protocol: 'compound',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
        )
        .then((value) => expect(
              value.runtimeType,
              List<dynamic>,
            ));
  });

  test('should not get farm positions - protocol malformed', () async {
    await decentrifi
        .getFarmPositions(
          protocol: 'compoun',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });

  test('should get farm entry tx', () async {
    await decentrifi
        .getFarmEntryTransactions(
          protocol: 'beefy',
          id: 'frm_arbitrum-beefy-solidlizard-wbtc-weth',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
          amount: '1000',
        )
        .then((value) => expect(
              value.runtimeType,
              List<dynamic>,
            ));
  });

  test('should not get farm entry tx - protocol malformed', () async {
    await decentrifi
        .getFarmEntryTransactions(
          protocol: 'beef',
          id: 'frm_arbitrum-beefy-solidlizard-wbtc-weth',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
          amount: '1000',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });

  test('should get farm exit tx', () async {
    await decentrifi
        .getFarmExitTransactions(
          protocol: 'beefy',
          id: 'frm_arbitrum-beefy-solidlizard-wbtc-weth',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
          amount: '1000',
        )
        .then((value) => expect(
              value.runtimeType,
              List<dynamic>,
            ));
  });

  test('should not get farm entry tx - protocol malformed', () async {
    await decentrifi
        .getFarmExitTransactions(
          protocol: 'beef',
          id: 'frm_arbitrum-beefy-solidlizard-wbtc-weth',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
          amount: '1000',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });
}
