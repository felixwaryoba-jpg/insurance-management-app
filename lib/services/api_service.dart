import 'package:dio/dio.dart';
import '../models/policy_model.dart';
import '../utils/constants.dart';

class ApiService {
  final Dio _dio = Dio();
  
  ApiService() {
    _dio.options.baseUrl = AppConstants.apiBaseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  // Policies API
  Future<List<Policy>> getPolicies(String userId) async {
    try {
      final response = await _dio.get(
        AppConstants.policiesEndpoint,
        queryParameters: {'userId': userId},
      );
      List<Policy> policies = [];
      for (var policy in response.data) {
        policies.add(Policy.fromJson(policy));
      }
      return policies;
    } catch (e) {
      throw Exception('Failed to fetch policies: $e');
    }
  }

  Future<Policy> getPolicy(String policyId) async {
    try {
      final response = await _dio.get(
        '${AppConstants.policiesEndpoint}/$policyId',
      );
      return Policy.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch policy: $e');
    }
  }

  Future<bool> createPolicy(Policy policy) async {
    try {
      await _dio.post(
        AppConstants.policiesEndpoint,
        data: policy.toJson(),
      );
      return true;
    } catch (e) {
      throw Exception('Failed to create policy: $e');
    }
  }

  Future<bool> updatePolicy(Policy policy) async {
    try {
      await _dio.put(
        '${AppConstants.policiesEndpoint}/${policy.id}',
        data: policy.toJson(),
      );
      return true;
    } catch (e) {
      throw Exception('Failed to update policy: $e');
    }
  }

  Future<bool> deletePolicy(String policyId) async {
    try {
      await _dio.delete(
        '${AppConstants.policiesEndpoint}/$policyId',
      );
      return true;
    } catch (e) {
      throw Exception('Failed to delete policy: $e');
    }
  }

  // File upload
  Future<String> uploadFile(String filePath) async {
    try {
      final file = await MultipartFile.fromFile(filePath);
      final formData = FormData.fromMap({
        'file': file,
      });
      
      final response = await _dio.post(
        '/upload',
        data: formData,
      );
      
      return response.data['url'] ?? '';
    } catch (e) {
      throw Exception('Failed to upload file: $e');
    }
  }
}
