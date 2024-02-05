import 'package:car_store/features/products/presentation/screens/home_screen.dart';
import 'package:car_store/features/products/presentation/screens/orders_screen.dart';
import 'package:car_store/features/products/presentation/screens/settings_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/colors.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

List<Widget> pages = [const HomeScreen(),const OrderScreen(),const SettingsScreen()];

class _RootScreenState extends State<RootScreen> {
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: GREY_COLOR,
      body: pages[curIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: curIndex,
        onTap: (value) {
          setState(() {
            curIndex = value;
          });
        },
        height: 60,
        backgroundColor: Colors.transparent,
        color: PRIMARY_COLOR,
        animationDuration: const Duration(milliseconds: 300), // Corrected duration
        items: [
          SvgPicture.asset(

            'assets/images/store2.svg',
            width: 30,
            height: 30,
            color: Colors.white,
          ),

          SvgPicture.asset(
            'assets/images/gold.svg',
            width: 30,
            height: 30,
          ),
          SvgPicture.asset(
            'assets/images/settings.svg',
            width: 30,
            height: 30,
          ),
        ],
      ),

    );
  }
}
