import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var result = "";

  Widget btn(var textt) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + textt;
          });
        },
        child: Text("${textt}",style:TextStyle(fontSize: 40,color: Colors.white),),
        style: ElevatedButton.styleFrom(primary: Colors.grey,onPrimary: Colors.black,shape: CircleBorder(),minimumSize: Size(105, 105)),
        // autofocus: true,
        
        );
      
  }

  clearr() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child:
        
         Container(
           color: Colors.black,
              
           child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Text(
              result,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
           
              Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  btn("1"),
                  btn("2"),
                  btn("3"),
                  btn("4"),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  btn("5"),
                  btn("6"),
                  btn("7"),
                  btn("8"),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  btn("9"),
                  btn("0"),
                  btn("-"),
                  btn("*"),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  btn("/"),
                  btn("+"),
                  ElevatedButton(onPressed: output, child: Text("=",style:TextStyle(fontSize: 40,color: Colors.white),),
                          style: ElevatedButton.styleFrom(primary: Colors.green,onPrimary: Colors.lightGreen,shape: CircleBorder(),minimumSize: Size(105, 105)),
                  ),
                  ElevatedButton(onPressed: clearr, child: Text("Clear",style:TextStyle(fontSize: 30,color: Colors.white),),
                          style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.redAccent,shape: CircleBorder(),minimumSize: Size(105, 105)),),
                ],
              ),
            ],
        ),
         ),
      ),
    );
  }
}
