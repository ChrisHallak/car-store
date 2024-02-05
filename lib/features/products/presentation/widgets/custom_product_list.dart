import 'package:car_store/features/products/damain/models/order_model.dart';
import 'package:car_store/features/products/presentation/widgets/custom_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsGridCustom extends StatefulWidget {
  const ProductsGridCustom({super.key,required this.orders,
    //  this.physics
  });
  final OrderModel? orders;
  //final ScrollPhysics? physics;

  @override
  State<ProductsGridCustom> createState() => _ProductsGridCustomState();
}

class _ProductsGridCustomState extends State<ProductsGridCustom> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //physics: widget.physics,
      itemCount: widget.orders?.data?.length??0,
      shrinkWrap: true,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.64,
        crossAxisSpacing: 26.sp,
        mainAxisSpacing: 15.sp,
      ),
      itemBuilder: (context, index) {

        return ProductItemCustom(
          image:
          '${widget.orders!.data![index].product!.image}',
          id: widget.orders!.data![index].id.toString(),
          name: widget.orders!.data![index].product!.title??'',
          status: widget.orders?.data![index].status??'',

        );
      },
    );
  }
}
