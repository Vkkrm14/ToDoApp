// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/Utiltiy/database.dart';
import 'package:todo/Utiltiy/dialog_box.dart';

import '../Utiltiy/ToDo_Tile.dart';
class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //refernce to hive box
  final _mybox= Hive.box("mybox");
  //initialise database calss
  ToDoDatabase db=ToDoDatabase();

  @override
  void initState() {
    //if this is the 1'st time ever opening this app,create default data
    if(_mybox.get("TODOLIST")==null){
      db.createinitdata();
    }
    else {
      db.loaddata();
    }
    super.initState();
  }

  //text controller
  final _controller =TextEditingController();
  //list of to_do tasks
  //List ToDoList=[]; -> moves to database class

  //function for check box
  void CheckboxChanged(bool? value,int index){
    setState(() {
      db.ToDoList[index][1]=!db.ToDoList[index][1];
    });
    db.updatedata();
  }

  //save new task
  void savenewtask(){
    setState(() {
      db.ToDoList.add([_controller.text,false]);
      _controller.clear();


    });
    db.updatedata();

    Navigator.of(context).pop();
  }
  //create neew task
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller:_controller ,
        Onsaved: savenewtask,
        Oncancelled: ()=>Navigator.of(context).pop(),

      );
    });
  }
  //delete task
  void deletetask(int index){
    setState(() {
      db.ToDoList.removeAt(index);
    });
    db.updatedata();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        elevation: 0.0,
        title: Center(child: Text("TO DO",
        style: TextStyle(color: Colors.white70,
            fontWeight: FontWeight.bold),
        )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
        backgroundColor: Colors.grey[800],
        shape: CircleBorder(),
        child: Icon(Icons.add,color: Colors.white,),

      ),
      body: ListView.builder(
          itemCount: db.ToDoList.length,
          itemBuilder:(context,index)=>
              ToDoTile(
              Taskname: db.ToDoList[index][0],
              Taskcompleted:db.ToDoList[index][1] ,
              onChanged: (value)=> CheckboxChanged(value,index),
              deletefunction: (context)=>deletetask(index),) ,
      ),

    );
  }
}
