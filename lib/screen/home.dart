import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_firebase/screen/add_new_todo/add_new_todo_screeen.dart';
import 'package:todoapp_firebase/screen/doing/doing_screen.dart';
import 'package:todoapp_firebase/screen/doing/done_screen.dart';

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.orangeAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt,color:Colors.red),
              label: 'doing',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'add',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.done_all), label: 'done')
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: DoingScreen());
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: AddNewTodoScreen());
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: DoneScreen());
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: DoingScreen());
            });
        }
      },
    );
  }
}
