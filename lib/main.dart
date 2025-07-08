import 'package:assignment2/screen/item_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REST API Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ItemScreen(),
    );
  }
}
