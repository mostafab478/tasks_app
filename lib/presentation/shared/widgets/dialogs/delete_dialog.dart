import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/helpers/navigator_push.dart';
import '../../styles/app_colors.dart';
import '../custom_button.dart';
import '../main_text.dart';

class DeleteDialog extends StatelessWidget {
  final Function()? onDelete;
  const DeleteDialog({super.key, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * .4,
        width: 400.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(getLottie("error"),
                height: 120.h, width: 120.w, fit: BoxFit.cover),
            MainText(
              text: "Are you sure you want to delete this task",
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              fontSize: 18.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120.w,
                  height: 50.h,
                  child: CustomButton(
                    title: "No",
                    color: kGreyButton,
                    onPressed: () {
                      MagicRouter.pop();
                    },
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 120.w,
                  height: 50.h,
                  child: CustomButton(
                    onPressed: onDelete,
                    title: "Yes",
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
