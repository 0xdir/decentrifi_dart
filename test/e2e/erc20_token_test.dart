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
        .getERC20TokenInformation(
          network: 'ETHEREUM',
          address: '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48',
        )
        .then((value) => expect(
              value?.isNotEmpty,
              true,
            ));
  });

  test('should not get token info - network malformed', () async {
    await decentrifi
        .getERC20TokenInformation(
          network: 'ETHEREU',
          address: '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });
}
