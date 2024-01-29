import 'dart:js';

import 'package:blocapicall/product_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Demo Home Page"),
        ),
        body: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen())
                  );},
                child: Text(
                  "Get Products",
                  style: TextStyle(fontSize: 22),
                )
            )));
  }
}
