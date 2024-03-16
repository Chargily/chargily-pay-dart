import 'dart:convert';

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

  Map<String, dynamic> toJson() => {
        // Include items only if amount is not provided
        if (amount == null)
          'items': items?.map((item) => item.toJson()).toList(),

        // Include amount only if items are not provided
        if (items == null) 'amount': amount,
        'success_url': successUrl,
        'currency': currency,
        if (failureUrl != null) 'failure_url': failureUrl,
        if (customerId != null) 'customer_id': customerId,
        if (description != null) 'description': description,
        if (locale != null) 'locale': locale,
        if (paymentMethod != null) 'payment_method': paymentMethod,
        if (webhookEndpoint != null) 'webhook_endpoint': webhookEndpoint,
        if (passFeesToCustomer != null)
          'pass_fees_to_customer': passFeesToCustomer,
        if (metadata.isNotEmpty)
          'metadata': metadata.map((e) => jsonEncode(e)).toList()
      };
}
