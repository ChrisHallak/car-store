import 'package:car_store/features/products/damain/models/order_model.dart';
import 'package:car_store/features/products/damain/repos/repository.dart';

import '../../../../core/result.dart';
import '../../data/datasources.dart';
import '../../data/requests.dart';
import '../models/product_model.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsDataSource productsDataSource;

  ProductsRepositoryImpl(this.productsDataSource);

  @override
  Future<Result<BaseError, ProductModel>> getProducts() async {
    final result = await productsDataSource.getProducts();
    return executeWithoutConvert(remoteResult: result);
  }

  @override
  Future<Result<BaseError, DetailedProduct>> getDetailedProduct(GetDetailedProductRequest getDetailedProductRequest) async {
    final result = await productsDataSource.getDetailedProduct(getDetailedProductRequest);
    return executeWithoutConvert(remoteResult: result);
  }

  @override
  Future<Result<BaseError, OrderModel>> getOrders() async {
    final result = await productsDataSource.getOrders();
    return executeWithoutConvert(remoteResult: result);
  }

}