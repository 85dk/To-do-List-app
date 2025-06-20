import 'package:flutter/material.dart';
import 'package:flutter_to_do_list_app/model/database.dart';
import 'package:flutter_to_do_list_app/util/dialogbox.dart';
import 'package:flutter_to_do_list_app/util/todo_tile.dart';
import 'package:hive/hive.dart';

class Homepage extends StatefulWidget {

  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final mybox =Hive.box('mybox');
  final controller = TextEditingController();
  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
    if(mybox.get("TODOLIST") == null){
      db.createintialdata();
    }else{
      db.loaddata();
    }
    super.initState();
  }
  //checkboxtap
  void checkboxchanged(bool? value,int index){
  setState(() {
    db.TodoList[index][1] = !db.TodoList[index][1];
  });
  db.updatedatabase();
  }
  void savenewtask(){
    setState(() {
      db.TodoList.add([controller.text,false] );
      controller.clear();
    });
    Navigator.of(context).pop();
    db.updatedatabase();
  }
  void createnewtask(){
   showDialog(context: context, builder: (context){
    return Dialogbox(controller:controller ,onsave:savenewtask ,oncancel:() =>Navigator.of(context).pop() ,);
   });
  }
  
  void deletetask(int index,){
  setState(() {
    db.TodoList.remove(index);
  });
  db.updatedatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('To do List'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(onPressed: createnewtask ,child: Icon(Icons.add),),
    body: ListView.builder(
      itemCount:  db.TodoList.length,
      itemBuilder: (context, index) {
        return TodoTile(taskname: db.TodoList[index][0], taskcompleted:db.TodoList[index][1], onChanged: (value)=> checkboxchanged(value,index),deletetask: (context) => deletetask,);
      },
  
    ),
    );
  }
}