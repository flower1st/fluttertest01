// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class Hoverpage extends StatefulWidget {
  // final Widget Function(bool isHovered) builder;
  //const Hoverpage({Key? key}) : super(key: key);
  @override
  _HoverpageState createState() => _HoverpageState();
}

class _HoverpageState extends State<Hoverpage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        height: 500,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60), color: Colors.amber),
      ),
    );
  }
}
