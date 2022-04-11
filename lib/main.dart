
import 'package:flutter/material.dart';
import 'dart:io';
    void main(){
      runApp(mycalc());
    }
    class mycalc extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepage(),
    );
    }
    }
    class Homepage extends StatefulWidget {

    @override
    _HomepageState createState() => _HomepageState();
    }

    class _HomepageState extends State<Homepage> {
    @override
    Widget build(BuildContext context) {

    return Scaffold(
    backgroundColor: Colors.black87,
    appBar: AppBar(
    backgroundColor: Colors.lightBlue.shade500,
    title: Text("BCalculator",
    style: TextStyle(color: Colors.black87,
    fontStyle: FontStyle.italic
    ),

    ),

    ),
      body: Container(
        child: Column(

          children: [

            Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 35.0,
                    color: Colors.white,
                    ),
                  ),
                )

            ),
            Row(

              children: [
                Button("CE"),
                Button("C"),
                Button("Rem"),
                Button("<-"),

              ],
            ),
            Row(
              children: [
                Button("1"),
                Button("2"),
                Button("3"),
                Button("+"),

              ],
            ),
            Row(
              children: [
                Button("4"),
                Button("5"),
                Button("6"),
                Button("-"),

              ],
            ),
            Row(
              children: [
                Button("7"),
                Button("8"),
                Button("9"),
                Button("x"),

              ],
            ),
            Row(
              children: [
                Button("."),
                Button("0"),
                Button("="),
                Button("/"),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget Button(String n) {
    return Expanded(
      child: OutlineButton(
          color: Colors.white,
          padding: EdgeInsets.all(30.5),
          onPressed: () => clicked(n),
          child: Text(n,
            style: TextStyle(fontSize: 20.0,
            color: Colors.white,
            ),
          )
      ),
    );
  }

  int f = 0;
  int s = 0;
  double ff=0.0;
  double sf=0.0;
  int ans = 0;
  double dans =0.0;
  double div = 0.0;
  String sign = "";
  String res = "",
      text = "",type="";

  void clicked(String cb) {
    if (cb == "CE") {
      res = "";
      text = "";
      f = 0;
      s = 0;
      sf=0.0;
      ff=0.0;
    }
    else if(cb == "."){
      res=text+cb;
      type="Double";
    }
    else if (cb == "+" || cb == "-" || cb == "/" || cb == "x" || cb== "Rem" ) {
      if(type=="Double"){
        ff = double.parse(text);
      }
      else{
        f = int.parse(text);
      }
      sign = cb;
      res = "";
    }
    else if(cb=="C" || cb== "<-"){
      res=res.substring(0,res.length-1);
    }

    else if (cb == "=" ) {
      if(type=="Double"){
        sf = double.parse(text);
      }
      else{
        s = int.parse(text);
      }
      if(type=="Double"){
        if (sign == "+") {
          dans= sf + ff;
          res = dans.toString();
        }
        else if(sign=="Rem"){
          dans=ff % sf;
          res = dans.toString();
        }
        else if (sign == "-") {
          dans = ff - sf;
          res = dans.toString();
        }
        else if (sign == "x") {
          dans = ff * sf;
          res = dans.toString();
        }
        else  {
          div = ff / sf;
          res = div.toString();
        }
      }
      else{
        if (sign == "+") {
          ans= s + f;
          res = ans.toString();
        }
        else if(sign=="Rem"){
          ans=f % s;
          res = ans.toString();
        }
        else if (sign == "-") {
          ans = f - s;
          res = ans.toString();
        }
        else if (sign == "x") {
          ans = f * s;
          res = ans.toString();
        }
        else  {
          div = f / s;
          res = div.toString();
        }
      }


    }

    else {
      res = text + cb;
    }
    setState(() {
      text = res;
    });
  }
}

