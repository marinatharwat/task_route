import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/feature/home/data/models/product_response.dart';
import 'package:flutter_task/feature/home/data/repository/product_repository.dart';
import 'package:flutter_task/feature/home/presentation/cubits/product_state.dart';


class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepository) : super(ProductInitial());
  final ProductRepository productRepository;


  List<ProductResponse> products =[] ;

  void getAllProduct() async {
    emit(GetAllProductLoadingState());

    final res = await productRepository.getProducts();
    res.fold(
          (l) => emit(GetAllProductErrorState()),
          (r) {
            products = r.products ;
        emit(GetAllProductSuccessState());
      },
    );
  }

}

