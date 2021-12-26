import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:todoapp_firebase/Common/Common.dart';
import 'package:todoapp_firebase/model/todo_model.dart';

Future<bool> writeTodoToDatabase(TodoModel todoModel) async {
  try {
    await FirebaseDatabase.instance.reference()
        .child(TODO_REF)
        .child(todoModel.contentNumber)
        .set(todoModel.toJson());
    Get.snackbar('add todo success', 'your todo has been add');
    return true;
  } catch (e) {
    Get.snackbar('add todo error', e.toString());
    return false;
  }
}

Future <List<TodoModel>> getTodoDoingFormFirebase() async {
  var list = new List<TodoModel>.empty(growable: true);
  var source = await FirebaseDatabase.instance.reference()
      .child(TODO_REF).once();
  Map<dynamic, dynamic>values = source.value;
  values.forEach((key, value) {
    list.add(TodoModel.fromJson(jsonDecode(jsonEncode(value))));
  });

  return list;
}

Future<bool> deleteTodoFirebase(String todoNumber) async {
  try {
    await FirebaseDatabase.instance.reference().child(TODO_REF).child(
        todoNumber).remove();
    return true;
  } catch (e) {
    return false;
  }
}

Future <bool> chageStatusFirebase({Map<String,dynamic> childUpdates,String contentNumber}) async {
  try {
    await FirebaseDatabase.instance.reference().child(TODO_REF).child(
        contentNumber).update(childUpdates);
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}





