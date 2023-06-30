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

  test('should get events', () async {
    await decentrifi
        .getEvents(
          tx: '0xc39bca069cdc89832387d2dc57ef395ab2896013144a252d614e5ab2c88edb5e',
          network: 'ETHEREUM',
        )
        .then((value) => expect(
              value.runtimeType,
              List<dynamic>,
            ));
  });

  test('should not get events - network malformed', () async {
    await decentrifi
        .getEvents(
          tx: '0xc39bca069cdc89832387d2dc57ef395ab2896013144a252d614e5ab2c88edb5e',
          network: 'ETHEREU',
        )
        .then((value) => expect(
              value,
              null,
            ));
  });
}
