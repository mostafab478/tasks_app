import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';
import 'main_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? hor;
  final double? ver;
  final double? font;
  final double? radius;
  final Widget? child;
  final LinearGradient? gradient;
  final LinearGradient? borderGradient;

  CustomButton(
      {this.onPressed,
      this.title,
      this.color,
      this.width,
      this.hor,
      this.height,
      this.font,
      this.textColor,
      this.gradient,
      this.borderGradient,
      this.child,
      this.ver,
      this.radius,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: borderGradient,
            borderRadius: BorderRadius.circular(radius ?? 15.r)),
        child: Container(
          height: height ?? 55.h,
          width: width,
          margin:
              EdgeInsets.symmetric(horizontal: hor ?? 0, vertical: ver ?? 0),
          decoration: BoxDecoration(
              gradient: gradient,
              color: color ?? kPrimaryColor,
              border: Border.all(
                  color: borderColor ?? Colors.transparent,
                  width: borderColor != null ? 1 : 0),
              borderRadius: BorderRadius.circular(radius ?? 30.r)),
          child: Center(
              child: child ??
                  MainText(
                    text: title,
                    fontColor: textColor ?? kWhite,
                    fontSize: font ?? 17.sp,
                    fontWeight: FontWeight.w500,
                  )),
        ),
      ),
    );
  }
}
