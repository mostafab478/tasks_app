import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/domain/task/entities/task.dart';

import '../../../shared/styles/app_colors.dart';
import '../../../shared/widgets/main_text.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function()? onDelete;
  final Function()? onTap;

  const TaskItem(
      {super.key,
      required this.task,
      required this.onDelete,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) async => await onDelete!.call(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: kRed,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Icon(
              Icons.delete,
              color: kWhite,
              size: 25.w,
            ),
          ),
        ),
      ),
      key: Key(task.id.toString()),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: MainText(text: task.title),
          subtitle: MainText(
            text: task.description,
            fontColor: kHintTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
          ),
          trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: kRed,
                size: 25.w,
              ),
              onPressed: onDelete),
        ),
      ),
    );
  }
}
