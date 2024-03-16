import 'dart:convert';

import 'package:chargily_pay/src/models/paymentitem.dart';

class PaymentLink {
  final String name;
  final List<PaymentItem> items;
  final String? afterCompletionMessage;
  final String? locale;
  final bool? passFeesToCustomer;
  final List<Map<String, dynamic>>? metadata;

  PaymentLink({
    required this.name,
    required this.items,
    this.afterCompletionMessage,
    this.locale,
    this.passFeesToCustomer,
    this.metadata,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        if (items.isNotEmpty)
          'items': items.map((item) => item.toJson()).toList(),
        if (afterCompletionMessage != null)
          'after_completion_message': afterCompletionMessage,
        if (locale != null) 'locale': locale,
        if (passFeesToCustomer != null)
          'pass_fees_to_customer': passFeesToCustomer,
        if (passFeesToCustomer == null) 'pass_fees_to_customer': false,
        if (metadata!.isNotEmpty)
          'metadata': metadata?.map((e) => jsonEncode(e)).toList(),
      };
}
