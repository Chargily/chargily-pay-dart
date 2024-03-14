import 'dart:convert';
import 'package:chargily_pay/chargily_pay.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fetches balance from actual API', () async {
    final service = ChargilyPayService(
      baseUrl: "https://pay.chargily.net/test/api/v2",
      apiKey:
          'test_pk_hltuu4RLw2vBLtfFxFvq5gMDzN5OwfHWEFm30LWc', // Replace with your actual API key
      secret:
          'test_sk_zK5Qo73qY3dIQJrfFN98yVMlPXBOyUHKUMmCYl8R', // Replace with your actual secret
    );

    final result = await service.getBalance();

    expect(result, isA<Map<String, dynamic>>()); // Expect a map response
    expect(result.containsKey('entity'), true); // Check for expected keys
    expect(result.containsKey('livemode'), true);
    // You can add further assertions based on your API response structure
  });
}
