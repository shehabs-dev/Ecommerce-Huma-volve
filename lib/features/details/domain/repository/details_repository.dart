import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/shared/domain/entities/product_entity.dart';

abstract class DetailsRepository {
  Future<Either<Failure, ProductEntity>> getProductById(int productId);
}
