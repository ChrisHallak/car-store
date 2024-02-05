import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/strings.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils.dart';

class ProductItemCustom extends StatefulWidget {
  const ProductItemCustom({
    super.key,
    required this.image,
    required this.id,
    required this.name,
    this.onPress,
    this.onTap,
    required this.status,
    this.priceAfterDiscount,
    this.isLoading = false,
    this.addToBagTap,
    this.comment,
  });

  final String image;
  final String name;
  final String status;
  final String id;
  final int? comment;
  final VoidCallback? onPress;
  final VoidCallback? onTap;
  final VoidCallback? addToBagTap;
  final bool isLoading;
  final String? priceAfterDiscount;

  @override
  State<ProductItemCustom> createState() => _ProductItemCustomState();
}

class _ProductItemCustomState extends State<ProductItemCustom> {


  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('widget.priceAfterDiscount: ${widget.priceAfterDiscount}');
    return InkWell(
      onTap: widget.onPress,
      borderRadius: BorderRadius.circular(8.sp),
      child: SizedBox(
        width: 175.sp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 22,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    boxShadow: [
                      BoxShadow(
                          color: GREY_COLOR
                              .withOpacity(0.3),
                          blurRadius: 3,
                          spreadRadius: 1,
                          offset: const Offset(2, 2))
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.sp),
                  child: FadeInImage.assetNetwork(
                    placeholder: ImagesKeys.placeHolder,
                    //    placeholderFit: BoxFit.contain,
                    placeholderFilterQuality: FilterQuality.high,

                    image: widget.image,
                    fit: BoxFit.cover,
                    //   height: 260.sp,
                    width: 190.sp,
                  ),
                ),
              ),
            ),
            //   ScreenUtil().setVerticalSpacing(2),
            ScreenUtil().setVerticalSpacing(6),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp),
                                  ),
                                ),
                                //ScreenUtil().setHorizontalSpacing(20.w),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      widget.status,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                        color: PRIMARY_COLOR,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    ScreenUtil().setHorizontalSpacing(10.w),
                                    const Visibility(
                                      visible: true ,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      child: AnimatedOpacity(
                                        opacity: 1,
                                        duration:
                                        Duration(milliseconds: 500),

                                      ),
                                    )
                                  ],)
                              ],
                            ),
                          ),
                          //   ScreenUtil().setVerticalSpacing(2),
                          //    Expanded(child: Container()),
                          Expanded(
                            flex: 2,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start  ,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Visibility(
                                  visible: true ,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  child: AnimatedOpacity(
                                    opacity: 1,
                                    duration:
                                    Duration(milliseconds: 500),

                                  ),
                                ),
                                ScreenUtil().setHorizontalSpacing(10.w),

                                Text(
                                  widget.comment?.toString()??'',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: PRIMARY_COLOR,
                                    fontWeight: FontWeight.w500,

                                  ),
                                ),


                              ],
                            ),
                          ),
                          //const Spacer(),
                          // if (widget.price != widget.priceAfterDiscount)

                          // Expanded(child: Container()),
                          // //const Spacer(),
                          // if (widget.price != widget.priceAfterDiscount)
                          //   Expanded(
                          //     child: Text(widget.priceAfterDiscount ?? '',
                          //         style: Theme.of(context)
                          //             .textTheme
                          //             .bodyMedium
                          //             ?.copyWith(
                          //               color: locator<AppThemeColors>()
                          //                   .primaryColor,
                          //             )),
                          //   ),
                          // Expanded(child: Container()),
                        ],
                      ),
                    ),
                    // (widget.isLoading)
                    //     ? Expanded(
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.end,
                    //     children: [
                    //       Container(
                    //           width: 29.sp,
                    //           height: 29.sp,
                    //           decoration: BoxDecoration(
                    //               borderRadius:
                    //               BorderRadius.circular(100),
                    //               color: GREY_COLOR
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(4.0),
                    //             child: CircularProgressIndicator(
                    //               strokeWidth: 2,
                    //             ),
                    //           )),
                    //     ],
                    //   ),
                    // )
                    //     : Expanded(
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.end,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       // Container(
                    //       //   padding: EdgeInsets.all(4.sp),
                    //       //   decoration: BoxDecoration(
                    //       //       borderRadius: BorderRadius.circular(100),
                    //       //       color:
                    //       //       GREY_COLOR),
                    //       //   child: Visibility(
                    //       //     visible: true ,
                    //       //     maintainAnimation: true,
                    //       //     maintainState: true,
                    //       //     child: AnimatedOpacity(
                    //       //       opacity: 1,
                    //       //       duration:
                    //       //       const Duration(milliseconds: 500),
                    //       //       child: Icon(
                    //       //         Icons.favorite_border_outlined,
                    //       //         color: Colors.red,
                    //       //         size: 19.sp,
                    //       //       ),
                    //       //     ),
                    //       //   ),
                    //       // ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            if (widget.addToBagTap != null)
              InkWell(
                onTap: widget.addToBagTap,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.sp),
                  width: ScreensHelper.of(context).fromWidth(46),
                  height: 35.sp,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: PRIMARY_COLOR,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                        'Add to bag',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: PRIMARY_COLOR,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
