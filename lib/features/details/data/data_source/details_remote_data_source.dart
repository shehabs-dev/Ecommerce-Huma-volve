import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/shared/data/models/product_model.dart';

abstract class DetailsRemoteDataSource {
  Future<ProductModel> getProductById(int productId);
}

class DetailsRemoteDataSourceImpl implements DetailsRemoteDataSource {
  final ApiClient apiClient;

  DetailsRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<ProductModel> getProductById(int productId) async {
    final response = await apiClient.dio.get(
      "${ApiEndpoints.productsEndpoint}/$productId",
    );

    return ProductModel.fromJson(response.data);
  }
}
