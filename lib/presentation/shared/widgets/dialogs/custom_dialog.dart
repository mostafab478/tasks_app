import 'package:flutter/material.dart';
import '../../../../../core/helpers/navigator_push.dart';
import '../../styles/app_colors.dart';


Future<void> customDialog({Widget? theDialog,bool? dismiss}){
  return showDialog(
      barrierDismissible: dismiss ?? false,
      context: MagicRouter.currentContext,
      barrierColor: kPrimaryColor.withOpacity(0.9),
      builder: (_) => theDialog!);
}