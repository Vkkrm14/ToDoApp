import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';


class ToDoDatabase{
  List ToDoList=[];
  //refernce to hive box
   final _mybox= Hive.box("mybox");
    //run this method if this is the 1'st time ever opening this app
   void createinitdata(){
     ToDoList=[
       ["Welcomr to the app",false]
     ];
   }
   //load database
    void loaddata(){
      ToDoList=_mybox.get("TODOLIST");
    }
    //update database
    void updatedata(){
      _mybox.put("TODOLIST", ToDoList);
    }
}