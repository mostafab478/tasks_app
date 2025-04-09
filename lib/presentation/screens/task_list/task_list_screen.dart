import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/constants/constants.dart';
import 'package:task/core/helpers/navigator_push.dart';
import 'package:task/presentation/screens/add_task_form/add_task_form_screen.dart';
import 'package:task/presentation/shared/widgets/main_text.dart';
import '../../../di/injection.dart';
import '../../bloc/task/task_bloc.dart';
import '../../bloc/task/task_event.dart';
import '../../bloc/task/task_state.dart';
import '../../shared/widgets/common_bottom_sheet.dart';
import '../../shared/widgets/dialogs/custom_dialog.dart';
import '../../shared/widgets/dialogs/delete_dialog.dart';
import '../task_view/task_view_screen.dart';
import 'widgets/task_item.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskBloc>(
      create: (_) => sl<TaskBloc>()..add(LoadTasks()),
      child: Scaffold(
        appBar: AppBar(title: const MainText(text: 'Task Manager')),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskLoaded) {
              return state.tasks.isEmpty
                  ? emptyShow(title: "No added tasks for now")
                  : ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemCount: state.tasks.length,
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (c, index) {
                        final task = state.tasks[index];
                        return TaskItem(
                          task: task,
                          onTap: () => MagicRouter.navigateTo(TaskViewScreen(
                            task: task,
                            onDelete: () => customDialog(
                              theDialog: DeleteDialog(
                                onDelete: () {
                                  MagicRouter.pop();
                                  MagicRouter.pop();
                                  c
                                      .read<TaskBloc>()
                                      .add(DeleteTaskEvent(task.id));
                                },
                              ),
                              dismiss: true,
                            ),
                          )),
                          onDelete: () => customDialog(
                            theDialog: DeleteDialog(
                              onDelete: () {
                                MagicRouter.pop();
                                c
                                    .read<TaskBloc>()
                                    .add(DeleteTaskEvent(task.id));
                              },
                            ),
                            dismiss: true,
                          ),
                        );
                      },
                    );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: BlocBuilder<TaskBloc, TaskState>(
          builder: (c, state) {
            return FloatingActionButton(
              onPressed: () {
                openCommonBottomSheet(context,
                    child: BlocProvider.value(
                        value: c.read<TaskBloc>(), child: AddTaskFormScreen()),
                    sheetHeight: 500.h);
              },
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
