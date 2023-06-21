// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_new, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [],
          toolbarHeight: 800,
          flexibleSpace: Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0XFF1E1E1E), Color(0XFF5E5E5E)]),
          )),
          floating: true,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 700, left: 700),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.white),
                  width: 516,
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      new Flexible(
                        child: new TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: 'Search by name',
                                contentPadding: EdgeInsets.all(20))),
                      ),
                      const VerticalDivider(
                          width: 20,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                          color: Colors.grey),
                      new Flexible(
                        child: new TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_pin),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: 'Search for something',
                                contentPadding: EdgeInsets.only(left: 50))),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 188, 19, 149),
                          ),
                          iconSize: 24.0,
                          onPressed: () {})
                    ],
                  ),
                ),
                ButtonBar(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(width: 3, color: Colors.black),
                          ),
                        ),
                      ),
                      child: Text("For Bussiness"),
                    )
                  ],
                ),
                ButtonBar(
                  children: <Widget>[
                    ElevatedButton(onPressed: () {}, child: Text("Log In"))
                  ],
                ),
                ButtonBar(
                  children: <Widget>[
                    ElevatedButton(onPressed: () {}, child: Text("Sign Up"))
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            const SizedBox(
              height: 400,
              child: Center(
                child: Text(
                  'This is an awesome shopping platform',
                ),
              ),
            ),
            Container(
              height: 1000,
              color: const Color.fromARGB(255, 224, 221, 222),
            ),
          ]),
        ),
      ],
    ));
  }
}
