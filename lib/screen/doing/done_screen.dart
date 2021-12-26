import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todoapp_firebase/Common/Common.dart';
import 'package:todoapp_firebase/state/todo_controller.dart';
import 'package:todoapp_firebase/view_model/todo_view_model_imp.dart';

import '../detail_todo_screen.dart';
import '../detail_todo_screen2.dart';

class DoneScreen extends StatefulWidget {
  @override
  _DoneScreenState createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  void initState() {}
  TodoController todoController = Get.put(TodoController());
  var todoViewModel = TodoViewModelImp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "done",
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: ListView.builder(
          itemCount: todoController.listTodos.length,
          itemBuilder: (context, index) => Slidable(
                child: todoController.listTodos[index].isDone == true
                    ? InkWell(
                  onTap: (){
                    todoController.selectTodo2.value=todoController.listTodos[index];
                  //  Get.to(()=>DetailTodoScreen());
                    Navigator.push(context, new MaterialPageRoute(builder:
                    (BuildContext context)=>DetailTodoScreen2()
                    ));
                  },
                  child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: index % 2 == 0
                                ? Colors.deepPurpleAccent
                                : Colors.deepOrangeAccent,
                            width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  child: Text(
                                    '${todoController.listTodos[index].content}',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: 230,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.red, width: 1),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("create date: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700)),
                                    Text(
                                      convertDate(todoController
                                          .listTodos[index].createDate),
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                )
                    : Container(
                        height: 0,
                        width: 0,
                      ),
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                secondaryActions: [
                  IconSlideAction(
                    caption: "delete",
                    color: Colors.redAccent,
                    foregroundColor: Colors.yellow,
                    icon: Icons.delete,
                    onTap: () {
                      setState(() {
                        todoViewModel.deleteTodo(numberTodo: todoController.listTodos[index].contentNumber);
                        todoController.listTodos.removeAt(index);
                      });

                    },
                  ),
                  IconSlideAction(
                    caption: "doing",
                    color: Colors.red,
                    icon: Icons.label,
                    onTap: () {},
                  ),
                  IconSlideAction(
                    caption: "close",
                    color: Colors.deepPurpleAccent,
                    icon: Icons.close,
                    foregroundColor: Colors.yellow,
                  ),
                ],
              )),
    );
  }
}
