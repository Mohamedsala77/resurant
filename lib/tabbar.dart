import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:google_fonts/google_fonts.dart';

class Bar extends StatefulWidget {
  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            TTabbar("Delicious HOTDOG", 4.0, '6', 'assets/hotdog.png'),
            TTabbar('CHEESE PIZZA', 5.0, '12', 'assets/pizza.png')
          ],
        ),
      ),
    );
  }

  TTabbar(String name_food, rate, String price, String image_path) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Image.asset(
                    image_path,
                    height: 4,
                    width: 40,
                  ),
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                      color: Colors.redAccent.shade100,
                      borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(name_food,
                        style: GoogleFonts.notoSans(
                            fontSize: 16.0, fontWeight: FontWeight.w700)),
                    SmoothStarRating(
                        allowHalfRating: false,
                        starCount: rate.toInt(),
                        rating: rate,
                        color: Color(0xFFFFD143),
                        borderColor: Color(0xFFFFD143),
                        size: 30.0,
                        spacing: 0.0),
                    Row(
                      children: <Widget>[
                        Text(
                          '\$' + price,
                          style: GoogleFonts.lato(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(color: Color(0xFFF68D7F))),
                        ),
                        SizedBox(width: 3.0),
                        Text(
                          '\$' + '18',
                          style: GoogleFonts.lato(
                              fontSize: 20.0,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(color: Colors.black26)),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            FloatingActionButton(
              heroTag: name_food,
              mini: false,
              onPressed: () {},
              child: Center(child: Icon(Icons.add, color: Colors.white)),
              backgroundColor: Color(0xFFFE7D6A),
            ),
          ],
        ),
      ),
    );
  }
}
