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

  test('should get label', () async {
    await decentrifi
        .getLabeledAddress(
          address: '0x3cc936b795a188f0e246cbb2d74c5bd190aecf18',
        )
        .then((value) => expect(
              value,
              'Mexc.com 3',
            ));
  });

  test('should not get label - address malformed', () async {
    await decentrifi
        .getLabeledAddress(
          /// Address is malformed, missing the last character
          address: '0x3cc936b795a188f0e246cbb2d74c5bd190aecf1',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });

  test('should not get label - no label', () async {
    await decentrifi
        .getLabeledAddress(
          address: '0x3cc936b795a188f0e246cbb2d74c5bd190aecf1A',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });
}
