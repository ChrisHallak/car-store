import 'package:car_store/core/strings.dart';
import 'package:car_store/features/products/damain/models/order_model.dart';
import 'package:car_store/features/products/presentation/widgets/portrait_product.dart';
import 'package:car_store/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key,this.width,this.height,required this.products,this.scrollDirection,this.isPortrait,this.addToBagTap});
  final double? width;
  final double? height;
  final OrderModel? products;
  final Axis? scrollDirection;
  final bool? isPortrait;
  final Function(int index)? addToBagTap;

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: widget.scrollDirection??Axis.vertical,
        itemCount: widget.products?.data?.length??0,
        itemBuilder: (context, index) {

          return widget.isPortrait == null || widget.isPortrait == false ?  ProductItem(
            image:
            '${widget.products!.data![index].product!.image}',
            id: widget.products!.data![index].id.toString(),
            name:
            widget.products!.data![index].product!.title.toString(), price: '',


          ):
          PortraitProductItem(
            image: widget?.products?.data?[index]?.product?.image??ImagesKeys.placeHolder,
            id: widget.products!.data![index].id.toString(),
            name: widget.products?.data?[index]?.product?.title.toString()??'',

          );

        },
        separatorBuilder: (BuildContext context, int index) {
          return
            widget.scrollDirection == Axis.horizontal? ScreenUtil().setHorizontalSpacing(15.sp) :ScreenUtil().setVerticalSpacing(15.sp);
        },
      ),
    );
  }
}
