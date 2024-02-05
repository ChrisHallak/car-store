import 'package:car_store/features/products/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dep_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const AnnotatedRegion(
            value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            child: MaterialApp(
                debugShowCheckedModeBanner: false, home: SplashScreen()),
          );
        });
  }
}
