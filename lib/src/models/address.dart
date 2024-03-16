class Address {
  final String? country;
  final String? state;
  final String? address;

  Address({this.country, this.state, this.address});

  Map<String, dynamic> toJson() => {
        if (country != null) 'country': country,
        if (state != null) 'state': state,
        if (address != null) 'address': address,
      };
}
