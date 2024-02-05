import 'package:car_store/dep_injection.dart';
import 'package:car_store/features/products/presentation/blocs/products_bloc/products_bloc.dart';
import 'package:car_store/features/products/presentation/widgets/custom_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/utils.dart';
import '../widgets/products_grid.dart';
import '../widgets/products_list.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {



  ProductsBloc productsBloc = locator<ProductsBloc>();


  @override
  void initState() {
    // TODO: implement initState
    productsBloc.add(GetOrdersEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductsState>(
        bloc: productsBloc,
        listener: (context, state) {},
        builder: (context, state) =>
        state.getOrdersStatus == GetDataStatus.sucess?
        Scaffold(
          appBar:AppBar(
          backgroundColor: PRIMARY_COLOR,
          centerTitle: true ,
          title: const Center(child: Text('Orders')),
        ),
          body: Container(
            padding: EdgeInsets.all(15.w),
            height: 1000.h,
            child: ProductsGridCustom(orders: state.orderModel,),
          ),

        ):
        const Center(child: CircularProgressIndicator(color: PRIMARY_COLOR,))

    );
  }
}
