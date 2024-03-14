class Address {
  final String? country;
  final String? state;
  final String? address;

  Address({this.country, this.state, this.address});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        country: json['country'] as String?,
        state: json['state'] as String?,
        address: json['address'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'state': state,
        'address': address,
      };
}
