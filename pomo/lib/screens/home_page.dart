import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pomo/providers/TaskProvider.dart';
import 'package:pomo/constants.dart';
import 'package:pomo/providers/TimerProvider.dart';
import 'package:provider/provider.dart';

import '../widgets/addTasksCard.dart';
import '../widgets/appBarAction.dart';
import '../widgets/customListTile.dart';
import '../widgets/taskList.dart';
// import 'package:pomo/TaskProvider.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Consumer2<TimerProvider,TaskProvider>(
      builder: (context, timerProvider,taskProvider, child) => Scaffold(
        backgroundColor: timerProvider.option == 1
            ? primaryColorRed
            : timerProvider.option == 2
                ? primaryColorGreen
                : primaryColorBlue,
        appBar: AppBar(
            titleSpacing: width * 0.02,
            title: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                SizedBox(
                  width: width * 0.01,
                ),
                const Text('Pomofocus 2.0',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            backgroundColor: timerProvider.option == 1
                ? primaryColorRed
                : timerProvider.option == 2
                    ? primaryColorGreen
                    : primaryColorBlue,
            actions: [
              AppBarAction(
                onPress: () {
                  setState(() {
                    customToast(timerProvider);
                  });
                  //todo:history and stats
                },
                width: width,
                height: height,
                icon: Icons.bar_chart_outlined,
              ),
              AppBarAction(
                onPress: () {
                  setState(() {
                    customToast(timerProvider);
                  });
                  //todo:settings
                },
                width: width,
                height: height,
                icon: Icons.settings,
              ),
              AppBarAction(
                onPress: () {
                  setState(() {
                    customToast(timerProvider);
                  });
                  //todo: login screen
                },
                width: width,
                height: height,
                icon: Icons.person,
              ),
            ]),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                margin: EdgeInsets.all(height * 0.02),
                color: timerProvider.option == 1
                    ? secondaryColorRed
                    : timerProvider.option == 2
                        ? secondaryColorGreen
                        : secondaryColorBlue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {},
                            style: ButtonStyle(backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              if (timerProvider.option == 1) {
                                return timerProvider.option == 1
                                    ? shadowRed
                                    : timerProvider.option == 2
                                        ? shadowGreen
                                        : shadowBlue;
                              }
                              return timerProvider.option == 1
                                  ? secondaryColorRed
                                  : timerProvider.option == 2
                                      ? secondaryColorGreen
                                      : secondaryColorBlue;
                            })),
                            child: Text(
                              "Pomodoro",
                              style: btnTextStyle,
                            )),
                        TextButton(
                            onPressed: () {},
                            style: ButtonStyle(backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              if (timerProvider.option == 2) {
                                return timerProvider.option == 1
                                    ? shadowRed
                                    : timerProvider.option == 2
                                        ? shadowGreen
                                        : shadowBlue;
                              }
                              return timerProvider.option == 1
                                  ? secondaryColorRed
                                  : timerProvider.option == 2
                                      ? secondaryColorGreen
                                      : secondaryColorBlue;
                            })),
                            child: Text(
                              "Short Break",
                              style: btnTextStyle,
                            )),
                        TextButton(
                            onPressed: () {},
                            style: ButtonStyle(backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              if (timerProvider.option == 3) {
                                return timerProvider.option == 1
                                    ? shadowRed
                                    : timerProvider.option == 2
                                        ? shadowGreen
                                        : shadowBlue;
                              }
                              return timerProvider.option == 1
                                  ? secondaryColorRed
                                  : timerProvider.option == 2
                                      ? secondaryColorGreen
                                      : secondaryColorBlue;
                            })),
                            child: Text(
                              "Long Break",
                              style: btnTextStyle,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      '${timerProvider.minutes.toString().padLeft(2, '0')}:${timerProvider.seconds.toString().padLeft(2, '0')}',
                      style: const TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: timerProvider.isRunning
                          ? MainAxisAlignment.spaceEvenly
                          : MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              timerProvider.isRunning
                                  ? timerProvider.stopTimer()
                                  : timerProvider.startTimer();
                            });
                          },
                          style: ButtonStyle(
                              elevation:
                                  MaterialStateProperty.resolveWith<double>(
                                      (states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return 10;
                                }
                                return 5;
                              }),
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.white),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      horizontal: width * 0.15,
                                      vertical: timerProvider.isRunning
                                          ? height * 0.016
                                          : height * 0.022)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          width * 0.01)))),
                          child: Text(
                            timerProvider.isRunning ? "PAUSE" : 'START',
                            style: TextStyle(
                                fontSize: 24,
                                color: timerProvider.option == 1
                                    ? primaryColorRed
                                    : timerProvider.option == 2
                                        ? primaryColorGreen
                                        : primaryColorBlue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Visibility(
                            visible: timerProvider.isRunning,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    timerProvider.resetTimer();
                                  });
                                },
                                icon: Icon(
                                  Icons.skip_next,
                                  color: Colors.white70,
                                  size: height * 0.045,
                                )))
                      ],
                    ),
                    SizedBox(
                      height: height * 0.025,
                    )
                  ],
                ),
              ),
              Text(
                "#${timerProvider.internalOptionCount}",
                style: const TextStyle(color: Colors.white54),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Text(
                "Time to focus!",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: height * 0.02,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Tasks",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      // IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,)),
                      AppBarAction(
                          width: width,
                          icon: Icons.more_vert,
                          height: height,
                          onPress: () {})
                    ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: height * 0.02, vertical: height * 0.004),
                child: const Divider(
                  color: Colors.white60,
                  thickness: 2,
                ),
              ),
              //todo: add list view here
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: height * 0.02, vertical: height * 0.004),
                child: TaskList(height: height, width: width)
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: height * 0.02, vertical: height * 0.004),
                child: DottedBorder(
                  color: Colors.white54,
                  strokeWidth: 2,
                  child: GestureDetector(
                    onTap: () {
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
                      color: timerProvider.option == 1
                          ? addTaskRed
                          : timerProvider.option == 2
                              ? addTaskGreen
                              : addTaskBlue,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: height * 0.027),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add_circle_outline,
                              color: Colors.white54,
                              size: 20,
                            ),
                            SizedBox(
                              width: width * 0.007,
                            ),
                            const Text(
                              "Add Task",
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void customToast(TimerProvider timerProvider) {
    Fluttertoast.showToast(
        msg: "This Feature would be added soon",
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 15,
        gravity: ToastGravity.BOTTOM,
        textColor: timerProvider.option == 1
            ? primaryColorRed
            : timerProvider.option == 2
                ? primaryColorGreen
                : primaryColorBlue,
        backgroundColor: Colors.white);
  }
}







