import 'package:decentrifi/src/objects/result.dart';

class Address implements Result {
  String? address;
  String? tag;
  String? ensName;

  Address({this.address, this.tag, this.ensName});

  Address.fromMap(Map<String, dynamic> map) {
    address = map['address'] ?? '';
    tag = map['tag'] ?? '';
    ensName = map['name'] ?? '';
  }
}
