import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import 'custom_wave.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyWave(),
      child: SizedBox(
        height: 250.h,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 10.h,
              right: 0.w,
              child: Image.asset('assets/images/car_logo.png',color: Colors.white,width: 180.w,height: 180.h,),
            ),
             Positioned(
                top: 145.h,
                left: 30.w,
                child:  Text(
                  'Last update 03/02/2024',
                  style: TextStyle(color: GREY_COLOR, fontSize: 13.sp),
                )),
          ],
        ),
      ),
    );
  }
}
