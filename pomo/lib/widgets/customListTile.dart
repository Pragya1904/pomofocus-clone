import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/TaskProvider.dart';
import '../screens/home_page.dart';
import 'addTasksCard.dart';
import 'package:pomo/widgets/updateTaskCard.dart';

class CustomListTile extends StatelessWidget {
  final double height;
  final double width;
  final bool isChecked;
  final String taskTitle;
  final String estPomo;
  final Function completionCallback;
  const CustomListTile({
    super.key, required this.height, required this.width, required this.isChecked, required this.taskTitle, required this.estPomo, required this.completionCallback,
  });

  @override

  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        return Container(
          margin: EdgeInsets.symmetric(
              vertical: height * 0.005),
          padding: EdgeInsets.symmetric(
              vertical: height * 0.006),
          decoration: BoxDecoration(
              color: Colors.white,
              //border: Border(left: BorderSide(width: 0.02,color: Colors.orange)),
              borderRadius: BorderRadius.circular(7)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    completionCallback(isChecked);
                  }, icon: Icon(Icons.check_circle,color: isChecked?primaryColorRed:lightGrey,size: 30,)),
                  SizedBox(width: width*0.02,),
                  Text(taskTitle,style:TextStyle(decoration: isChecked?TextDecoration.lineThrough:TextDecoration.none) ,),
                ],
              ),
              Row(
                children: [
                  Text("0/$estPomo",style: TextStyle(color: mediumGrey),),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.009),
                    child: GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    topLeft: Radius.circular(12))),
                            isScrollControlled: true,
                            context: context,
                            builder: (ctx) =>

                                AddTaskCard(width: width, height: height));

                      },
                      child: Container(
                        width:width * 0.121,
                        margin: EdgeInsets.symmetric(
                            horizontal:width * 0.0096, vertical:height * 0.0095),
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.0096, vertical: height * 0.0095),
                        decoration: BoxDecoration(
                            border: Border.all(color: lightGrey),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Icon(
                          Icons.more_vert,
                          color:lightGrey,
                          size: height * 0.032,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },

    );
  }
}
