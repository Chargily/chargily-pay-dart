import 'dart:convert';

class Price {
  final int amount;
  final String currency;
  final String productId;
  final List<Map<String, dynamic>> metadata;

  Price({
    required this.amount,
    required this.currency,
    required this.productId,
    this.metadata = const [],
  });

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currency': currency,
        'product_id': productId,
        if (metadata.isNotEmpty)
          'metadata': metadata.map((e) => jsonEncode(e)).toList(),
      };
}
