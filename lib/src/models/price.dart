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

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: json['amount'],
        currency: json['currency'],
        productId: json['product_id'],
        metadata: json['metadata'] ?? const [],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currency': currency,
        'product_id': productId,
        if (metadata.isNotEmpty) 'metadata': metadata,
      };
}
