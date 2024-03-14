import 'package:chargily_pay/src/models/address.dart';

class Customer {
  final String name;
  final String email;
  final String? phone;
  final Address? address;
  final List<Map<String, dynamic>> metadata;

  Customer({
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.metadata = const [],
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        address: Address.fromJson(json['address']),
        metadata: json['metadata'] ?? const [],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'address': address?.toJson(),
        if (metadata.isNotEmpty) 'metadata': metadata,
      };
}
