import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:todoapp_firebase/view_model/todo_view_model_imp.dart';

import '../../state/todo_controller.dart';

class AddNewTodoScreen extends GetView<TodoController> {
  final todoVM = new TodoViewModelImp();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('add new todo'),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.save,
                      color: Colors.pink,
                    ),
                    onPressed: () {})
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (text) {},
                      controller: contentController,
                      maxLines: 29,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          hintText: 'enter todo',
                          isDense: true,
                          contentPadding: EdgeInsets.all(28),
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(20)))),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(5),
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          var todo = await todoVM.createTodoModel(
                              isDone: false, content: contentController.text);
                          var result = await todoVM.submitTodo(todo);
                          controller.addTodo(todo);
                          if (result) {
                            contentController.clear();
                          }
                          //
                        },
                        child: Text('add new todo'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pinkAccent,
                        )),
                  ),

                  // ),
                ],
              ),
            )));
  }
}
