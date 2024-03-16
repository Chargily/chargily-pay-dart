library chargily_pay;

import 'package:chargily_pay/src/base_api_url.dart';
import 'package:chargily_pay/src/models/checkout.dart';
import 'package:chargily_pay/src/models/customer.dart';
import 'package:chargily_pay/src/models/paymentlink.dart';
import 'package:chargily_pay/src/models/price.dart';
import 'package:chargily_pay/src/models/product.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ChargilyPayService {
  final String baseUrl;
  final String apiKey;
  final String secret;
  final Dio dio;

  ChargilyPayService({
    required this.apiKey,
    required this.secret,
    this.baseUrl = chargilyUrl,
  }) : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: {
              'Authorization': 'Bearer $secret',
              //'Content-Type': 'application/json',
            },
            //receiveTimeout: const Duration(seconds: 10),
            //connectTimeout: const Duration(seconds: 5),
          ),
        );

  // ==================================
  // Balance
  // ==================================
  /// Get the account Balance for different currencies. The response body is returned as [Map<String, dynamic>].
  Future getBalance() async {
    try {
      final response = await dio.get('/balance');
      return response;
    } catch (error) {
      throw Exception('Failed to get balance: $error');
    }
  }

  /*Future<Map<String, dynamic>> getBalance() async {
    try {
      final response = await dio.get('/balance');

    } catch (error) {
      throw Exception('Failed to get balance: $error');
    }

    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else if (response.statusCode == 422) {
      throw Exception("Status code 422: HTTP Error ${response.data}");
    } else {
      return response.data as Map<String, dynamic>;
    }
  } */

  // **********************
  // *** CUSTOMERS ***
  // **********************

  // CREATE CUSTOMER
  /// Create a customer by providing the [customer] of type [Customer].
  Future createCustomer({required Customer customer}) async {
    try {
      final response = await dio.post('/customers', data: customer.toJson());
      return response;
    } catch (error) {
      throw Exception('Failed to create customer: $error');
    }
  }

  // UPDATE CUSTOMER
  /// Update a customer by providing the [id] of the customer.
  Future updateCustomer(
      {required String id, required Customer customer}) async {
    try {
      final response =
          await dio.post('/customers/$id', data: customer.toJson());

      return response;
    } catch (error) {
      throw Exception('Failed to update customer: $error');
    }
  }

  // RETRIEVE CUSTOMER
  /// Retrieve a single customer by providing the [id] of the customer.
  Future retrieveCustomer({required String id}) async {
    try {
      final response = await dio.get('/customers/$id');

      return response;
    } catch (error) {
      throw Exception('Failed to retrieve the customer: $error');
    }
  }

  // LIST CUSTOMERS
  /// List all customers. [perPage] is used to define how many customers you want to retrieve per page. [perPage] default 10.
  Future listCustomers({int perPage = 10}) async {
    try {
      final response = await dio.get(
        '/customers',
        queryParameters: {'per_page': perPage},
      );

      return response;
    } catch (error) {
      throw Exception('Failed to list all customers: $error');
    }
  }

  // DELETE CUSTOMER
  /// Delete a customer by providing the [id] of the customer
  Future deleteCustomer({required String id}) async {
    try {
      final response = await dio.delete('/customers/$id');
      return response;
    } catch (error) {
      throw Exception('Failed to delete the customer: $error');
    }
  }

  // **********************
  // *** PRODUCTS ***
  // **********************

  /// Create a product by providing the [product] of type [Product].
  Future createProduct({required Product product}) async {
    try {
      final response = await dio.post('/products', data: product.toJson());
      return response;
    } catch (error) {
      throw Exception('Failed to create the product: $error');
    }
  }

  /// Update a product by providing the [id] of the product and the [product] of type [Product].
  Future updateProduct({required String id, required Product product}) async {
    try {
      final response = await dio.post('/products/$id', data: product.toJson());

      return response;
    } catch (error) {
      throw Exception('Failed to update product: $error');
    }
  }

  /// Retrieve a single product by providing the [id] of the product.
  Future retrieveProduct({required String id}) async {
    try {
      final response = await dio.get('/products/$id');

      return response;
    } catch (error) {
      throw Exception('Failed to retrieve the product: $error');
    }
  }

  /// List all products. [perPage] is used to define how many products you want to retrieve per page. [perPage] default 10.
  Future listProducts({int perPage = 10}) async {
    try {
      final response = await dio.get(
        '/products',
        queryParameters: {'per_page': perPage},
      );

      return response;
    } catch (error) {
      throw Exception('Failed to list all products: $error');
    }
  }

  /// Delete a product by providing the [id] of the product.
  Future deleteProduct({required String id}) async {
    try {
      final response = await dio.delete('/products/$id');
      return response;
    } catch (error) {
      throw Exception('Failed to delete the product: $error');
    }
  }

  /// Retrieve all the prices of the product.

  Future retrieveProductPrices({required String id, int perPage = 10}) async {
    try {
      final response = await dio.get(
        '/products/$id/prices',
        queryParameters: {'per_page': perPage},
      );

      return response;
    } catch (error) {
      throw Exception(
          'Failed to retrieve all the prices of the product: $error');
    }
  }

  // **********************
  // *** PRICES ***
  // **********************

  /// Create a price by providing the [price] object of type [Price].
  Future createPrice({required Price price}) async {
    try {
      final response = await dio.post('/prices', data: price.toJson());
      return response;
    } catch (error) {
      throw Exception('Failed to create the price: $error');
    }
  }

  /// Update a price by providing the [id] of the price and the [metadata] of type [List<Map<String, dynamic>>].
  Future updatePrice(
      {required String id,
      required List<Map<String, dynamic>> metadata}) async {
    try {
      final response =
          await dio.post('/prices/$id', data: {"metadata": metadata});

      return response;
    } catch (error) {
      throw Exception('Failed to update price: $error');
    }
  }

  /// Retrieve a single price by providing the [id] of the price.
  Future retrievePrice({required String id}) async {
    try {
      final response = await dio.get('/prices/$id');

      return response;
    } catch (error) {
      throw Exception('Failed to retrieve the price: $error');
    }
  }

  /// List all prices. [perPage] is used to define how many prices you want to retrieve per page. [perPage] default 10.
  Future listPrices({int perPage = 10}) async {
    try {
      final response = await dio.get(
        '/prices',
        queryParameters: {'per_page': perPage},
      );

      return response;
    } catch (error) {
      throw Exception('Failed to list all prices: $error');
    }
  }

  // **********************
  // *** CHECKOUTS ***
  // **********************

  /// Create a checkout by providing the [checkout] object of type [Checkout].
  Future createCheckout({required Checkout checkout}) async {
    if (kDebugMode) {
      print(checkout.toJson());
    }
    try {
      final response = await dio.post('/checkouts', data: checkout.toJson());

      return response;
    } catch (error) {
      throw Exception('Failed to create checkout: $error');
    }
  }

  /// Retrieve a single checkout by providing the [id] of the checkout.
  Future retrieveCheckout({required String id}) async {
    try {
      final response = await dio.get('/checkouts/$id');

      return response;
    } catch (error) {
      throw Exception('Failed to retrieve the checkout: $error');
    }
  }

  /// List all checkouts. [perPage] is used to define how many checkouts you want to retrieve per page. [perPage] default 10.
  Future listCheckouts({int perPage = 10}) async {
    try {
      final response = await dio.get(
        '/checkouts',
        queryParameters: {'per_page': perPage},
      );

      return response;
    } catch (error) {
      throw Exception('Failed to list all checkouts: $error');
    }
  }

  /// Retrieve a checkout items. [perPage] is used to define how many checkout items you want to retrieve per page. [perPage] default 10.
  Future retrieveCheckoutItems({required String id, int perPage = 10}) async {
    try {
      final response = await dio.get(
        '/checkouts/$id/items',
        queryParameters: {'per_page': perPage},
      );

      return response;
    } catch (error) {
      throw Exception('Failed to retrieve checkout items: $error');
    }
  }

  /// By default, a Checkout expires automatically after 30 minutes. You can expire a Checkout manually by calling this endpoint.
  ///
  /// A Session can be expired only when it is not expired yet and its status is pending.
  ///
  /// Once the Session expires, your customers are unable to pay, and those attempting to load it will encounter a message indicating that it has expired.
  Future expireCheckout({required int id}) async {
    try {
      final response = await dio.post('/checkouts/$id/expire');
      if (response.statusCode == 400) {
        return {"message": "Checkout has already expired"};
      } else if (response.statusCode == 403) {
        return {"message": "Checkout status is not pending"};
      }
      return response;
    } catch (error) {
      throw Exception('Failed to expire checkout: $error');
    }
  }

  // **********************
  // *** PAYMENT LINKS ***
  // **********************

  /// Create a payment link by providing the [paymentLink] object of type [PaymentLink].
  Future createPaymentLink({required PaymentLink paymentLink}) async {
    try {
      final response =
          await dio.post('/payment-links', data: paymentLink.toJson());

      return response;
    } catch (error) {
      throw Exception('Failed to create payment link: $error');
    }
  }

  /// Update a payment link by providing the [id] of the payment link and [paymentLink] object of type [PaymentLink].
  Future updatePaymentLink(
      {required String id, required PaymentLink paymentLink}) async {
    try {
      final response =
          await dio.post('/payment-links/$id', data: paymentLink.toJson());

      return response;
    } catch (error) {
      throw Exception('Failed to create payment link: $error');
    }
  }

  /// Retrieve Payment link by providing the [id] of the payment link.

  Future retrievePaymentLink({required String id}) async {
    try {
      final response = await dio.get('/payment-links/$id');

      return response;
    } catch (error) {
      throw Exception('Failed to retrieve the payment link: $error');
    }
  }

  /// List all payment links. [perPage] is used to define how many payment links you want to retrieve per page. [perPage] default 10.
  Future listPaymentLinks({int perPage = 10}) async {
    try {
      final response = await dio.get(
        '/payment-links',
        queryParameters: {'per_page': perPage},
      );

      return response;
    } catch (error) {
      throw Exception('Failed to list all payment links: $error');
    }
  }

  /// Retrieve a payment link items. [perPage] is used to define how many payment link items you want to retrieve per page. [perPage] default 10.
  Future retrievePaymentLinkItems(
      {required String id, int perPage = 10}) async {
    try {
      final response = await dio.get(
        '/payment-links/$id/items',
        queryParameters: {'per_page': perPage},
      );

      return response;
    } catch (error) {
      throw Exception('Failed to retrieve payment link items: $error');
    }
  }
}
