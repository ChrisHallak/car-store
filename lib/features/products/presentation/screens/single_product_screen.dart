import 'package:car_store/core/styles/colors.dart';
import 'package:car_store/dep_injection.dart';
import 'package:car_store/features/products/damain/models/product_model.dart';
import 'package:car_store/features/products/presentation/blocs/products_bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/strings.dart';

class DetailedProductScreen extends StatefulWidget {
  final int id;
  const DetailedProductScreen({Key? key,required this.id})
      : super(key: key);

  @override
  State<DetailedProductScreen> createState() => _DetailedProductScreenState();
}

class _DetailedProductScreenState extends State<DetailedProductScreen> {

  ProductsBloc productsBloc = locator<ProductsBloc>();


  @override
  void initState() {
    productsBloc.add(GetDetailedProductEvent(widget.id  ));

  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc,ProductsState>(
      listener :(context,state){},
        bloc : productsBloc,
      builder:(context,state)  {
        if(state.getDetailedProductStatus == GetDataStatus.sucess)print(state.product?.id?? 'NULLNULLNULLNULL');
        print('TRACING DETAILED ${state.getDetailedProductStatus}');
        //DetailedProduct? product = state.product;
        return state.getDetailedProductStatus == GetDataStatus.sucess?
          Scaffold(
          appBar: AppBar(
            backgroundColor: PRIMARY_COLOR,
            centerTitle: true ,
            title: const Center(child: Text('Product Details')),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display product image
                Center(
                  child: FadeInImage.assetNetwork(
                    placeholder: ImagesKeys.placeHolder,
                    //    placeholderFit: BoxFit.contain,
                    placeholderFilterQuality: FilterQuality.high,

                    image: state.product?.image??ImagesKeys.tempcar,
                    fit: BoxFit.fill,
                    //   height: 260.sp,
                    width: 190.sp,
                  ),
                ),
                const SizedBox(height: 20),
                // Display product title
                Text(
                  state.product?.title ?? 'Title not available',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                // Display product description
                Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Text(
                    state.product?.description ?? 'Description not available',
                    style:   Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                      color: PRIMARY_COLOR,
                      fontWeight: FontWeight.w500,)
                  ),
                ),
                const SizedBox(height: 20),
                // Display product comments count

                // Display product rating
                Row(
                  children: [
                    Text(
                      'Rating: ${state.product?.rate?.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16,color: Colors.red),
                    ),
                    SizedBox(width: 10.w,),
                    Icon(
                      Icons.star_border_outlined,
                      color: Colors.red,
                      size: 17.sp,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Display comments
                if (state.product?.comments != null && state.product!.comments!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                           Text(
                            'Comments',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' ${state.product?.comments?.length ?? 0} :',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      for (var comment in state.product!.comments!)
                        Container(
                          color: state.product!.comments!.indexOf(comment)%2 ==0?PRIMARY500_COLOR.withOpacity(0.1):Colors.transparent,
                          child: ListTile(
                            title: Text(comment.content ?? 'No content'),
                            subtitle: Text(comment.user?.name ?? 'Anonymous'),
                          ),
                        ),
                    ],
                  ),
                const SizedBox(height: 20),
                // Display created and updated dates
                Text(
                  'Created At: ${state.product!.createdAt ?? 'N/A'}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  'Updated At: ${state.product!.updatedAt ?? 'N/A'}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ):const Center(child: CircularProgressIndicator());},
    );
  }
}
