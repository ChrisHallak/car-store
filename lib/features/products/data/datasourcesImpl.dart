import 'package:car_store/features/products/damain/models/order_model.dart';
import 'package:car_store/features/products/data/apis.dart';
import 'package:car_store/features/products/data/requests.dart';
import 'package:car_store/features/products/data/responses.dart';
import 'package:dartz/dartz.dart';

import '../../../core/api_params.dart';
import '../../../core/result.dart';
import '../damain/models/product_model.dart';
import 'datasources.dart';

class ProductsDataSourceImpl extends ProductsDataSource {
  @override
  Future<Either<BaseError, ProductModel>> getProducts() {
    return request<ProductModel, ProductsResponse>(
        ApiCallParams<ProductsResponse>(
          token: '2|Krr2meJWbTKIR4iCWTX3JysazBcUY4AoCJOHdH9J',
            responseStr: "ProductsResponse",
            mapper: (json) => ProductsResponse.fromJson(json),
            method: HttpMethod.GET,
            url: ApiUrls.getProducts));
  }

  @override
  Future<Either<BaseError, DetailedProduct>> getDetailedProduct(GetDetailedProductRequest getDetailedProductRequest) {
    return request<DetailedProduct, DetailedProductReponse>(
        ApiCallParams<DetailedProductReponse>(

            token: '2|Krr2meJWbTKIR4iCWTX3JysazBcUY4AoCJOHdH9J',
            responseStr: "DetailedProductReponse",
            mapper: (json) => DetailedProductReponse.fromJson(json),
            method: HttpMethod.GET,
            url: '${ApiUrls.getProducts}/${getDetailedProductRequest.id}'));
  }

  @override
  Future<Either<BaseError, OrderModel>> getOrders() {
    return request<OrderModel, OrdersReponse>(
        ApiCallParams<OrdersReponse>(
            token: '2|Krr2meJWbTKIR4iCWTX3JysazBcUY4AoCJOHdH9J',
            responseStr: "OrdersReponse",
            mapper: (json) => OrdersReponse.fromJson(json),
            method: HttpMethod.GET,
            url: ApiUrls.getOrders));
  }
}
