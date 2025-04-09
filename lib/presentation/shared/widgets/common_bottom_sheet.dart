import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/navigator_push.dart';
import '../styles/app_colors.dart';
import 'main_text.dart';

Future<T?> openCommonBottomSheet<T>(
  BuildContext context, {
  @required Widget? child,
  bool isDismissible = true,
  Widget? cancelWidget,
  bool showCloseButton = false,
  String? title,
  Color? backgroundColor,
  Color? dismissIconColor,
  double? sheetHeight,
  double? verTitlePadding,
  double? horTitlePadding,
}) {
  return showModalBottomSheet(
    context: MagicRouter.currentContext,
    enableDrag: isDismissible,
    isDismissible: isDismissible,
    isScrollControlled: true,
    backgroundColor: backgroundColor ?? kWhite,
    useRootNavigator: true,
    constraints: BoxConstraints.expand(
        width: double.infinity, height: sheetHeight ?? 500.h),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24.0)),
    ),
    builder: (ctx) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: StatefulBuilder(
        builder: (context, setState) => DraggableScrollableSheet(
            initialChildSize: 0.98,
            minChildSize: 0.88,
            builder: (ctx, scrollCtrl) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Top dragging notch.
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: (isDismissible)
                          ? Container(
                              height: 5.h,
                              width: 50.w,
                              decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                            )
                          : SizedBox(
                              height: 1.h,
                            ),
                    ),
                    if (showCloseButton == true)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: horTitlePadding ?? 16.w,
                            vertical: verTitlePadding ?? 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            if (title != null)
                              MainText(
                                  text: title,
                                  fontSize: 16.sp,
                                  maxLines: 2,
                                  fontWeight: FontWeight.bold),
                            GestureDetector(
                              onTap: () {
                                MagicRouter.pop();
                              },
                              child: cancelWidget ??
                                  MainText(
                                    text: 'Cancel',
                                    fontColor: kPrimaryColor,
                                  ),
                              // Icon(
                              // Icons.close,
                              // size: 30.sp,
                              // color: dismissIconColor ?? kGreyText,
                              // )
                            )
                          ],
                        ),
                      ),
                    // Padding(
                    //   padding: EdgeInsets.only(bottom: 16.h,right: 24.w,left: 24.w),
                    //   child: Divider(),
                    // ),
                    if (showCloseButton == false)
                      SizedBox(
                        height: 20.h,
                      ),
                    Expanded(child: child!),
                  ],
                )),
      ),
    ),
  );
}
