import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pomo/models/tasks.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/TaskProvider.dart';

class UpdateTaskCard extends StatelessWidget{
 final double width,height;

  const UpdateTaskCard({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {

    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Consumer<TaskProvider>(
        builder: (context,taskProvider,_){
          TextEditingController pomoCountController=TextEditingController(text: taskProvider.pomo_count);
          TextEditingController taskTextController=TextEditingController();
          return Padding(
            padding: EdgeInsets.only(bottom: mediaQueryData.viewInsets.bottom),
            child: SizedBox(
              height: height * 0.36,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05, vertical: height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: taskTextController,
                          onChanged: (value){
                            //taskProvider.taskName=value;
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "What are you working on?",
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                fontSize: 20,
                                letterSpacing: 1.2),
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                        Text(
                          "Est Pomodoros",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        SizedBox(height: height * 0.01),
                        Row(
                          children: [
                            Container(
                              width: width*0.25,
                              padding: EdgeInsets.symmetric(horizontal: width*0.02),
                              decoration:BoxDecoration(color: lightGrey,borderRadius: BorderRadius.circular(3)) ,
                              child: TextField(
                                keyboardType: TextInputType.numberWithOptions(signed: false,decimal: false),
                                controller: pomoCountController,
                                onChanged: (value){
                                  taskProvider.pomo_count=value;
                                },
                                decoration: InputDecoration(border: InputBorder.none),
                                textAlign: TextAlign.left,
                                style: TextStyle(color: darkGrey,fontWeight: FontWeight.bold,decoration: TextDecoration.none),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Card(
                              elevation: 2,
                              child: IconButton(onPressed: (){
                                int count = int.parse(pomoCountController.text);
                                count++;
                                taskProvider.pomo_count = count.toString();
                                pomoCountController.text = taskProvider.pomo_count.toString();
                              }, icon: Icon(Icons.arrow_drop_up,size: 30,color: mediumGrey,)),
                            ),
                            Card(
                              elevation: 2,
                              child: IconButton(onPressed: (){
                                int count = int.parse(pomoCountController.text);
                                if(count<1)
                                {
                                  count=0;
                                }
                                else {
                                  count--;
                                }
                                taskProvider.pomo_count = count.toString();
                                pomoCountController.text = taskProvider.pomo_count.toString();
                              }, icon: Icon(Icons.arrow_drop_down,size: 30,color: mediumGrey,)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(onPressed: () {
                              customToast(darkGrey);
                            },child:  Text("+ Add Note",style: TextStyle(color: mediumGrey,decoration: TextDecoration.underline),),),
                            TextButton(
                                onPressed: () {
                                  customToast(darkGrey);
                                }, child:  Text("+ Add Project",style: TextStyle(color: mediumGrey,decoration: TextDecoration.underline),)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              width: width,
                              height: height*0.08,
                              // padding: EdgeInsets.only(bottom: 0, top: height * 0.02),
                              color: lightGrey,
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.all(width*0.01),
                                    child: TextButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, child: Text("Cancel",style: TextStyle(color: mediumGrey),)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(width*0.03),
                                    child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(darkGrey),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)))),onPressed: (){
                                      if(taskTextController.text!="")
                                      {
                                        final task=Task(taskName: taskTextController.text, estPomo: taskProvider.pomo_count);
                                        taskProvider.saveData(task);
                                        Navigator.pop(context);

                                      }

                                    }, child: Text("Save",style: TextStyle(color: lightGrey),)),
                                  )
                                ],
                              )
                          )))
                ],
              ),
            ),
          );}
    );
  }

  void customToast(Color color) {
    Fluttertoast.showToast(
        msg: "This Feature would be added soon",
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 15,
        gravity: ToastGravity.BOTTOM,
        textColor: color,
        backgroundColor: Colors.white);
  }

}