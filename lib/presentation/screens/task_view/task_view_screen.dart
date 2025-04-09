import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/domain/task/entities/task.dart';
import 'package:task/presentation/shared/widgets/main_text.dart';

import '../../shared/styles/app_colors.dart';

class TaskViewScreen extends StatelessWidget {
  final Task task;
  final Function()? onDelete;

  const TaskViewScreen({super.key, required this.task, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MainText(text: 'Task To-Do'),
        automaticallyImplyLeading: true,
        actions: [
          GestureDetector(
            onTap: onDelete,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Icon(
                Icons.delete,
                color: kRed,
                size: 25.w,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: kPrimaryColor, width: 2),
                  color: kGreyButton.withOpacity(0.4)),
              padding: EdgeInsets.symmetric(
                  horizontal: 10.w, vertical: 10.h),
              child: Center(
                child: MainText(
                  text: "To-Do",
                  fontColor: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ),
            SizedBox(height: 3.h,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: kPrimaryColor, width: 2),
                  color: kGreyButton.withOpacity(0.4)),
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 10.h, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainText(
                    text: task.title,
                    fontColor: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                  MainText(
                    text: task.description,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
