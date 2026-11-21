import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_client.dart';
import '../model/token_model.dart';
import '../model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<TokenModel> signIn({
    required String username,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  new({required this.apiClient});
  @override
  Future<TokenModel> signIn({
    required String username,
    required String password,
  }) async {
    final response = await apiClient.dio.post(
      ApiEndpoints.dummyJsonAuthLogin,
      data: {"username": username, "password": password},
    );

    return TokenModel.fromJson(response.data);
  }

  @override
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await apiClient.dio.post(
      ApiEndpoints.dummyJsonAddUser,
      data: {"firstName": name, "email": email, "password": password},
    );

    return UserModel.fromJson(response.data);
  }
}
