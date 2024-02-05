import 'package:car_store/features/products/damain/models/order_model.dart';
import 'package:car_store/features/products/damain/models/product_model.dart';

import '../../../../core/base_repository.dart';
import '../../../../core/result.dart';
import '../../data/requests.dart';

abstract class ProductsRepository extends Repository {
  Future<Result<BaseError, ProductModel>> getProducts();
  Future<Result<BaseError, OrderModel>> getOrders();
  Future<Result<BaseError, DetailedProduct>> getDetailedProduct(GetDetailedProductRequest getDetailedProductRequest);
}
