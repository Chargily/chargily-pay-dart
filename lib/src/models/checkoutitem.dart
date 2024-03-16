class CheckoutItem {
  final String price;
  final int quantity;

  CheckoutItem({required this.price, required this.quantity});

  Map<String, dynamic> toJson() => {
        'price': price,
        'quantity': quantity,
      };
}
