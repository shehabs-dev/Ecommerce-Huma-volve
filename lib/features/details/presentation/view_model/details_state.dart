part of "details_cubit.dart";

sealed class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsSuccess extends DetailsState {
  final ProductEntity product;

  new({required this.product});
}

class DetailsFailure extends DetailsState {
  final Failure failure;

  new({required this.failure});
}
