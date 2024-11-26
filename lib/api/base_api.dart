import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BaseApi {
  final String _baseUrl = 'http://localhost:5000'; // Replace with your actual base URL.
  late final Dio _dio;
  final _secureStorage = const FlutterSecureStorage(); // Secure storage instance

  BaseApi() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
  }

  // Function to get token from secure storage
  Future<String?> _getToken() async {
    return await _secureStorage.read(key: 'authToken');
  }

  // General API call function
  Future<dynamic> apiRequest({
    required String url,
    required String method, // 'GET', 'POST', 'PUT', 'DELETE', etc.
    Map<String, dynamic>? data, // Body parameters for POST/PUT
    Map<String, dynamic>? queryParameters, // Query parameters for GET
    Map<String, String>? additionalHeaders, // Additional headers
    ProgressCallback? onSendProgress, // For file upload progress
    ProgressCallback? onReceiveProgress, // For download progress
  }) async {
    try {
      // Fetch token from secure storage
      String? token = await _getToken();
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      if (additionalHeaders != null) {
        headers.addAll(additionalHeaders);
      }

      // Perform the API request
      final response = await _dio.request(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: method,
          headers: headers,
        ),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on DioException catch (e) {
      // Log error and handle Dio-specific exceptions
      log("DioException: ${e.message}");
      if (e.response != null) {
        log("Response Data: ${e.response?.data}");
      }
      throw e;
    } catch (e) {
      // Log unexpected errors
      log("Unexpected error: $e");
    }
  }
}
