import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/shared/data/models/category_model.dart';
import '../../../../core/shared/data/models/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProductsByCategory(
    String slug, {
    required int limit,
    required int offset,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient _apiClient;
  HomeRemoteDataSourceImpl({required this._apiClient});

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiClient.dio.get(
      "${ApiEndpoints.productsEndpoint}/${ApiEndpoints.dummyJsonCategoriesEndpoint}",
    );

    final List jsonData = response.data;

    List<CategoryModel> category = jsonData
        .map((e) => CategoryModel.fromJson(e))
        .toList();

    return category;
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(
    String slug, {
    required int limit,
    required int offset,
  }) async {
    final response = await _apiClient.dio.get(
      "${ApiEndpoints.productsEndpoint}/${ApiEndpoints.dummyJsonCategoryEndpoint}/$slug",

      queryParameters: {"limit": limit, "skip": offset},
    );

    final List jsonData = response.data['products'];

    List<ProductModel> products = jsonData
        .map((e) => ProductModel.fromJson(e))
        .toList();

    return products;
  }
}
