import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/helpers/app_validator_helper.dart';
import 'package:task/core/helpers/navigator_push.dart';
import 'package:task/presentation/shared/widgets/comon_text_field.dart';
import 'package:task/presentation/shared/widgets/custom_button.dart';

import '../../../domain/task/entities/task.dart';
import '../../bloc/task/task_bloc.dart';
import '../../bloc/task/task_event.dart';

class AddTaskFormScreen extends StatelessWidget {
  AddTaskFormScreen({super.key});

  final GlobalKey<FormState> taskFormKey = GlobalKey();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: taskFormKey,
        child: Column(
          children: [
            CommonTextField(
              hint: 'Title',
              headLabel: 'Title',
              validation: AppValidator.isTitle,
              controller: _title,
            ),
            SizedBox(
              height: 15.h,
            ),
            CommonTextField(
              hint: 'Description',
              headLabel: 'Description',
              maxLines: 6,
              validation: AppValidator.isHasValue,
              controller: _description,
            ),
            Spacer(),
            CustomButton(
              title: 'Confirm',
              onPressed: () async{
                if (taskFormKey.currentState!.validate() == true) {
                  final bloc = context.read<TaskBloc>();
                final tasks = await bloc.getTasks.repository.getTasks();
                  final task = Task(
                    id: tasks.length + 1,
                    title: _title.text,
                    description: _description.text,
                  );
                  bloc.add(AddNewTask(task));
                  _description.clear();
                  _title.clear();
                  MagicRouter.pop();
                }
              },
            ),
            SizedBox(
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}
