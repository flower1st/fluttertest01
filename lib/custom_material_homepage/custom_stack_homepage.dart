import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/custom_material_homepage/custom_client_image.dart';

class CustomStackHomePage extends StatefulWidget {
  @override
  State<CustomStackHomePage> createState() => _CustomStackHomePage();
}

class _CustomStackHomePage extends State<CustomStackHomePage> {
  bool isHover = false;

  double rating = 4.5;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: 350,
            height: 430,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 230, 224, 224),
            )),
        ProfileImage(name: "images/banner2.png"),
        Positioned(
          left: 20,
          top: 230,
          child: Row(
            children: [
              Positioned(
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("images/customer1.png"),
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
                    alignment: PlaceholderAlignment.middle,
                    child: RatingBar.builder(
                        itemSize: 25,
                        minRating: 1,
                        itemCount: 1,
                        itemBuilder: (context, _) =>
                            Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (rating) => setState(() {
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
                        textStyle: TextStyle(fontSize: 15, wordSpacing: 1),
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
                  text: 'Lorem Ipsum is simply dummy text\nof '
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
                child:
                    Image.asset(width: 20, height: 20, "images/distance2.png"),
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
              backgroundColor: MaterialStateProperty.all<Color>(
                  isHover ? Colors.pink : Color.fromARGB(255, 248, 248, 248)),
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(25)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(
                      width: 1, color: isHover ? Colors.pink : Colors.black),
                ),
              ),
            ),
            child: Text(
              "Book Now",
              style: TextStyle(color: isHover ? Colors.white : Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
