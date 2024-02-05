import 'package:car_store/features/products/damain/models/order_model.dart';
import 'package:car_store/features/products/data/requests.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base_datasource.dart';
import '../../../core/result.dart';
import '../damain/models/product_model.dart';

abstract class ProductsDataSource extends RemoteDataSource {
  Future<Either<BaseError, ProductModel>> getProducts();
  Future<Either<BaseError, OrderModel>> getOrders();
  Future<Either<BaseError, DetailedProduct>> getDetailedProduct(GetDetailedProductRequest getDetailedProductRequest);



}
