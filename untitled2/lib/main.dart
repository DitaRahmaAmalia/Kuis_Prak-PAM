import 'package:flutter/material.dart';
import 'package:untitled2/menu_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MenuList(),
      //   appBar: AppBar(title: Text("Image Picker")),
      //   body: MenuList(),
      // )
    );
  }
}
