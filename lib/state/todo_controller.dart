import 'package:get/get.dart';
import 'package:todoapp_firebase/model/todo_model.dart';

class TodoController extends GetxController{
  var listTodos=List<TodoModel>.empty(growable: true);
  void addTodo(TodoModel todoModel){
    listTodos.insert(0,todoModel);
  }
  var selectTodo=TodoModel(
    contentNumber: "contentNumber",
    content: "",
      createDate: 0,
    isDone: true
  ).obs;
  var selectTodo2=TodoModel(
      contentNumber: "contentNumber",
      content: "",
      createDate: 0,
      isDone: true
  ).obs;
  void changeStatus({bool status,int index}){
    listTodos[index].isDone=status;
  }
}