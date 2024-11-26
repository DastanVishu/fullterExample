import 'base_api.dart';

class AuthApi extends BaseApi {
  Future<dynamic> login(Map<String, dynamic> data) async {
    return await apiRequest(
      url: '/auth/login',
      method: 'POST',
      data: data,
    );
  }

  Future<dynamic> register(Map<String, dynamic> data) async {
    return await apiRequest(
      url: '/auth/register',
      method: 'POST',
      data: data,
    );
  }

  Future<dynamic> getProfile() async {
    return await apiRequest(
      url: '/auth/get-profile',
      method: 'GET',
    );
  }
}
