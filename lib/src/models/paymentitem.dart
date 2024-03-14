class PaymentItem {
  final String price;
  final int quantity;
  final bool? adjustableQuantity;

  PaymentItem({
    required this.price,
    required this.quantity,
    this.adjustableQuantity,
  });

  factory PaymentItem.fromJson(Map<String, dynamic> json) => PaymentItem(
        price: json['price'] as String,
        quantity: json['quantity'] as int,
        adjustableQuantity: json['adjustable_quantity'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'price': price,
        'quantity': quantity,
        'adjustable_quantity': adjustableQuantity,
      };
}
