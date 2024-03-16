import 'dart:convert';

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

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        if (phone != null) 'phone': phone,
        if (address?.address != null ||
            address?.state != null ||
            address?.country != null)
          'address': address?.toJson(),
        if (metadata.isNotEmpty)
          'metadata': metadata.map((e) => jsonEncode(e)).toList(),
      };
}
