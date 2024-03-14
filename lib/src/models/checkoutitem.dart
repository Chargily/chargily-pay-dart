class CheckoutItem {
  final String price;
  final int quantity;

  CheckoutItem({required this.price, required this.quantity});

  factory CheckoutItem.fromJson(Map<String, dynamic> json) => CheckoutItem(
        price: json['price'] as String,
        quantity: json['quantity'] as int,
      );

  Map<String, dynamic> toJson() => {
        'price': price,
        'quantity': quantity,
      };
}
