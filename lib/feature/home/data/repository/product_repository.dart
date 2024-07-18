import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/database/api/api_consumer.dart';
import 'package:flutter_task/core/database/api/end_points.dart';
import 'package:flutter_task/core/error/exceptions.dart';
import 'package:flutter_task/core/service/service_locator.dart';
import 'package:flutter_task/feature/home/data/models/product_response.dart';


class ProductRepository {
  Future<Either<String, GetAllProductsModel>> getProducts() async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.products,
      );
      return Right(GetAllProductsModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left('Failed to fetch products: $e');
    }
  }
}
