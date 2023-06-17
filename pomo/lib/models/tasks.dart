class Task{
  final String taskName;
  bool isDone;
  String estPomo;
  Task({required this.taskName,required this.estPomo,this.isDone=false});

  void toggleDone()=>isDone=!isDone;

}