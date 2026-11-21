import 'package:dartz/dartz.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/shared/domain/entities/product_entity.dart';
import '../../domain/repository/details_repository.dart';
import '../data_source/details_remote_data_source.dart';

class DetailsRepositoryImpl implements DetailsRepository {
  final DetailsRemoteDataSource remote;

  new({required this.remote});
  @override
  Future<Either<Failure, ProductEntity>> getProductById(int productId) async {
    try {
      final product = await remote.getProductById(productId);

      return right(product);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
