import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/constants.dart';
import '../styles/app_colors.dart';
import 'main_text.dart';

class CommonTextField extends StatefulWidget {
  final bool isEdit, isReadOnly, isVisibleText;
  final String? label,
      fontFamily,
      suffixImage,
      prefixImage,
      hint,
      suffix,
      headLabel;
  final Widget? prefixWidget;
  final Size? size;
  final TextAlign? textAlign;
  final bool? isFilled;
  final bool? isPassword;
  final bool autoFocus;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final FocusNode? focus;
  final TextInputType? type;
  final TextInputAction keyboardAction;
  final VoidCallback? onTap, onChangeVisibility;
  final void Function(String)? onChanged;
  final AutovalidateMode autoValidateMode;
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  final double verticalPadding, horizontalPadding;
  final int? maxLines;
  final int? minLines;
  final double? borderWidth, borderRadius;
  final List<TextInputFormatter>? inputFormatters;
  final Color? color, hintColor;

  const CommonTextField({
    super.key,
    required this.hint,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.prefixImage,
    this.type,
    this.controller,
    this.focus,
    this.isEdit = false,
    this.isReadOnly = false,
    this.isVisibleText = true,
    this.keyboardAction = TextInputAction.next,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.suffixImage,
    this.validation,
    this.label,
    this.fontFamily,
    this.onChangeVisibility,
    this.size,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
    this.maxLines = 1,
    this.minLines,
    this.color,
    this.inputFormatters,
    this.isFilled,
    this.borderWidth,
    this.autoFocus = false,
    this.suffix,
    this.textAlign,
    this.isPassword,
    this.hintColor,
    this.headLabel,
    this.suffixIcon,
    this.prefixWidget,
    this.borderRadius,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  InputBorder _borders() => OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(widget.borderRadius ?? 10.r)),
      borderSide: BorderSide(
          style: BorderStyle.solid,
          color: kPrimaryColor.withOpacity(0.45),
          width: 1));

  InputBorder _enabledBorders() => OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(widget.borderRadius ?? 10.r)),
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: kPrimaryColor.withOpacity(0.45),
      ));

  bool _isHidden = true;

  void _visibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding,
          vertical: widget.verticalPadding),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.headLabel != null)
              MainText(
                text: widget.headLabel,
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
              ),
            if (widget.headLabel != null)
              SizedBox(
                height: 10.h,
              ),
            TextFormField(
              textAlign: widget.textAlign ?? TextAlign.start,
              validator: widget.validation,
              autovalidateMode: widget.autoValidateMode,
              controller: widget.controller,
              autofocus: widget.autoFocus,
              focusNode: widget.focus,
              readOnly: widget.onTap != null ? true : widget.isReadOnly,
              enabled: widget.onTap != null ? false : !widget.isReadOnly,
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              obscureText: widget.isPassword == true ? _isHidden : false,
              keyboardType: widget.type,
              textInputAction: widget.keyboardAction,
              onChanged: widget.onChanged,

              // (v) {
              // setState(() {});
              // widget.controller!.text = v;
              // },
              inputFormatters: widget.inputFormatters,
              style: TextStyle(
                fontSize: 14.sp,
                color: kBlack,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                fillColor: widget.color ?? kWhite,
                errorStyle: TextStyle(fontFamily: "Roboto-medium", color: kRed),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
                hintText: widget.hint,
                alignLabelWithHint: true,
                prefixIcon: widget.prefixImage != null
                    ? Padding(
                        padding: EdgeInsets.only(right: 8.w, left: 16.w),
                        // right: isEn ? 8.w : 16.w, left: isEn ? 16.w : 8.w),
                        child: SvgPicture.asset(
                          getSvg(widget.prefixImage!),
                          height: 24.h,
                          width: 24.h,
                        ),
                      )
                    : widget.prefixWidget ?? widget.prefixWidget,
                labelText: widget.label,
                icon: widget.prefixIcon != null
                    ? Icon(widget.isEdit ? Icons.edit : widget.prefixIcon)
                    : null,
                labelStyle: TextStyle(
                    fontSize: 14.sp,
                    color: kGreyText,
                    fontFamily: "Roboto-medium",
                    fontWeight: FontWeight.w400),
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: widget.hintColor ?? kHintTextColor,
                  fontFamily: "Roboto-medium",
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: widget.suffix != null
                    ? MainText(
                        text: widget.suffix,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontColor: kPrimaryColor,
                        verPadding: 17.h,
                      )
                    : widget.suffixIcon != null
                        ? Icon(
                            widget.suffixIcon,
                            size: 25.sp,
                          )
                        : widget.suffixImage != null
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Image.asset(
                                  getAsset(widget.suffixImage!),
                                  height: 18.h,
                                  width: 18.w,
                                  color: widget.controller!.text.isEmpty
                                      ? kGreyText
                                      : kWhite,
                                ),
                              )
                            : widget.isPassword == true
                                ? IconButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24.w),
                                    onPressed: _visibility,
                                    alignment: Alignment.center,
                                    icon: _isHidden
                                        ? Image.asset(
                                            getAsset("eye_slash"),
                                            height: 15.h,
                                            width: 15.w,
                                            color: kGreyText,
                                          )
                                        : Image.asset(
                                            getAsset("eye"),
                                            height: 15.h,
                                            width: 15.w,
                                            color: kGreyText,
                                          ),
                                  )
                                : null,
                filled: widget.isFilled ?? true,
                // fillColor: color,
                enabledBorder: _enabledBorders().copyWith(
                    borderSide: BorderSide(
                        color: kGreyBorder,
                        width: widget.controller!.text.isNotEmpty ? 1.5 : 1,
                        style: widget.borderWidth == 0
                            ? BorderStyle.none
                            : BorderStyle.solid)),
                disabledBorder: _borders().copyWith(
                    borderSide: BorderSide(
                  width: widget.borderWidth ?? 1,
                  color: kGreyBorder,
                )),
                focusedBorder: _borders(),
                errorBorder: _borders().copyWith(
                    borderSide: BorderSide(
                        width: widget.borderWidth ?? 1, color: kRed)),
                border: _borders().copyWith(
                    borderSide: BorderSide(width: widget.borderWidth ?? 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
