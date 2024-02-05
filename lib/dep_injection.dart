import 'package:car_store/features/products/damain/repos/repository.dart';
import 'package:car_store/features/products/damain/repos/repositoryImpl.dart';
import 'package:car_store/features/products/data/datasources.dart';
import 'package:car_store/features/products/data/datasourcesImpl.dart';
import 'package:car_store/features/products/presentation/blocs/products_bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';
import 'features/products/damain/usecases/usecases.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory<ProductsDataSource>(() => ProductsDataSourceImpl());
  locator.registerFactory<ProductsRepository>(
          () => ProductsRepositoryImpl(locator<ProductsDataSource>()));
  locator.registerFactory(
          () => GetProductsUseCase(locator<ProductsRepository>()));
  locator.registerFactory(
          () => GetDetailedProductUseCase(locator<ProductsRepository>()));
  locator.registerFactory(
          () => GetOrdersUseCase(locator<ProductsRepository>()));

  locator.registerFactory(() => ProductsBloc(getProductsUseCase: locator<GetProductsUseCase>(),getDetailedProductUseCase: locator<GetDetailedProductUseCase>(),getOrdersUseCase: locator<GetOrdersUseCase>()));
}
