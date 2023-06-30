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

  test('should get lending', () async {
    await decentrifi
        .getLending(
          protocol: 'compound',
        )
        .then((value) => expect(
              value.runtimeType,
              List<dynamic>,
            ));
  });

  test('should not get lending  - protocol malformed', () async {
    await decentrifi
        .getLending(
          protocol: 'compoun',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });

  test('should get lending for token', () async {
    await decentrifi
        .getLendingForToken(
          network: 'ETHEREUM',
          protocol: 'compound',
          token: '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48',
        )
        .then((value) => expect(
              value.runtimeType,
              List<dynamic>,
            ));
  });

  test('should not get lending for token - no farms', () async {
    await decentrifi
        .getLendingForToken(
          network: 'ETHEREU',
          protocol: 'compound',
          token: '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });

  test('should get lending positions', () async {
    await decentrifi
        .getLendingPositions(
          protocol: 'compound',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
        )
        .then((value) => expect(
              value.runtimeType,
              List<dynamic>,
            ));
  });

  test('should not get lending positions - protocol malformed', () async {
    await decentrifi
        .getLendingPositions(
          protocol: 'compoun',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });

  test('should get lending entry tx', () async {
    await decentrifi
        .getLendingEntryTransactions(
          protocol: 'compound',
          id: 'lnd_ethereum-compound-0x6c8c6b02e7b2be14d4fa6022dfd6d75921d90e4e',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
          amount: '1000',
        )
        .then((value) => expect(
              value.runtimeType,
              List<dynamic>,
            ));
  });

  test('should not get lending entry tx - protocol malformed', () async {
    await decentrifi
        .getLendingEntryTransactions(
          protocol: 'compoun',
          id: 'lnd_ethereum-compound-0x6c8c6b02e7b2be14d4fa6022dfd6d75921d90e4e',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
          amount: '1000',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });

  test('should not get lending exit tx - not supported', () async {
    await decentrifi
        .getLendingExitTransactions(
          protocol: 'compound',
          id: 'lnd_ethereum-compound-0x6c8c6b02e7b2be14d4fa6022dfd6d75921d90e4e',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
          amount: '1000',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });

  test('should not get lending entry tx - protocol malformed', () async {
    await decentrifi
        .getLendingExitTransactions(
          protocol: 'compoun',
          id: 'lnd_ethereum-compound-0x6c8c6b02e7b2be14d4fa6022dfd6d75921d90e4e',
          address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
          amount: '1000',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });
}
