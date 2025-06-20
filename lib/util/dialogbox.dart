import 'package:flutter/material.dart';
import 'package:flutter_to_do_list_app/util/my_button.dart';

class Dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;
   Dialogbox({super.key,required this.controller,required this.onsave,required this.oncancel});
  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:Colors.grey[300],
      content: Container(
        height: 120,
        child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
         //task name
          TextField(
            controller:controller ,
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Task Name'),
          ),
          //button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   //save
                   MyButton(name: 'Save', onpressed: onsave),
                   const SizedBox(width: 8.0),
                   //cancel
                   MyButton(name: 'Cancel', onpressed: oncancel),
                  ],
            
          )
        ],),
      )
    );
  }
}