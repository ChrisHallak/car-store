import 'dart:ffi';

import 'package:car_store/core/params.dart';
import 'package:car_store/features/products/damain/models/order_model.dart';
import 'package:car_store/features/products/damain/models/product_model.dart';
import 'package:car_store/features/products/data/requests.dart';
import '../../../../core/base_use_case.dart';
import '../../../../core/result.dart';
import '../repos/repository.dart';

class GetProductsUseCase
    extends UseCase<Future<Result<BaseError, ProductModel>>, NoParams> {
  final ProductsRepository productsRepository;
  GetProductsUseCase(this.productsRepository);

  @override
  Future<Result<BaseError, ProductModel>> call(NoParams params) async {
    return productsRepository.getProducts();
  }
}



class GetDetailedProductUseCase
    extends UseCase<Future<Result<BaseError, DetailedProduct>>, IntParams > {
  final ProductsRepository productsRepository;
  GetDetailedProductUseCase(this.productsRepository);

  @override
  Future<Result<BaseError, DetailedProduct>> call(IntParams params) async {
    return productsRepository.getDetailedProduct(GetDetailedProductRequest(id:params.id));
  }
}


class GetOrdersUseCase
    extends UseCase<Future<Result<BaseError, OrderModel>>, NoParams> {
  final ProductsRepository productsRepository;
  GetOrdersUseCase(this.productsRepository);

  @override
  Future<Result<BaseError, OrderModel>> call(NoParams params) async {
    return productsRepository.getOrders();
  }
}

