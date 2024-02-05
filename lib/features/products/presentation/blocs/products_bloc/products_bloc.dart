import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_store/core/params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../damain/models/order_model.dart';
import '../../../damain/models/product_model.dart';
import '../../../damain/usecases/usecases.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {

  final GetProductsUseCase getProductsUseCase;
  final GetDetailedProductUseCase getDetailedProductUseCase;
  final GetOrdersUseCase getOrdersUseCase;
  ProductsBloc({required this.getProductsUseCase,required this.getDetailedProductUseCase,required this.getOrdersUseCase}) : super(ProductsState()) {
    on<GetProductsEvent>(_onGetProductsEvent);
    on<GetDetailedProductEvent>(_onGetDetailedProductEvent);
    on<GetOrdersEvent>(_onGetOrdersEvent);
  }
}


extension ProductsBlocMapper on ProductsBloc{
  void _onGetProductsEvent(GetProductsEvent event,Emitter<ProductsState> emit) async {
    emit(state.copyWith(getDataStatus: GetDataStatus.loading));
    final result = await getProductsUseCase(NoParams());
    if(result.hasDataOnly){
      emit(state.copyWith(productModel: result.data,getDataStatus: GetDataStatus.sucess));
    }else{
      emit(state.copyWith(getDataStatus: GetDataStatus.error,msg: result.error.toString()));

    }
  }
  void _onGetDetailedProductEvent(GetDetailedProductEvent event,Emitter<ProductsState> emit) async {
    emit(state.copyWith(getDetailedProductStatus: GetDataStatus.loading));
    final result = await getDetailedProductUseCase(IntParams(event.id));
    print('TRACING DETAILED after loading ${result.data}   ${result.error}');

    if(result.hasDataOnly){
      emit(state.copyWith(product: result.data,getDetailedProductStatus: GetDataStatus.sucess));
      print('TRACING DETAILED PRODUCTS SUCCESS ${result.data!.toJson() }');
    }else{
      print('TRACING DETAILED PRODUCTS ERROR ${result.error.toString()}');
      emit(state.copyWith(getDetailedProductStatus: GetDataStatus.error,detailedMsg: result.error.toString()));

    }
  }
  void _onGetOrdersEvent(GetOrdersEvent event,Emitter<ProductsState> emit) async {
    emit(state.copyWith(getOrdersStatus: GetDataStatus.loading));
    final result = await getOrdersUseCase(NoParams());
    print('TRACING ORDERS after api ${result.data!.toJson()}');

    if(result.hasDataOnly){
      print('TRACING ORDERS SUCESS ${result.data!.toJson()}');
      emit(state.copyWith(orderModel: result.data,getOrdersStatus: GetDataStatus.sucess));
    }else{
      emit(state.copyWith(getOrdersStatus: GetDataStatus.error,msg: result.error.toString()));

    }
  }

}