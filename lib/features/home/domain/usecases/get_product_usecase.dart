import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repository/home_repository.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/shared/domain/entities/product_entity.dart';

class GetProductUsecase {
  final HomeRepository _repository;
  GetProductUsecase({required this._repository});

  Future<Either<Failure, List<ProductEntity>>> invoke(
    String slug, {
    required int limit,
    required int offset,
  }) {
    return _repository.getProductsByCategory(
      slug,
      limit: limit,
      offset: offset,
    );
  }
}
