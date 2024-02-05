import 'package:car_store/core/styles/colors.dart';
import 'package:car_store/features/products/presentation/blocs/products_bloc/products_bloc.dart';
import 'package:car_store/features/products/presentation/widgets/custom_app.dart';
import 'package:car_store/features/products/presentation/widgets/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dep_injection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  ProductsBloc productsBloc = locator<ProductsBloc>();
  @override
  void initState() {
    // TODO: implement initState
    productsBloc.add(GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductsState>(
        bloc: productsBloc,
        listener: (context, state) {},
        builder: (context, state) =>
            state.getDataStatus == GetDataStatus.sucess? Column(children: [
              LogoWidget(),
              Container(
                padding: EdgeInsets.all(15.w),
                height: 550.h,
                child: ProductsGrid(products: state.productModel,),
              ),
            ]
            ):Center(child: CircularProgressIndicator(color: PRIMARY_COLOR,))

    );
  }
}
