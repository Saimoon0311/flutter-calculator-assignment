import 'package:flutter/material.dart';



class Todoapp extends StatefulWidget {
  const Todoapp({ Key? key }) : super(key: key);

  @override
  _TodoappState createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
    var output = "";
  List<dynamic> lst = ["Gym"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              // color: Colors.blue,
           decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
      BoxShadow(color: Colors.blue.shade900, spreadRadius: 3),
    ],
          ),
     
              margin: EdgeInsets.only(top: 20,right: 10,left: 10),
              child: ListTile(
                title: Text("${lst[index]}",style: TextStyle(fontSize: 30),),
                trailing: Container(
                  width: 50,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                                   showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Edit Item"),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            lst.replaceRange(index, index+1, {output});
                          });
                        },
                        child: Text("Edit ITEM"))
                  ],
                );
              });
        
                          },
                          child: Icon(Icons.edit)),
                           GestureDetector(
                          onTap: () {
                            setState(() {
                              lst.removeAt(index);
                            });
                          },
                          child: Icon(Icons.delete)),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Item"),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            lst.add(output);
                          });
                        },
                        child: Text("Add ITEM"))
                  ],
                );
              });
        },
        // child: Text("Add"),
                child: Icon(Icons.add),
      ),
      
    );
  }
}