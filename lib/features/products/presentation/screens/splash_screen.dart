import 'dart:async';

import 'package:car_store/features/products/presentation/screens/root.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 6);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const RootScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:  const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [PRIMARY_COLOR, SECONDARY_COLOR])),
        child: Scaffold(
          backgroundColor: PRIMARY_COLOR,
          body: Center(
            child: Image.asset('assets/images/car_logo.png',color: Colors.white,),
          ),
        ));
  }
}
