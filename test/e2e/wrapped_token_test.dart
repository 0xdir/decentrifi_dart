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

  test('should get wrapped token address', () async {
    await decentrifi
        .getWrappedTokenAddress(
          network: 'ETHEREUM',
        )
        .then((value) => expect(
              value?.isNotEmpty,
              true,
            ));
  });

  test('should not get wrapped token address - network malformed', () async {
    await decentrifi
        .getWrappedTokenAddress(
          network: 'ETHEREU',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });
}
