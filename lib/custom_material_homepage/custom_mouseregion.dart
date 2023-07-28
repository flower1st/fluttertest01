// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomMouseRegion extends StatefulWidget {
  String name;
  String star;
  String imgUrl;
  int reviewNumber;
  String avatar;
  String description;

  CustomMouseRegion(
      {required this.name,
      required this.star,
      required this.imgUrl,
      required this.avatar,
      required this.description,
      required this.reviewNumber});
  @override
  State<CustomMouseRegion> createState() => _CustomMouseRegion();
}

class _CustomMouseRegion extends State<CustomMouseRegion> {
  bool isHover = false;
  double rating = 4.5;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MouseRegion(
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
          border:
              Border.all(width: 2, color: isHover ? Colors.pink : Colors.grey),
        ),
        duration: Duration(milliseconds: 100),
        width: isHover ? 450 : 450,
        height: isHover ? 400 : 400,
        child: Stack(
          children: [
            Container(
                width: 400,
                height: 430,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 255, 255),
                )),
            Positioned(
              left: 20,
              top: 230,
              child: Row(
                children: [
                  Positioned(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(widget.avatar),
                    ),
                  ),
                  SizedBox(width: 20),
                  Positioned(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: widget.name,
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                wordSpacing: 10,
                                letterSpacing: 1),
                          )),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: RatingBar.builder(
                            itemSize: 15,
                            minRating: 1,
                            itemCount: 1,
                            itemBuilder: (context, _) =>
                                Icon(Icons.star, color: Colors.amber),
                            onRatingUpdate: (rating) => setState(() {
                                  this.rating = rating;
                                })),
                      ),
                      TextSpan(
                          text: widget.star,
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1),
                          )),
                      TextSpan(
                          text: '\t(${widget.reviewNumber})',
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(fontSize: 15, wordSpacing: 1),
                          )),
                    ])),
                  ),
                ],
              ),
            ),
            Container(
              width: 500,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child:
                  Image(fit: BoxFit.cover, image: NetworkImage(widget.imgUrl)),
            ),
            Positioned(
                left: 10,
                bottom: 75,
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: widget.description,
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          letterSpacing: 1,
                          fontSize: 14,
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
                        width: 20, height: 20, "images/distance2.png"),
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
                  backgroundColor: MaterialStateProperty.all<Color>(isHover
                      ? Colors.pink
                      : Color.fromARGB(255, 248, 248, 248)),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(25)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(
                          width: 1,
                          color: isHover ? Colors.pink : Colors.black),
                    ),
                  ),
                ),
                child: Text(
                  "Book Now",
                  style:
                      TextStyle(color: isHover ? Colors.white : Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
