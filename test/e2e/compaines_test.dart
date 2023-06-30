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

  test('should get compaines', () async {
    await decentrifi.getCompanies().then((value) => expect(
          value.runtimeType,
          List<dynamic>,
        ));
  });
}
