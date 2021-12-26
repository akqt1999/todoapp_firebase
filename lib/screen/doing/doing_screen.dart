import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todoapp_firebase/Common/Common.dart';
import 'package:todoapp_firebase/model/todo_model.dart';
import 'package:todoapp_firebase/state/todo_controller.dart';
import 'package:todoapp_firebase/view_model/todo_view_model_imp.dart';

import '../detail_todo_screen.dart';

class DoingScreen extends StatefulWidget {
  DoingScreen({Key key}) : super(key: key);

  @override
  _DoingScreenState createState() => _DoingScreenState();
}

class _DoingScreenState extends State<DoingScreen>
    with AutomaticKeepAliveClientMixin {
  var todoViewModel = TodoViewModelImp();
  List<TodoModel> listTodos;
  final TodoController todoController = Get.put(TodoController());

  @override
  Future<void> initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      listTodos = await todoViewModel.getTodoDoing();

      int count = 0;
      todoController.listTodos = listTodos;

      todoController.listTodos.sort((a,b)=>b.createDate.compareTo(a.createDate));

      listTodos.forEach((element) {
        print(element.content);
        count++;
        if (count > 0) {
          setState(() {});
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return listTodos != null
        ? Scaffold(
            appBar: AppBar(
              title: Text('doing'),
            ),
            body: ListView.builder(
                itemCount: todoController.listTodos.length,
                itemBuilder: (context, indext) => Slidable(
                  child: todoController.listTodos[indext].isDone!=true? InkWell(
                    onTap: (){
                      todoController.selectTodo.value=todoController.listTodos[indext];
                   //   Get.to(()=>DetailTodoScreen());
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context)=>new DetailTodoScreen()));
                    },
                    child: Card(
                      color: indext % 2 == 0
                          ? Colors.teal
                          : Colors.deepPurpleAccent,
                      elevation: 8,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      child: Container(

                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 48,

                                  child: Text(
                                    '${todoController.listTodos[indext].content}',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'create date: ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                Text(
                                  '${convertDate(todoController.listTodos[indext].createDate)}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ):
                  Container(height: 0,width: 0,),
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  secondaryActions: [
                    IconSlideAction(
                        caption: 'delete',
                        icon: Icons.delete,
                        color: Colors.red,
                        onTap: () {
                          setState(() {
                            todoViewModel.deleteTodo(
                                numberTodo: todoController.listTodos[indext].contentNumber);
                            todoController.listTodos.removeAt(indext);
                          });

                        }
                    ),
                    IconSlideAction(
                      caption: 'done',
                      icon: Icons.done,
                      color: Colors.pink,
                      onTap: () {
                        setState(() {
                            todoController.changeStatus(index: indext,status: true);
                              final childUpdates =Map<String,dynamic>();
                              childUpdates["isDone"]=true;
                            todoViewModel.chageStatus(childUpdates:childUpdates,
                                numberTodo: todoController.listTodos[indext].contentNumber);
                        });
                      },
                    )
                  ],
                )),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  @override
  bool get wantKeepAlive => true;
}
