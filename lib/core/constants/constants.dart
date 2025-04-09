import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:task/presentation/shared/widgets/main_text.dart';

String getAsset(String imageName) => 'assets/images/$imageName.png';

String getSvg(String svgName) => 'assets/svg/$svgName.svg';

String getLottie(String lottieName) => 'assets/lottie/$lottieName.json';

String launchMap(String? lat, String? lng) => "https://maps.google.com/maps?q=$lat%2C$lng&z=17&hl=ar";


Widget emptyShow({double? ver,String? title}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: ver ?? 0),
    child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(getLottie('empty'), width: 150.w, height: 150.h),
            if(title != null) MainText(text: title,fontSize: 18.sp)
          ],
        )),
  );
}
