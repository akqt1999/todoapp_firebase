import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp_firebase/Common/Common.dart';
import 'package:todoapp_firebase/model/todo_model.dart';
import 'package:todoapp_firebase/view_model/todo_view_model_imp.dart';

class DoingScreen2 extends StatelessWidget { // nen bo lun cai nay
  var todoViewModel=TodoViewModelImp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StateExample(),

    );
  }

}
class StateExample extends StatefulWidget {
  StateExample({Key key}) : super(key: key);

  @override
  _StateExampleState createState() => _StateExampleState();
}
class _StateExampleState extends State<StateExample>{
  var todoViewModel=TodoViewModelImp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFA),
      appBar: AppBar(
          title: AppBar(title: Text('doing'),),
      ),
    //   body: FutureBuilder(
    // future: todoViewModel.getTodoDoing(),
    // builder: (context,snapshot) {
    //   if (snapshot.connectionState == ConnectionState.waiting) {
    //     return Center(child: CircularProgressIndicator(),);
    //   }else{
    //     var listTodos=snapshot.data as List<TodoModel>;
    //     return ListView.builder(
    //         itemCount:listTodos.length ,
    //         itemBuilder: (context,indext)=>Slidable(
    //           child: Card(
    //             elevation: 8,
    //             margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
    //             child: Container(
    //               child: Column(
    //
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children:  [
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: [
    //                       Container(
    //
    //                         height: 45,
    //                         child:Text('${listTodos[indext].content}',style: TextStyle(
    //                             fontSize: 20
    //                         ),),
    //
    //
    //                       )
    //                     ],
    //                   ),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: [
    //                       Text('create date: ',style: TextStyle(
    //                           fontSize: 15,color: Colors.deepPurple
    //                       ),),
    //                       Text('${convertDate(listTodos[indext].createDate)}',
    //                         style: TextStyle(
    //                             fontSize: 15,color: Colors.black
    //                         ),)
    //
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //
    //           ),
    //           actionPane: SlidableDrawerActionPane(),
    //           actionExtentRatio: 0.25,
    //           secondaryActions: [
    //             IconSlideAction(
    //                 caption: 'delete',
    //                 icon: Icons.delete,
    //                 color: Colors.red,
    //                 onTap: (){
    //                   setState(() {
    //                     todoViewModel.deleteTodo(numberTodo: listTodos[indext].contentNumber);
    //                     listTodos.removeAt(indext);
    //                   });
    //
    //
    //                 }
    //             ),
    //             IconSlideAction(
    //               caption: 'done',
    //               icon: Icons.done,
    //               color: Colors.pink,
    //               onTap: (){print('done click');},
    //             )
    //           ],
    //         )
    //     );
    //   }
    // }
    //   )
      body: (Center(child: Text('home'),)),
    );
  }
  // bodyContent() {
  //   return ListView.builder(
  //       itemCount: colors.length,
  //       itemBuilder: (context, index) {
  //         return Card(
  //           color: Color(0xFFEFDFBB),
  //           child: ListTile(
  //             contentPadding: EdgeInsets.all(10),
  //             title: Text(colors[index]),
  //             trailing: IconButton(
  //               icon: Icon(
  //                 Icons.delete,
  //                 color: Colors.red,
  //               ),
  //               onPressed: (){
  //
  //                 setState(() {
  //                   colors.removeAt(index);
  //                 });
  //               },
  //             ),
  //           ),
  //         );
  //       }
  //   );
  // }
}