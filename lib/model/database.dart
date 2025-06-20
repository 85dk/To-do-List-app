import 'package:hive/hive.dart';

class TodoDataBase{
  List TodoList =[];
  //reference the box
  final mybox =Hive.box('mybox');
  void createintialdata(){
    TodoList=[
      ['make project',false]
    ];
  }

  void loaddata(){
  TodoList =mybox.get("TODOLIST");
  }

  void updatedatabase(){
  mybox.put("TODOLIST",TodoList);
  }
}