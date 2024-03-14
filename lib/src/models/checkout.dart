import 'package:chargily_pay/src/models/checkoutitem.dart';

class Checkout {
  final String successUrl;
  final List<CheckoutItem>? items;
  final int? amount;
  final String? currency;
  final String? failureUrl;
  final String? customerId;
  final String? description;
  final String? locale;

  /// Default : edahabia .The payment method that will be used to pay the checkout. Currently supported payment methods are: “edahabia” and “cib”. The customer can always change the payment method at the checkout page.

  final String? paymentMethod;

  final String? webhookEndpoint;
  final bool? passFeesToCustomer;
  final List<Map<String, dynamic>> metadata;

  Checkout({
    required this.successUrl,
    this.items,
    this.amount,
    this.currency,
    this.failureUrl,
    this.customerId,
    this.description,
    this.locale,
    this.paymentMethod,
    this.webhookEndpoint,
    this.passFeesToCustomer,
    this.metadata = const [],
  }) {
    if (amount != null) {
      if (amount! <= 10) {
        throw Exception("amount should be greater than 10 dzd");
      }
      if (currency == null) {
        throw Exception("Currency must be provided when amount is provided");
      }
    }
  }

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
        successUrl: json['success_url'] as String,
        items: json['items']
            ?.cast<Map<String, dynamic>>()
            ?.map((item) => CheckoutItem.fromJson(item))
            .toList(),
        amount: json['amount'] as int?,
        currency: json['currency'] as String?,
        failureUrl: json['failure_url'] as String?,
        customerId: json['customer_id'] as String?,
        description: json['description'] as String?,
        locale: json['locale'] as String?,
        paymentMethod: json['payment_method'] as String?,
        webhookEndpoint: json['webhook_endpoint'] as String?,
        passFeesToCustomer: json['pass_fees_to_customer'] as bool?,
        metadata: json['metadata'] ?? const [],
      );

  Map<String, dynamic> toJson() => {
        'success_url': successUrl,
        'items': items?.map((item) => item.toJson()).toList(),
        'amount': amount,
        'currency': currency,
        'failure_url': failureUrl,
        'customer_id': customerId,
        'description': description,
        'locale': locale,
        'payment_method': paymentMethod,
        'webhook_endpoint': webhookEndpoint,
        'pass_fees_to_customer': passFeesToCustomer,
        'metadata': metadata,
      };
}
