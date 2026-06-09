import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/policy_model.dart';
import '../models/claim_model.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<Database> get database async {
    _database ??= await _initializeDB();
    return _database!;
  }

  Future<Database> _initializeDB() async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, 'insurance_management.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Policies table
    await db.execute('''
      CREATE TABLE policies (
        id TEXT PRIMARY KEY,
        userId TEXT NOT NULL,
        policyNumber TEXT NOT NULL,
        policyType TEXT NOT NULL,
        status TEXT NOT NULL,
        providerName TEXT NOT NULL,
        coverageAmount TEXT NOT NULL,
        premium REAL NOT NULL,
        premiumFrequency TEXT NOT NULL,
        issueDate TEXT NOT NULL,
        expiryDate TEXT NOT NULL,
        nextPremiumDate TEXT NOT NULL,
        description TEXT NOT NULL,
        documentUrl TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        updatedAt TEXT NOT NULL
      )
    ''');

    // Claims table
    await db.execute('''
      CREATE TABLE claims (
        id TEXT PRIMARY KEY,
        userId TEXT NOT NULL,
        policyId TEXT NOT NULL,
        claimNumber TEXT NOT NULL,
        claimType TEXT NOT NULL,
        status TEXT NOT NULL,
        description TEXT NOT NULL,
        claimedAmount REAL NOT NULL,
        approvedAmount REAL NOT NULL,
        claimDate TEXT NOT NULL,
        approvalDate TEXT,
        rejectionReason TEXT,
        hospitalName TEXT NOT NULL,
        admissionDate TEXT NOT NULL,
        dischargeDate TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        updatedAt TEXT NOT NULL
      )
    ''');
  }

  // Policies methods
  Future<int> insertPolicy(Policy policy) async {
    final db = await database;
    return db.insert('policies', _policyToMap(policy));
  }

  Future<List<Policy>> getPolicies(String userId) async {
    final db = await database;
    final maps = await db.query(
      'policies',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    return List.generate(maps.length, (i) => Policy.fromJson(maps[i]));
  }

  Future<int> updatePolicy(Policy policy) async {
    final db = await database;
    return db.update(
      'policies',
      _policyToMap(policy),
      where: 'id = ?',
      whereArgs: [policy.id],
    );
  }

  Future<int> deletePolicy(String id) async {
    final db = await database;
    return db.delete('policies', where: 'id = ?', whereArgs: [id]);
  }

  // Claims methods
  Future<int> insertClaim(Claim claim) async {
    final db = await database;
    return db.insert('claims', _claimToMap(claim));
  }

  Future<List<Claim>> getClaims(String userId) async {
    final db = await database;
    final maps = await db.query(
      'claims',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    return List.generate(maps.length, (i) => Claim.fromJson(maps[i]));
  }

  Future<int> updateClaim(Claim claim) async {
    final db = await database;
    return db.update(
      'claims',
      _claimToMap(claim),
      where: 'id = ?',
      whereArgs: [claim.id],
    );
  }

  Map<String, dynamic> _policyToMap(Policy policy) {
    return policy.toJson();
  }

  Map<String, dynamic> _claimToMap(Claim claim) {
    return claim.toJson();
  }
}
