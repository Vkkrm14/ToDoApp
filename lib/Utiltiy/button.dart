import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback Onpressed;
   MyButton({super.key, required this.text,required this.Onpressed});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(onPressed: Onpressed,child:Text (text),);
  }
}

