import 'package:todoapp_firebase/model/todo_model.dart';

abstract class TodoViewModel{
  Future<bool>submitTodo(TodoModel todoModel);

  Future<TodoModel>createTodoModel({
    String content,
    bool isDone
});
  Future<List<TodoModel>>getTodoDoing();

  Future<bool>deleteTodo({String numberTodo});

  Future<bool> chageStatus({Map<String,dynamic> childUpdates,String numberTodo });

}