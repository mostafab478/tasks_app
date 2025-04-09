import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/presentation/shared/styles/app_colors.dart';

class MainText extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final double? fontSize;
  final double? textHeight;
  final Color? fontColor;
  final String? fontFamily;
  final TextDirection? textDirection;
  final double? horPadding;
  final double? verPadding;
  final TextDecoration? decoration;
  final int? maxLines;
  final FontWeight? fontWeight;
  final double? letterSpacing;

  const MainText({
    super.key,
    required this.text,
    this.textAlign,
    this.fontSize,
    this.fontColor,
    this.fontFamily,
    this.textDirection,
    this.textHeight,
    this.horPadding,
    this.verPadding,
    this.decoration,
    this.maxLines,
    this.fontWeight,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horPadding ?? 0, vertical: verPadding ?? 0),
      child: Text(
        text ?? "",
        textAlign: textAlign,
        textDirection: textDirection,
        maxLines: maxLines,
        style: TextStyle(
          letterSpacing: letterSpacing ?? 1,
          height: textHeight,
          fontSize: fontSize ?? 18.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: fontColor ?? kTextColor,
          fontFamily: "Roboto-medium",
          decoration: decoration,
        ),
      ),
    );
  }
}
