import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp_firebase/state/todo_controller.dart';

class DetailTodoScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TodoController todoController=Get.find();
    return Scaffold(
      appBar: AppBar(title: Text("detail todo"),),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
        Text(todoController.selectTodo.value.content,style: TextStyle(
          fontSize: 19
        ),),
        ]
      ),
    );
  }

}

