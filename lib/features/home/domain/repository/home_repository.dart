import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/shared/domain/entities/category_entity.dart';
import '../../../../core/shared/domain/entities/product_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
    String slug, {
    required int limit,
    required int offset,
  });
}
