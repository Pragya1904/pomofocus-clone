import 'package:flutter/material.dart';
import 'package:pomo/models/tasks.dart';
import 'package:pomo/providers/TaskProvider.dart';
import 'package:provider/provider.dart';
import 'customListTile.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) =>
      ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: taskProvider.taskCount,
          itemBuilder: (context, index) {
            return CustomListTile(
              height: widget.height,
              width: widget.width,
              isChecked: taskProvider.tasks[index].isDone,
              taskTitle: taskProvider.tasks[index].taskName,
              estPomo: taskProvider.tasks[index].estPomo,
              completionCallback:(isDoneState)
                {
                  taskProvider.updateTask(taskProvider.tasks[index]);
                }
            );
          }),
    );
  }
}
