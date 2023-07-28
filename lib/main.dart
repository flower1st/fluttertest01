// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_new, avoid_unnecessary_containers, unrelated_type_equality_checks, avoid_print, sized_box_for_whitespace

// ignore: unused_import
//import 'dart:js_interop';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:homepage/custom_material_homepage/custom_mouseregion.dart';
import 'package:homepage/models/TopRated.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

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
  List<Data> users = [];
  @override
  void initState() {
    super.initState();
    fetchSpa();
  }

  void fetchSpa() async {
    print('he he he');
    const url = "https://dev.nail360.info/light/api/public?s=TopRated&z=8";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final data = json['data'] as List<dynamic>;
    final transformed = data.map(
      (e) {
        return Data(
          salonid: e['salonid'],
          name: e['name'],
          star: e['star'],
          description: e['description'],
          imageurl: e['imageurl'],
          reviewnumber: e['reviewnumber'],
          salonavatar: e['salonavatar'],
        );
      },
    ).toList();
    setState(() {
      users = transformed;
    });
    print('ha ha ha');
  }

  final int gridColumnCount = 4;
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
                Column(
                  children: [
                    Container(
                      width: 1600,
                      height: 850,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: gridColumnCount,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          final name = user.name;
                          final star = user.star;
                          final avatar = user.salonavatar;
                          final description = user.description;
                          final reviewnumber = user.reviewnumber;
                          final imgUrl = user.imageurl;
                          return Column(
                            children: [
                              CustomMouseRegion(
                                name: name.toString(),
                                star: star.toString(),
                                avatar: avatar.toString(),
                                description: description.toString(),
                                reviewNumber: reviewnumber!,
                                imgUrl: imgUrl.toString(),
                              ),
                            ],
                          );
                        },
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
                            text: 'View All\n',
                            style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0XFFD3427A)),
                            ),
                            children: []),
                      ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child:
                          Icon(color: Color(0XFFD3427A), Icons.arrow_forward),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: 'What Our Users Say',
                            style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0XFF333333)),
                            ),
                          ),
                        ])),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "\t\t\t\tExplore on the world's best & largest Bidding marketplace with our beautiful\n"
                          "Bidding products. We want to be a part of your smile, success and future growth.",
                          style: GoogleFonts.mulish(
                              textStyle: TextStyle(fontSize: 20)),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                        Container(
                            width: 500,
                            height: 275,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 230, 224, 224),
                            )),
                        Positioned(
                          left: 25,
                          top: 35,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    AssetImage("images/customer1.png"),
                              ),
                              SizedBox(width: 20),
                              Text.rich(TextSpan(children: [
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
                                  alignment: PlaceholderAlignment.middle,
                                  child: RatingBar.builder(
                                    itemSize: 25,
                                    itemCount: 5,
                                    itemBuilder: (context, _) =>
                                        Icon(Icons.star, color: Colors.amber),
                                    onRatingUpdate: (value) {},
                                  ),
                                ),
                                TextSpan(
                                    text: '\t4/28/2023',
                                    style: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                          fontSize: 15, wordSpacing: 1),
                                    )),
                              ])),
                            ],
                          ),
                        ),
                        Positioned(
                            top: 120,
                            left: 20,
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text:
                                      'The Pacific Grove Chamber of Commerce\n'
                                      'would like to thank eLab Communications and\n'
                                      'Mr. Will Elkadi for all the efforts that assisted.',
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ]))),
                        Positioned(
                          bottom: 8,
                          left: 20,
                          child: Row(children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage("images/customer1.png"),
                            ),
                            SizedBox(width: 20),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: 'Johan Martin\n',
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                              TextSpan(
                                  text: '\tCEO',
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      height: 1.4,
                                      fontSize: 18,
                                    ),
                                  )),
                            ])),
                            Padding(
                              padding: const EdgeInsets.only(left: 200),
                              child: Image.asset("images/phay.png"),
                            )
                          ]),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                            width: 500,
                            height: 275,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 230, 224, 224),
                            )),
                        Positioned(
                          left: 25,
                          top: 35,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    AssetImage("images/customer1.png"),
                              ),
                              SizedBox(width: 20),
                              Text.rich(TextSpan(children: [
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
                                  alignment: PlaceholderAlignment.middle,
                                  child: RatingBar.builder(
                                    itemSize: 25,
                                    itemCount: 5,
                                    itemBuilder: (context, _) =>
                                        Icon(Icons.star, color: Colors.amber),
                                    onRatingUpdate: (value) {},
                                  ),
                                ),
                                TextSpan(
                                    text: '\t4/28/2023',
                                    style: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                          fontSize: 15, wordSpacing: 1),
                                    )),
                              ])),
                            ],
                          ),
                        ),
                        Positioned(
                            top: 120,
                            left: 20,
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text:
                                      'The Pacific Grove Chamber of Commerce\n'
                                      'would like to thank eLab Communications and\n'
                                      'Mr. Will Elkadi for all the efforts that assisted.',
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ]))),
                        Positioned(
                          bottom: 8,
                          left: 20,
                          child: Row(children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage("images/customer1.png"),
                            ),
                            SizedBox(width: 20),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: 'Johan Martin\n',
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                              TextSpan(
                                  text: '\tCEO',
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      height: 1.4,
                                      fontSize: 18,
                                    ),
                                  )),
                            ])),
                            Padding(
                              padding: const EdgeInsets.only(left: 200),
                              child: Image.asset("images/phay.png"),
                            )
                          ]),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                            width: 500,
                            height: 275,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 230, 224, 224),
                            )),
                        Positioned(
                          left: 25,
                          top: 35,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    AssetImage("images/customer1.png"),
                              ),
                              SizedBox(width: 20),
                              Text.rich(TextSpan(children: [
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
                                  alignment: PlaceholderAlignment.middle,
                                  child: RatingBar.builder(
                                    itemSize: 25,
                                    itemCount: 5,
                                    itemBuilder: (context, _) =>
                                        Icon(Icons.star, color: Colors.amber),
                                    onRatingUpdate: (value) {},
                                  ),
                                ),
                                TextSpan(
                                    text: '\t4/28/2023',
                                    style: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                          fontSize: 15, wordSpacing: 1),
                                    )),
                              ])),
                            ],
                          ),
                        ),
                        Positioned(
                            top: 120,
                            left: 20,
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text:
                                      'The Pacific Grove Chamber of Commerce\n'
                                      'would like to thank eLab Communications and\n'
                                      'Mr. Will Elkadi for all the efforts that assisted.',
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ]))),
                        Positioned(
                          bottom: 8,
                          left: 20,
                          child: Row(children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage("images/customer1.png"),
                            ),
                            SizedBox(width: 20),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: 'Johan Martin\n',
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                              TextSpan(
                                  text: '\tCEO',
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      height: 1.4,
                                      fontSize: 18,
                                    ),
                                  )),
                            ])),
                            Padding(
                              padding: const EdgeInsets.only(left: 200),
                              child: Image.asset("images/phay.png"),
                            )
                          ]),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(children: [
                      Container(
                        width: 1500,
                        height: 320,
                        decoration: BoxDecoration(
                            color: Color(0XFFFCEDF2),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      Image(
                          width: 1050,
                          height: 320,
                          fit: BoxFit.fill,
                          image: AssetImage("images/vector-logo.png")),
                      Positioned(
                        bottom: 1,
                        child: Image(
                            width: 220,
                            height: 180,
                            fit: BoxFit.fill,
                            image: AssetImage("images/Vectorbanner1.png")),
                      ),
                      Positioned(
                        top: 0,
                        left: 445,
                        child: Image(
                            width: 300,
                            height: 200,
                            fit: BoxFit.fill,
                            image: AssetImage("images/Vectorbanner2.png")),
                      ),
                      Positioned(
                        left: 80,
                        top: 70,
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: 'Are you a Salon Owner?\n',
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )),
                          WidgetSpan(child: SizedBox(height: 50)),
                          TextSpan(
                              text:
                                  "Lorem Ipsum is simply dummy text of the printing\n"
                                  "and typesetting industry. Lorem Ipsum has been the\n"
                                  "industry's standard dummy",
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  height: 1.4,
                                  fontSize: 25,
                                ),
                              )),
                        ])),
                      ),
                      Positioned(
                        top: 125,
                        right: 90,
                        width: 270,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {},
                          onHover: (isHover) {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0XFFD3427A)),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(20)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                side: BorderSide(
                                    width: 2, color: Color(0XFFD3427A)),
                              ),
                            ),
                          ),
                          child: Text(
                            "List Your Salon",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
                SizedBox(height: 60),
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(color: Color(0XFFF7F7F7)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: 'Quick Links\n',
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0XFF333333)),
                              )),
                          WidgetSpan(child: SizedBox(height: 80)),
                          TextSpan(
                              text: "About\n\n"
                                  "Services\n\n"
                                  "Salon Owner\n",
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                  color: Color(0XFF7777777),
                                  height: 1.4,
                                  fontSize: 25,
                                ),
                              )),
                        ])),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: 'Information\n',
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0XFF333333)),
                              )),
                          WidgetSpan(child: SizedBox(height: 80)),
                          TextSpan(
                              text: "Testimonials\n\n"
                                  "Contact Us\n\n"
                                  "Help\n",
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                  color: Color(0XFF7777777),
                                  height: 1.4,
                                  fontSize: 25,
                                ),
                              )),
                        ])),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: 'nail360\n',
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0XFF333333)),
                              )),
                          WidgetSpan(child: SizedBox(height: 80)),
                          TextSpan(
                              text: "Terms and Conditions\n\n"
                                  "Refund Policy\n\n"
                                  "Privacy\n",
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                  color: Color(0XFF7777777),
                                  height: 1.4,
                                  fontSize: 25,
                                ),
                              )),
                        ])),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: 'Contact Us\n',
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0XFF333333)),
                              )),
                          WidgetSpan(child: SizedBox(height: 80)),
                          TextSpan(
                              text: "12345 Little Lonsdale St,\n"
                                  "Melbourne\n\n"
                                  "Phone: (123) 123-456\n\n"
                                  "E-Mail: office@nail360.com\n",
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                  color: Color(0XFF7777777),
                                  height: 1.4,
                                  fontSize: 25,
                                ),
                              )),
                        ])),
                      ]),
                ),
                Divider(
                  height: 10,
                  thickness: 5,
                  indent: 0,
                  endIndent: 0,
                  color: Color(0XFFEAE5E5),
                ),
                Container(
                    width: 1500,
                    height: 100,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Copyright © 2023 nail360.com. All rights reserved."),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {},
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Image(
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                      image: AssetImage("images/fbfb.png"))),
                              SizedBox(width: 20),
                              InkWell(
                                  onTap: () {},
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Image(
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                      image: AssetImage("images/insins.png"))),
                              SizedBox(width: 20),
                              InkWell(
                                  onTap: () {},
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Image(
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "images/twittertwitter.png"))),
                              SizedBox(width: 20),
                              InkWell(
                                  onTap: () {},
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Image(
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                      image: AssetImage("images/ininin.png"))),
                              SizedBox(width: 20),
                              InkWell(
                                  onTap: () {},
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Image(
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                      image: AssetImage("images/goldold.png"))),
                              SizedBox(width: 20),
                              InkWell(
                                  onTap: () {},
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Image(
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                      image: AssetImage("images/ytyt.png"))),
                            ],
                          ),
                        ])),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
