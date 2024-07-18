
sealed class ProductState {}

final class ProductInitial extends ProductState{}


final class GetAllProductLoadingState extends ProductState{}
final class GetAllProductSuccessState extends ProductState{}
final class GetAllProductErrorState extends ProductState{}
