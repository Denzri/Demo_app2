class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String website;
  final double lat;
  final double lng;
  final String street;
  final String companyCatchPhrase;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
    required this.lat,
    required this.lng,
    required this.street,
    required this.companyCatchPhrase,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      lat: double.parse(json['address']['geo']['lat']),
      lng: double.parse(json['address']['geo']['lng']),
      street: json['address']['street'],
      companyCatchPhrase: json['company']['catchPhrase'],
    );
  }
}
