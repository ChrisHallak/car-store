part of 'products_bloc.dart';


enum GetDataStatus {init,loading,sucess,error}

@immutable
 class ProductsState extends Equatable{
  ProductModel? productModel;
  GetDataStatus getDataStatus;
  String msg;
  DetailedProduct? product;
  GetDataStatus getDetailedProductStatus;
  String detailedMsg;
  OrderModel? orderModel;
  GetDataStatus getOrdersStatus;
  String OrdersMsg;

  ProductsState({this.productModel,this.getDataStatus = GetDataStatus.init,this.msg = "",this.product,this.getDetailedProductStatus = GetDataStatus.init,this.detailedMsg = '',this.orderModel,this.getOrdersStatus = GetDataStatus.init,this.OrdersMsg = ''});

  ProductsState copyWith({ProductModel? productModel,GetDataStatus?getDataStatus,String?msg,
    DetailedProduct? product,
  GetDataStatus? getDetailedProductStatus,
  String? detailedMsg,
    OrderModel  ? orderModel,
    GetDataStatus? getOrdersStatus,
    String? OrdersMsg,

  }){
    return ProductsState(
      productModel: productModel??this.productModel,
      getDataStatus: getDataStatus??this.getDataStatus,
      msg: msg??this.msg,
      product: product??this.product,
      getDetailedProductStatus: getDetailedProductStatus??this.getDetailedProductStatus,
      detailedMsg: detailedMsg??this.detailedMsg,
      orderModel: orderModel??this.orderModel,
      getOrdersStatus: getOrdersStatus??this.getOrdersStatus,
      OrdersMsg: OrdersMsg??this.OrdersMsg,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productModel,getDataStatus,msg,product,getDetailedProductStatus,  detailedMsg,orderModel,getOrdersStatus,  OrdersMsg];




}

