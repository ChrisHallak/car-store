import 'package:car_store/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/strings.dart';
import '../../../../core/utils.dart';

class PortraitProductItem extends StatefulWidget {
  const PortraitProductItem({
    super.key,
    required this.image,
    required this.id,
    required this.name,

  });

  final String image;
  final String name;

  final String id;


  @override
  State<PortraitProductItem> createState() => _PortraitProductItemState();
}

class _PortraitProductItemState extends State<PortraitProductItem> {
  bool isFavoriteState = false;
  bool isVisible = false;

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            boxShadow: [
              BoxShadow(
                  color: GREY_COLOR.withOpacity(0.3),
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: const Offset(2, 2))
            ]),
        // border: Border.all(
        //     color:
        //         locator<AppThemeColors>().primaryColor.withOpacity(0.3))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.sp),
                  child: FadeInImage.assetNetwork(
                    placeholder: ImagesKeys.placeHolder,
                    //    placeholderFit: BoxFit.contain,
                    placeholderFilterQuality: FilterQuality.high,

                    image:
                    widget.image,
                    fit: BoxFit.fill,
                    height: ScreensHelper.of(context).fromHeight(55),
                    width: ScreensHelper.of(context).fromWidth(93),
                  ),
                ),
                PositionedDirectional(
                  top: 12.sp,
                  end: 18.sp,
                  child: Stack(
                    children: [
                      //   if(!isFavoriteState)
                      Visibility(
                        visible: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: AnimatedOpacity(
                              opacity: 1,
                              duration: const Duration(milliseconds: 500),
                              child: InkWell(
                                child: Icon(
                                  Icons.favorite_border_outlined,
                                  color: PRIMARY_COLOR,
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // if(isFavoriteState)
                      Visibility(
                        visible: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Container(
                          height: 35.sp,
                          width: 35.sp,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: AnimatedOpacity(
                              opacity: 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn,
                              child: InkWell(
                                  child: Icon(
                                    Icons.favorite_rounded,
                                    color: PRIMARY_COLOR,
                                    size: 30.sp,
                                  )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            ScreenUtil().setVerticalSpacing(2),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScreenUtil().setVerticalSpacing(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // NAME OF THE PRODUCT
                      Text(
                        widget.name,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      //if (!widget.isFavorite)


                      // if (widget.isFavorite)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Spacer(),
                      //if (!widget.isFavorite)


                      // if (widget.isFavorite)
                    ],
                  ),

                  ScreenUtil().setVerticalSpacing(12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

