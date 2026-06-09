import 'package:flutter/material.dart';
import '../models/policy_model.dart';

class PolicyProvider extends ChangeNotifier {
  List<Policy> _policies = [];
  bool _isLoading = false;
  String? _error;

  List<Policy> get policies => _policies;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Get all policies for a user
  Future<void> fetchPolicies(String userId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Fetch from API/Firebase
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get single policy
  Policy? getPolicy(String policyId) {
    try {
      return _policies.firstWhere((p) => p.id == policyId);
    } catch (e) {
      return null;
    }
  }

  // Add policy
  Future<bool> addPolicy({required Policy policy}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _policies.add(policy);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Update policy
  Future<bool> updatePolicy({required Policy policy}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final index = _policies.indexWhere((p) => p.id == policy.id);
      if (index != -1) {
        _policies[index] = policy;
      }
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Delete policy
  Future<bool> deletePolicy(String policyId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _policies.removeWhere((p) => p.id == policyId);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Get active policies
  List<Policy> get activePolicies => _policies
      .where((p) => p.status == PolicyStatus.active)
      .toList();

  // Get expired policies
  List<Policy> get expiredPolicies => _policies
      .where((p) => p.status == PolicyStatus.expired)
      .toList();

  // Get policies with due premiums
  List<Policy> get policiesWithDuePremiums => _policies
      .where((p) => p.isPremiumDue && p.status == PolicyStatus.active)
      .toList();
}
