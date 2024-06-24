// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoTile extends StatelessWidget {
  final String Taskname;
  final bool Taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefunction;

  ToDoTile({super.key,required this.Taskname,required this.Taskcompleted,required this.onChanged,required this.deletefunction});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(),
            children: [SlidableAction(onPressed: deletefunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,)]),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              //checkbox
             Checkbox(value: Taskcompleted, onChanged: onChanged,
             activeColor: Colors.black26,
               hoverColor: Colors.white,
               focusColor: Colors.white,
             ),
        
              //Task
              Text(Taskname,style: TextStyle(color: Colors.white60,
                  fontSize: 20.0,
                  decoration:(Taskcompleted)? TextDecoration.lineThrough:TextDecoration.none)
              ),
            ],
          ),
          decoration: BoxDecoration(color: Colors.grey[800],borderRadius: BorderRadius.circular(12.0)),
        
        ),
      ),
    );
  }
}
