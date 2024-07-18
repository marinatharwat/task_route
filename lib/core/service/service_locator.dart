import 'package:dio/dio.dart';
import 'package:flutter_task/core/database/api/api_consumer.dart';
import 'package:flutter_task/core/database/api/dio_consumer.dart';
import 'package:flutter_task/core/database/cache/cache_helper.dart';
import 'package:flutter_task/feature/home/data/repository/product_repository.dart';
import 'package:flutter_task/feature/home/presentation/cubits/product_cubit.dart';
import 'package:get_it/get_it.dart';



final sl = GetIt.instance;


void initServiceLocator(){
   sl.registerLazySingleton(()=>ProductCubit(sl()));
   sl.registerLazySingleton(() => ProductRepository());
  sl.registerLazySingleton(()=>CacheHelper());

  sl.registerLazySingleton<ApiConsumer>(()=>DioConsumer(sl()));
  sl.registerLazySingleton(()=>Dio());


}