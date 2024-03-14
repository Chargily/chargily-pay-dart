class Product {
  final String name;
  final String description;
  final List<String> images;
  final List<Map<String, dynamic>> metadata;

  Product({
    required this.name,
    this.description = '', // Set default value for optional fields
    this.images = const [],
    this.metadata = const [],
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json['name'],
        description: json['description'] ?? '',
        images: json['images']?.cast<String>() ?? const [],
        metadata: json['metadata'] ?? const [],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        if (description.isNotEmpty) 'description': description,
        if (images.isNotEmpty) 'images': images,
        if (metadata.isNotEmpty) 'metadata': metadata,
      };
}
