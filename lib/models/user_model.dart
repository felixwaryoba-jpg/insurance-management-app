class User {
  final String uid;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String dateOfBirth;
  final String gender;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final String profileImage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool emailVerified;

  User({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    this.profileImage = '',
    required this.createdAt,
    required this.updatedAt,
    this.emailVerified = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      fullName: json['fullName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      zipCode: json['zipCode'] ?? '',
      profileImage: json['profileImage'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toString()),
      emailVerified: json['emailVerified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'dateOfBirth': dateOfBirth,
        'gender': gender,
        'address': address,
        'city': city,
        'state': state,
        'zipCode': zipCode,
        'profileImage': profileImage,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'emailVerified': emailVerified,
      };

  User copyWith({
    String? uid,
    String? email,
    String? fullName,
    String? phoneNumber,
    String? dateOfBirth,
    String? gender,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? profileImage,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? emailVerified,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      profileImage: profileImage ?? this.profileImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      emailVerified: emailVerified ?? this.emailVerified,
    );
  }
}
