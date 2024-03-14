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

  factory PaymentLink.fromJson(Map<String, dynamic> json) => PaymentLink(
        name: json['name'] as String,
        items: json['items']
                ?.cast<Map<String, dynamic>>()
                ?.map((item) => PaymentItem.fromJson(item))
                .toList() ??
            [],
        afterCompletionMessage: json['after_completion_message'] as String?,
        locale: json['locale'] as String?,
        passFeesToCustomer: json['pass_fees_to_customer'] as bool?,
        metadata: json['metadata']?.cast<Map<String, dynamic>>(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'items': items.map((item) => item.toJson()).toList(),
        'after_completion_message': afterCompletionMessage,
        'locale': locale,
        'pass_fees_to_customer': passFeesToCustomer,
        'metadata': metadata,
      };
}
