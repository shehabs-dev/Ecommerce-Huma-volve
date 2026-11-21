import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/shared/domain/entities/product_entity.dart';
import '../repository/details_repository.dart';

class GetProductByIdUsecase {
  final DetailsRepository repository;

  GetProductByIdUsecase({required this.repository});

  Future<Either<Failure, ProductEntity>> invoke(int productId) async {
    return await repository.getProductById(productId);
  }
}
