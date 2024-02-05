import 'package:car_store/features/products/damain/models/order_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base_datasource.dart';
import '../damain/models/product_model.dart';

class ProductsResponse extends ApiResponse<ProductModel?> {
  ProductsResponse(String msg,
      bool hasError,
      ProductModel? result,) : super(msg, hasError, result);

  factory ProductsResponse.fromJson(json) {
    String message = '';
    bool isSuccess = json['success'] == true;
    ProductModel? result;
    if (isSuccess) {
      print("TRACING GET PRODUCTS RESPONSE SUCCESS");
      result = ProductModel.fromJson(json);
      message = json['message'];
    }

    else {
      print("TRACING GET PRODUCTS RESPONSE ERROR");
      message = json['message'];
    }

    return ProductsResponse(message, !isSuccess, result);
  }

}

class OrdersReponse extends ApiResponse<OrderModel?> {
  OrdersReponse(String msg,
      bool hasError,
      OrderModel? result,) : super(msg, hasError, result);

  factory OrdersReponse.fromJson(json) {
    String message = '';
    bool isSuccess = json['success'] == true;
    OrderModel? result;
    if (isSuccess) {
      result = OrderModel.fromJson(json);
      print('TRACING ORDERS  ${result.data![0].toJson()}');

      message = json['message'];
    }

    else {
      message = json['message'];
    }

    return OrdersReponse(message, !isSuccess, result);
  }

}

class DetailedProductReponse extends ApiResponse<DetailedProduct?> {
  DetailedProductReponse(String msg,
      bool hasError,
      DetailedProduct? result,) : super(msg, hasError, result);

  factory DetailedProductReponse.fromJson(json) {
    String message = '';
    bool isSuccess = json['success'] == true;
    DetailedProduct? result;
    if (isSuccess) {
      result = DetailedProduct.fromJson(json['data']);
      message = json['message'];
    }

    else {
      message = json['message'];
    }

    return DetailedProductReponse(message, !isSuccess, result);
  }

}