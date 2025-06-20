import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {

  final String taskname;
  final bool taskcompleted;
  Function (bool?)? onChanged;
  Function(BuildContext)? deletetask;

 TodoTile({super.key,required this.taskname,required this.taskcompleted,required this.onChanged,required this.deletetask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [SlidableAction(onPressed:deletetask,icon: Icons.delete,backgroundColor: Colors.red,borderRadius: BorderRadius.circular(12),)]),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              //checkbox
              Checkbox(value: taskcompleted, onChanged: onChanged,activeColor: Colors.black,),
              //task name
              Text(taskname,style: TextStyle(decoration:taskcompleted? TextDecoration.lineThrough: TextDecoration.none ,)),
            ],
          ),
          decoration: BoxDecoration(color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          ),
          
        ),
      ),
    );
  }
}