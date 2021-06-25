




import 'package:calculator/calculator.dart';
import 'package:calculator/extraui.dart';
import 'package:calculator/todoapp.dart';
import 'package:flutter/material.dart';






class pages extends StatefulWidget {
  const pages({ Key? key }) : super(key: key);

  @override
  _pagesState createState() => _pagesState();
}

class _pagesState extends State<pages> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Assignments",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),)),
          bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          tabs: [
          Tab(child: Text("Calculator",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),),
          Tab(child: Text("Todo App",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20)),),
          Tab(child: Text("Extra",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20)),),
          
        ]),),
        body: TabBarView(children: [
      Home(),
      Todoapp(),
      Extra()
        ]),
      ),
    );
  }
}