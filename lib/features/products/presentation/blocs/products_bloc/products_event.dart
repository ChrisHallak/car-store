part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}


class GetProductsEvent extends ProductsEvent{}
class GetOrdersEvent extends ProductsEvent{}

class GetDetailedProductEvent extends ProductsEvent{
  final int id;

  GetDetailedProductEvent(this.id);
}