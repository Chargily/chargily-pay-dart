import 'dart:convert';

class Product {
  final String name;
  final String? description;
  final List<String> images;
  final List<Map<String, dynamic>> metadata;

  Product({
    required this.name,
    this.description, // Set default value for optional fields
    this.images = const [],
    this.metadata = const [],
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        if (description != null) 'description': description,
        if (images.isNotEmpty)
          'images': images.map((e) => jsonEncode(e)).toList(),
        if (metadata.isNotEmpty)
          'metadata': metadata.map((e) => jsonEncode(e)).toList(),
      };
}
