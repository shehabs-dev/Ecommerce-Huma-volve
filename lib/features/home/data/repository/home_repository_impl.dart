import 'package:dartz/dartz.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/shared/domain/entities/category_entity.dart';
import '../../../../core/shared/domain/entities/product_entity.dart';
import '../../domain/repository/home_repository.dart';
import '../datasources/home_remote_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  new({required this._remoteDataSource});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await _remoteDataSource.getCategories();
      return Right(categories);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
    String slug, {
    required int limit,
    required int offset,
  }) async {
    try {
      final products = await _remoteDataSource.getProductsByCategory(
        slug,
        limit: limit,
        offset: offset,
      );
      return Right(products);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
