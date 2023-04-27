import 'package:hive_flutter/hive_flutter.dart';

class ToDodata{

  List toDoList = [];

  final _tobox = Hive.box("todobox");

  void createinitialdata(){
    toDoList=[
    ["Shopping",false,"washing powder"],
      ["Running",false,"run 6km"],
      ["Homework",false,"maths "],
      ["Interview",false," @ 7pm today"],
      ["Client meeting",false," @ 10pm today"],
      ["Buy charger",false," urgent"],
    ];
  }

  void loaddata(){
    toDoList= _tobox.get("todolist");
  }

  void updatedatabase(){
    _tobox.put("todolist",toDoList);

  }
}