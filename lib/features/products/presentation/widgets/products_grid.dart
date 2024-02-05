import 'package:car_store/features/products/presentation/screens/single_product_screen.dart';
import 'package:car_store/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../damain/models/product_model.dart';


class ProductsGrid extends StatefulWidget {
  const ProductsGrid({super.key,required this.products,
  //  this.physics
  });
  final ProductModel? products;
  //final ScrollPhysics? physics;

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //physics: widget.physics,
      itemCount: widget.products!.singleProductModel!.length,
      shrinkWrap: true,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.64,
        crossAxisSpacing: 26.sp,
        mainAxisSpacing: 15.sp,
      ),
      itemBuilder: (context, index) {

        return ProductItem(
          image:
          '${widget.products!.singleProductModel![index].image}',
          id: widget.products!.singleProductModel![index].id.toString(),
          name: widget.products!.singleProductModel![index]
              .title
              .toString(),
          price: widget.products!.singleProductModel![index]
              .rate
              .toString(),
          comment: widget.products!.singleProductModel![index].comments,
          onPress: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>  DetailedProductScreen(id:widget.products!.singleProductModel![index].id!),
            ));
          },

          onTap: () {
          },
        );
      },
    );
  }
}
