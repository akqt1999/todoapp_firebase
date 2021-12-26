import 'package:todoapp_firebase/Common/Common.dart';
import 'package:todoapp_firebase/firebase/server_time_offset_reference.dart';
import 'package:todoapp_firebase/firebase/todo_reference.dart';
import 'package:todoapp_firebase/model/todo_model.dart';
import 'package:todoapp_firebase/view_model/todo_view_model.dart';

class TodoViewModelImp extends TodoViewModel {
  @override
  Future<TodoModel> createTodoModel(
      {String content,
      bool isDone}) async {

    var serverTime = await getServerTimeOffset();

    return new TodoModel(
      content: content,
      contentNumber: createTodoNumber(serverTime).toString(),
      createDate: serverTime,
      isDone: isDone
    );
  }

  @override
  Future<List<TodoModel>> getTodoDoing() {
    return getTodoDoingFormFirebase();
  }

  @override
  Future<bool> submitTodo(TodoModel todoModel) {
   return writeTodoToDatabase(todoModel);
  }

  @override
  Future<bool> deleteTodo({String numberTodo}) {
    deleteTodoFirebase(numberTodo);
  }

  @override
  Future<bool> chageStatus({Map<String,dynamic > childUpdates, String numberTodo}) {
    chageStatusFirebase(contentNumber: numberTodo,childUpdates: childUpdates);

  }

}
