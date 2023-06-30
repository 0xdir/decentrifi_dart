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

  test('should get stats', () async {
    await decentrifi
        .getStats(
          type: 'farming',
        )
        .then((value) => expect(
              value?.isNotEmpty,
              true,
            ));
  });

  test('should not get stats - type malformed', () async {
    await decentrifi
        .getStats(
          type: 'farmin',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });
}
