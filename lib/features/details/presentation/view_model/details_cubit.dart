import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/shared/domain/entities/product_entity.dart';
import '../../domain/usecases/get_product_by_id_usecase.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final GetProductByIdUsecase getProductByIdUsecase;
  DetailsCubit({required this.getProductByIdUsecase}) : super(DetailsInitial());

  Future<void> getProductById(int productId) async {
    final result = await getProductByIdUsecase.invoke(productId);

    result.fold(
      (failure) => emit(DetailsFailure(failure: failure)),
      (product) => emit(DetailsSuccess(product: product)),
    );
  }
}
