enum PolicyStatus { active, inactive, expired, pending, cancelled }

enum PolicyType { health, life, auto, home, travel, disability }

class Policy {
  final String id;
  final String userId;
  final String policyNumber;
  final PolicyType policyType;
  final PolicyStatus status;
  final String providerName;
  final String coverageAmount;
  final double premium;
  final String premiumFrequency;
  final DateTime issueDate;
  final DateTime expiryDate;
  final DateTime nextPremiumDate;
  final String description;
  final List<String> coverageDetails;
  final String documentUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  Policy({
    required this.id,
    required this.userId,
    required this.policyNumber,
    required this.policyType,
    required this.status,
    required this.providerName,
    required this.coverageAmount,
    required this.premium,
    required this.premiumFrequency,
    required this.issueDate,
    required this.expiryDate,
    required this.nextPremiumDate,
    required this.description,
    required this.coverageDetails,
    required this.documentUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Policy.fromJson(Map<String, dynamic> json) {
    return Policy(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      policyNumber: json['policyNumber'] ?? '',
      policyType: PolicyType.values.firstWhere(
        (e) => e.toString().split('.').last == json['policyType'],
        orElse: () => PolicyType.health,
      ),
      status: PolicyStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
        orElse: () => PolicyStatus.pending,
      ),
      providerName: json['providerName'] ?? '',
      coverageAmount: json['coverageAmount'] ?? '',
      premium: (json['premium'] ?? 0).toDouble(),
      premiumFrequency: json['premiumFrequency'] ?? 'Monthly',
      issueDate: DateTime.parse(json['issueDate'] ?? DateTime.now().toString()),
      expiryDate: DateTime.parse(json['expiryDate'] ?? DateTime.now().toString()),
      nextPremiumDate: DateTime.parse(json['nextPremiumDate'] ?? DateTime.now().toString()),
      description: json['description'] ?? '',
      coverageDetails: List<String>.from(json['coverageDetails'] ?? []),
      documentUrl: json['documentUrl'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'policyNumber': policyNumber,
        'policyType': policyType.toString().split('.').last,
        'status': status.toString().split('.').last,
        'providerName': providerName,
        'coverageAmount': coverageAmount,
        'premium': premium,
        'premiumFrequency': premiumFrequency,
        'issueDate': issueDate.toIso8601String(),
        'expiryDate': expiryDate.toIso8601String(),
        'nextPremiumDate': nextPremiumDate.toIso8601String(),
        'description': description,
        'coverageDetails': coverageDetails,
        'documentUrl': documentUrl,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  bool get isExpired => DateTime.now().isAfter(expiryDate);
  bool get isPremiumDue => DateTime.now().isAfter(nextPremiumDate);

  Policy copyWith({
    String? id,
    String? userId,
    String? policyNumber,
    PolicyType? policyType,
    PolicyStatus? status,
    String? providerName,
    String? coverageAmount,
    double? premium,
    String? premiumFrequency,
    DateTime? issueDate,
    DateTime? expiryDate,
    DateTime? nextPremiumDate,
    String? description,
    List<String>? coverageDetails,
    String? documentUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Policy(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      policyNumber: policyNumber ?? this.policyNumber,
      policyType: policyType ?? this.policyType,
      status: status ?? this.status,
      providerName: providerName ?? this.providerName,
      coverageAmount: coverageAmount ?? this.coverageAmount,
      premium: premium ?? this.premium,
      premiumFrequency: premiumFrequency ?? this.premiumFrequency,
      issueDate: issueDate ?? this.issueDate,
      expiryDate: expiryDate ?? this.expiryDate,
      nextPremiumDate: nextPremiumDate ?? this.nextPremiumDate,
      description: description ?? this.description,
      coverageDetails: coverageDetails ?? this.coverageDetails,
      documentUrl: documentUrl ?? this.documentUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
