// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo/Utiltiy/button.dart';
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback Onsaved;
  VoidCallback Oncancelled;
  DialogBox({super.key,required this.controller,required this.Onsaved,required this.Oncancelled});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[600],
      content: Container(height: 170,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //get user input
              TextField(
                controller: controller,
                style: TextStyle(color: Colors.black,),
                decoration: InputDecoration(
                  hintText: "Add a new task",

                    border: OutlineInputBorder(),
                    focusColor: Colors.black,hoverColor: Colors.black,fillColor: Colors.white),
                cursorColor: Colors.black,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //save button
                  MyButton(text: "Save", Onpressed: Onsaved),

                  //cancel button
                  MyButton(text: "Cancel", Onpressed: Oncancelled),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
