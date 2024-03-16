class PaymentItem {
  final String price;
  final int quantity;
  final bool? adjustableQuantity;

  PaymentItem({
    required this.price,
    required this.quantity,
    this.adjustableQuantity,
  });

  Map<String, dynamic> toJson() => {
        'price': price,
        'quantity': quantity,
        if (adjustableQuantity != null)
          'adjustable_quantity': adjustableQuantity,
      };
}
