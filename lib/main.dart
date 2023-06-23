// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_new, avoid_unnecessary_containers, unrelated_type_equality_checks, avoid_print, sized_box_for_whitespace

// ignore: unused_import
//import 'dart:js_interop';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

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
  double rating = 4.5;
  bool isHover = false;
  int currentIndex = 0;
  double sideLength = 50;
  final List<String> imagePaths = [
    'images/homepage.png',
    'images/homepage.png',
    'images/homepage.png',
    'images/homepage.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            actions: [],
            toolbarHeight: 950,
            flexibleSpace: Container(
                decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0XFF1E1E1E), Color(0XFF5E5E5E)]),
            )),
            floating: true,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 380, top: 100),
                  child: Row(
                    children: [
                      Image.asset(
                        "images/logo.png",
                        alignment: Alignment.centerRight,
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color.fromARGB(255, 255, 255, 255)),
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
                                      contentPadding:
                                          EdgeInsets.only(left: 50))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor:
                                    Color(0XFFD3427A), //<-- SEE HERE
                                child: IconButton(
                                  iconSize: 35,
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0XFFD3427A)),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(26)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(
                                    width: 3, color: Color(0XFFD3427A)),
                              ),
                            ),
                          ),
                          child: Text("For Bussiness"),
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(26)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          child: Text(
                            "Log In",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0XFFD3427A)),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(26)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(
                                    width: 3, color: Color(0XFFD3427A)),
                              ),
                            ),
                          ),
                          child: Text("Sign Up"),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    CarouselSlider(
                        items: imagePaths
                            .map((item) => Padding(
                                  padding: const EdgeInsets.only(bottom: 150),
                                  child: Stack(children: [
                                    Image.asset(
                                      item,
                                      fit: BoxFit.fill,
                                      height: 5000,
                                      width: 5000,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, top: 40, bottom: 10),
                                      child: Container(
                                        constraints: BoxConstraints(
                                            minHeight: 275, minWidth: 550),
                                        child: Image.asset(
                                            "images/vectorhalf.png",
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 120, top: 200),
                                      child: Text.rich(
                                        TextSpan(children: [
                                          TextSpan(
                                              text:
                                                  'Your Freedom\nto Creativity\n',
                                              style: GoogleFonts.mulish(
                                                textStyle: TextStyle(
                                                    fontSize: 80,
                                                    fontWeight: FontWeight.w800,
                                                    wordSpacing: 1),
                                              )),
                                          TextSpan(
                                              text:
                                                  '                                 ',
                                              style: GoogleFonts.mulish(
                                                textStyle:
                                                    TextStyle(fontSize: 15),
                                              )),
                                          TextSpan(
                                              text:
                                                  '\nA cross-platform for making salons\nanywhere for all creators!',
                                              style: GoogleFonts.mulish(
                                                textStyle: TextStyle(
                                                    fontSize: 30,
                                                    wordSpacing: 1.5,
                                                    letterSpacing: 1),
                                              )),
                                        ]),
                                      ),
                                    ),
                                  ]),
                                ))
                            .toList(),
                        options: CarouselOptions(
                            height: 900,
                            onPageChanged: (index, reason) {
                              setState(() {
                                print(reason.toString());
                                currentIndex = index;
                              });
                            },
                            autoPlay: true,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            viewportFraction: 0.9)),
                    Padding(
                      padding: const EdgeInsets.only(top: 700),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < imagePaths.length; i++)
                            Container(
                              height: 13,
                              width: 13,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: currentIndex == i
                                      ? Color(0XFFD3427A)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(2, 2))
                                  ]),
                            )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 175, top: 200),
                    ),
                  ],
                ),
              ],
            )),
        SliverList(
          delegate: SliverChildListDelegate([
            Center(
              child: Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Text(
                    'Top Rated Salons Near You',
                    style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.w700)),
                  )),
            ),
          ]),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {},
                      child: MouseRegion(
                        onHover: (f) {
                          setState(() {
                            isHover = true;
                          });
                        },
                        onExit: (f) {
                          setState(() {
                            isHover = false;
                          });
                        },
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: isHover ? Colors.pink : Colors.grey),
                          ),
                          duration: Duration(milliseconds: 600),
                          width: isHover ? 350 : 350,
                          height: isHover ? 430 : 430,
                          child: Stack(
                            children: [
                              Container(
                                  width: 350,
                                  height: 430,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 230, 224, 224),
                                  )),
                              Container(
                                width: 350,
                                height: 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  image: DecorationImage(
                                      alignment: Alignment.topCenter,
                                      image: AssetImage(
                                        "images/banner1.png",
                                      ),
                                      fit: BoxFit.fitWidth),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: 230,
                                child: Row(
                                  children: [
                                    Positioned(
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundImage:
                                            AssetImage("images/customer1.png"),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Positioned(
                                      child: Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: 'Lathersalonaspen\n',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  wordSpacing: 10,
                                                  letterSpacing: 1),
                                            )),
                                        WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: RatingBar.builder(
                                              itemSize: 25,
                                              minRating: 1,
                                              itemCount: 1,
                                              itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber),
                                              onRatingUpdate: (rating) =>
                                                  setState(() {
                                                    this.rating = rating;
                                                  })),
                                        ),
                                        TextSpan(
                                            text: '4.5',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 1),
                                            )),
                                        TextSpan(
                                            text: '\t(1200)',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 15, wordSpacing: 1),
                                            )),
                                      ])),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 25,
                                  bottom: 75,
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text:
                                            'Lorem Ipsum is simply dummy text\nof '
                                            'the printing  typesetting industry.\n',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ]))),
                              Positioned(
                                  left: 15,
                                  bottom: 20,
                                  child: Text.rich(TextSpan(children: [
                                    WidgetSpan(
                                      child: Image.asset(
                                          width: 20,
                                          height: 20,
                                          "images/distance2.png"),
                                    ),
                                    TextSpan(
                                        text: '\t5 miles ',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              color: Color(0XFF333333),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              wordSpacing: 1),
                                        )),
                                    TextSpan(
                                        text: 'drive',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              color: Color(0XFF777777),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              wordSpacing: 1),
                                        )),
                                  ]))),
                              Positioned(
                                right: 20,
                                bottom: 20,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  onHover: (isHover) {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(isHover
                                            ? Colors.pink
                                            : Color.fromARGB(
                                                255, 248, 248, 248)),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(25)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: BorderSide(
                                            width: 1,
                                            color: isHover
                                                ? Colors.pink
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Book Now",
                                    style: TextStyle(
                                        color: isHover
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: MouseRegion(
                        onHover: (f) {
                          setState(() {
                            isHover = true;
                          });
                        },
                        onExit: (f) {
                          setState(() {
                            isHover = false;
                          });
                        },
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: isHover ? Colors.pink : Colors.grey),
                          ),
                          duration: Duration(milliseconds: 600),
                          width: isHover ? 350 : 350,
                          height: isHover ? 430 : 430,
                          child: Stack(
                            children: [
                              Container(
                                  width: 350,
                                  height: 430,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 230, 224, 224),
                                  )),
                              Container(
                                width: 350,
                                height: 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  image: DecorationImage(
                                      alignment: Alignment.topCenter,
                                      image: AssetImage(
                                        "images/banner1.png",
                                      ),
                                      fit: BoxFit.fitWidth),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: 230,
                                child: Row(
                                  children: [
                                    Positioned(
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundImage:
                                            AssetImage("images/customer1.png"),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Positioned(
                                      child: Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: 'Lathersalonaspen\n',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  wordSpacing: 10,
                                                  letterSpacing: 1),
                                            )),
                                        WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: RatingBar.builder(
                                              itemSize: 25,
                                              minRating: 1,
                                              itemCount: 1,
                                              itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber),
                                              onRatingUpdate: (rating) =>
                                                  setState(() {
                                                    this.rating = rating;
                                                  })),
                                        ),
                                        TextSpan(
                                            text: '4.5',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 1),
                                            )),
                                        TextSpan(
                                            text: '\t(1200)',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 15, wordSpacing: 1),
                                            )),
                                      ])),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 25,
                                  bottom: 75,
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text:
                                            'Lorem Ipsum is simply dummy text\nof '
                                            'the printing  typesetting industry.\n',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ]))),
                              Positioned(
                                  left: 15,
                                  bottom: 20,
                                  child: Text.rich(TextSpan(children: [
                                    WidgetSpan(
                                      child: Image.asset(
                                          width: 20,
                                          height: 20,
                                          "images/distance2.png"),
                                    ),
                                    TextSpan(
                                        text: '\t5 miles ',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              color: Color(0XFF333333),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              wordSpacing: 1),
                                        )),
                                    TextSpan(
                                        text: 'drive',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              color: Color(0XFF777777),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              wordSpacing: 1),
                                        )),
                                  ]))),
                              Positioned(
                                right: 20,
                                bottom: 20,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  onHover: (isHover) {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(isHover
                                            ? Colors.pink
                                            : Color.fromARGB(
                                                255, 248, 248, 248)),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(25)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: BorderSide(
                                            width: 1,
                                            color: isHover
                                                ? Colors.pink
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Book Now",
                                    style: TextStyle(
                                        color: isHover
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {},
                      child: MouseRegion(
                        onHover: (f) {
                          setState(() {
                            isHover = true;
                          });
                        },
                        onExit: (f) {
                          setState(() {
                            isHover = false;
                          });
                        },
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: isHover ? Colors.pink : Colors.grey),
                          ),
                          duration: Duration(milliseconds: 600),
                          width: isHover ? 350 : 350,
                          height: isHover ? 430 : 430,
                          child: Stack(
                            children: [
                              Container(
                                  width: 350,
                                  height: 430,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 230, 224, 224),
                                  )),
                              Container(
                                width: 350,
                                height: 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  image: DecorationImage(
                                      alignment: Alignment.topCenter,
                                      image: AssetImage(
                                        "images/banner1.png",
                                      ),
                                      fit: BoxFit.fitWidth),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: 230,
                                child: Row(
                                  children: [
                                    Positioned(
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundImage:
                                            AssetImage("images/customer1.png"),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Positioned(
                                      child: Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: 'Lathersalonaspen\n',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  wordSpacing: 10,
                                                  letterSpacing: 1),
                                            )),
                                        WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: RatingBar.builder(
                                              itemSize: 25,
                                              minRating: 1,
                                              itemCount: 1,
                                              itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber),
                                              onRatingUpdate: (rating) =>
                                                  setState(() {
                                                    this.rating = rating;
                                                  })),
                                        ),
                                        TextSpan(
                                            text: '4.5',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 1),
                                            )),
                                        TextSpan(
                                            text: '\t(1200)',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 15, wordSpacing: 1),
                                            )),
                                      ])),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 25,
                                  bottom: 75,
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text:
                                            'Lorem Ipsum is simply dummy text\nof '
                                            'the printing  typesetting industry.\n',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ]))),
                              Positioned(
                                  left: 15,
                                  bottom: 20,
                                  child: Text.rich(TextSpan(children: [
                                    WidgetSpan(
                                      child: Image.asset(
                                          width: 20,
                                          height: 20,
                                          "images/distance2.png"),
                                    ),
                                    TextSpan(
                                        text: '\t5 miles ',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              color: Color(0XFF333333),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              wordSpacing: 1),
                                        )),
                                    TextSpan(
                                        text: 'drive',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              color: Color(0XFF777777),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              wordSpacing: 1),
                                        )),
                                  ]))),
                              Positioned(
                                right: 20,
                                bottom: 20,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  onHover: (isHover) {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(isHover
                                            ? Colors.pink
                                            : Color.fromARGB(
                                                255, 248, 248, 248)),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(25)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: BorderSide(
                                            width: 1,
                                            color: isHover
                                                ? Colors.pink
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Book Now",
                                    style: TextStyle(
                                        color: isHover
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {},
                      child: MouseRegion(
                        onHover: (f) {
                          setState(() {
                            isHover = true;
                          });
                        },
                        onExit: (f) {
                          setState(() {
                            isHover = false;
                          });
                        },
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: isHover ? Colors.pink : Colors.grey),
                          ),
                          duration: Duration(milliseconds: 600),
                          width: isHover ? 350 : 350,
                          height: isHover ? 430 : 430,
                          child: Stack(
                            children: [
                              Container(
                                  width: 350,
                                  height: 430,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 230, 224, 224),
                                  )),
                              Container(
                                width: 350,
                                height: 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  image: DecorationImage(
                                      alignment: Alignment.topCenter,
                                      image: AssetImage(
                                        "images/banner1.png",
                                      ),
                                      fit: BoxFit.fitWidth),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: 230,
                                child: Row(
                                  children: [
                                    Positioned(
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundImage:
                                            AssetImage("images/customer1.png"),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Positioned(
                                      child: Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: 'Lathersalonaspen\n',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  wordSpacing: 10,
                                                  letterSpacing: 1),
                                            )),
                                        WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: RatingBar.builder(
                                              itemSize: 25,
                                              minRating: 1,
                                              itemCount: 1,
                                              itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber),
                                              onRatingUpdate: (rating) =>
                                                  setState(() {
                                                    this.rating = rating;
                                                  })),
                                        ),
                                        TextSpan(
                                            text: '4.5',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 1),
                                            )),
                                        TextSpan(
                                            text: '\t(1200)',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 15, wordSpacing: 1),
                                            )),
                                      ])),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 25,
                                  bottom: 75,
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text:
                                            'Lorem Ipsum is simply dummy text\nof '
                                            'the printing  typesetting industry.\n',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ]))),
                              Positioned(
                                  left: 15,
                                  bottom: 20,
                                  child: Text.rich(TextSpan(children: [
                                    WidgetSpan(
                                      child: Image.asset(
                                          width: 20,
                                          height: 20,
                                          "images/distance2.png"),
                                    ),
                                    TextSpan(
                                        text: '\t5 miles ',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              color: Color(0XFF333333),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              wordSpacing: 1),
                                        )),
                                    TextSpan(
                                        text: 'drive',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              color: Color(0XFF777777),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              wordSpacing: 1),
                                        )),
                                  ]))),
                              Positioned(
                                right: 20,
                                bottom: 20,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  onHover: (isHover) {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(isHover
                                            ? Colors.pink
                                            : Color.fromARGB(
                                                255, 248, 248, 248)),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(25)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: BorderSide(
                                            width: 1,
                                            color: isHover
                                                ? Colors.pink
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Book Now",
                                    style: TextStyle(
                                        color: isHover
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {},
                      child: MouseRegion(
                        onHover: (f) {
                          setState(() {
                            isHover = true;
                          });
                        },
                        onExit: (f) {
                          setState(() {
                            isHover = false;
                          });
                        },
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: isHover ? Colors.pink : Colors.grey),
                          ),
                          duration: Duration(milliseconds: 600),
                          width: isHover ? 350 : 350,
                          height: isHover ? 430 : 430,
                          child: Stack(
                            children: [
                              Container(
                                  width: 350,
                                  height: 430,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 230, 224, 224),
                                  )),
                              Container(
                                width: 350,
                                height: 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  image: DecorationImage(
                                      alignment: Alignment.topCenter,
                                      image: AssetImage(
                                        "images/banner1.png",
                                      ),
                                      fit: BoxFit.fitWidth),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: 230,
                                child: Row(
                                  children: [
                                    Positioned(
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundImage:
                                            AssetImage("images/customer1.png"),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Positioned(
                                      child: Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: 'Lathersalonaspen\n',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  wordSpacing: 10,
                                                  letterSpacing: 1),
                                            )),
                                        WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: RatingBar.builder(
                                              itemSize: 25,
                                              minRating: 1,
                                              itemCount: 1,
                                              itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber),
                                              onRatingUpdate: (rating) =>
                                                  setState(() {
                                                    this.rating = rating;
                                                  })),
                                        ),
                                        TextSpan(
                                            text: '4.5',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 1),
                                            )),
                                        TextSpan(
                                            text: '\t(1200)',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 15, wordSpacing: 1),
                                            )),
                                      ])),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 25,
                                  bottom: 75,
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text:
                                            'Lorem Ipsum is simply dummy text\nof '
                                            'the printing  typesetting industry.\n',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ]))),
                              Positioned(
                                  left: 15,
                                  bottom: 20,
                                  child: Text.rich(TextSpan(children: [
                                    WidgetSpan(
                                      child: Image.asset(
                                          width: 20,
                                          height: 20,
                                          "images/distance2.png"),
                                    ),
                                    TextSpan(
                                        text: '\t5 miles ',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              color: Color(0XFF333333),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              wordSpacing: 1),
                                        )),
                                    TextSpan(
                                        text: 'drive',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              color: Color(0XFF777777),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              wordSpacing: 1),
                                        )),
                                  ]))),
                              Positioned(
                                right: 20,
                                bottom: 20,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  onHover: (isHover) {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(isHover
                                            ? Colors.pink
                                            : Color.fromARGB(
                                                255, 248, 248, 248)),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(25)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: BorderSide(
                                            width: 1,
                                            color: isHover
                                                ? Colors.pink
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Book Now",
                                    style: TextStyle(
                                        color: isHover
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Lathersalonaspen\n',
                            style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  wordSpacing: 10,
                                  letterSpacing: 1),
                            )),
                      ])),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
