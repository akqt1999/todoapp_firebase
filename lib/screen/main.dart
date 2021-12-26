import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp_firebase/model/todo_model.dart';
import 'package:todoapp_firebase/screen/add_new_todo/add_new_todo_screeen.dart';
import 'package:todoapp_firebase/screen/doing/done_screen.dart';

import 'package:todoapp_firebase/view_model/todo_view_model_imp.dart';
import 'doing_screeen_full.dart';
import 'doing/doing_screen.dart';
import 'home.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: CupertinoStoreHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, }) : super(key: key);



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index=0;
  final navigationkey=GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    print('buid cua ham main');
    final items=<Widget>[
      Icon(Icons.list,size: 30,),
      Icon(Icons.add_circle_sharp,size: 30,),
      Icon(Icons.done_all,size: 30,)
    ];

    final navigationkey=GlobalKey<CurvedNavigationBarState>();
    final _screens=[
      DoingScreen(),
      AddNewTodoScreen(),
      DoneScreen(),

    ];
    PageController _pageController=PageController();
    int _selectIndex=0; // cai nay co cung nhu khong co , de dai cho vui

   void _onPageChanged (int index){
      setState(() {
        _selectIndex=index;
      });
   }
   void _onItemTapped(int selectIndex){
     _pageController.jumpToPage(selectIndex);
   }

    return SafeArea(
      child: Scaffold(
         // minh them cai nay o day la vi minh dang su dung bottpm m navigation
        body: IndexedStack(
          children:_screens ,
          index: index,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          index: index,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 400),
          color: Colors.indigo,
          backgroundColor: Colors.pink,
          buttonBackgroundColor: Colors.cyan,
          items: items,
          onTap: (index)=>setState(()=>this.index=index),
       //   onTap: _onItemTapped,

        ),

      ),
    );
  }


}

