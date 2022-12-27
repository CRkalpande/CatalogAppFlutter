import 'package:catalog_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "codepur";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        // ignore: prefer_const_constructors
        title: Text("Catalog App"),
        
      ) ,
      body: Center(
        child: Container(
          child: Text("welcome to $days day of flutter $name"),
        ),
      ),
      drawer:MyDrawer(),
    );
  }
}
