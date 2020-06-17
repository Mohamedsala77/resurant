import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Food_page extends StatefulWidget {
  @override
  _Food_pageState createState() => _Food_pageState();
  final imgPath, foodName, hertag;
  String pricePerItem;

  Food_page({this.imgPath, this.foodName, this.pricePerItem, this.hertag});
}

class _Food_pageState extends State<Food_page> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.only(right: 1),
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () {},
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.only(top: 15, left: 10),
              child: Text(
                "SUPER",
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w800, fontSize: 30.0),
              )),
          Padding(
              padding: EdgeInsets.only(top: 2, left: 10),
              child: Text(
                "${widget.foodName.toString().toUpperCase()}",
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w800, fontSize: 30.0),
              )),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 250,
                  height: 200,
                  color: Colors.white,
                  child: Image.asset(
                    widget.imgPath,
                    height: 230,
                    width: 230,
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                    Icon(
                      Icons.av_timer,
                      color: Colors.red,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10),

          /////////////////////////////////////////////////////////////////////////////////////////////////////
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "\$${int.parse(widget.pricePerItem) * count}",
                  style: GoogleFonts.notoSans(
                      color: Colors.black54,
                      fontWeight: FontWeight.w800,
                      fontSize: 40.0),
                ),
                Container(
                  width: 260,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          width: 120,
                          height: 50,
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.redAccent,
                                  ),
                                  onPressed: () {
                                    adjustQuantity('PLUS');
                                  }),
                              Text(
                                "${count.toString()}",
                                style: GoogleFonts.notoSans(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () {
                                  adjustQuantity('MINUS');
                                },
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                        Center(
                          child: Text(
                            "Add to cart",
                            style: GoogleFonts.notoSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "FEATURED",
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, fontSize: 25.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Featured("Cheese", "12", Color(0xFFFE7D6A), "assets/cheese.png"),
                        Featured("Popcorn", "12", Color(0xFFFE7D6A), "assets/popcorn.png")

                      ],
                    ),
                  ),
                  SizedBox(width: 30,),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Featured("Taco", "12", Color(0xFFFE7D6A), "assets/taco.png"),
                        Featured("Sandwich", "12", Color(0xFFFE7D6A), "assets/sandwich.png")

                      ],
                    ),
                  ),
                  SizedBox(width: 30,),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Featured("Water", "6", Color(0xFFFE7D6A), "assets/icons8-water-bottle-64.png"),
                        Featured("Hot drink", "15", Color(0xFFFE7D6A), "assets/icons8-tea-cup-64.png")

                      ],
                    ),
                  ),
                  SizedBox(width: 30,),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Featured("Juice", "15", Color(0xFFFE7D6A), "assets/iconswater.png"),
                        Featured("Soda", "10", Color(0xFFFE7D6A), "assets/iconsoda.png")

                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Featured(String Food_name, String price, Color color_background,
      String image_path) {
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
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(Food_name,
                        style: GoogleFonts.notoSans(
                            fontSize: 16.0, fontWeight: FontWeight.w700)),
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
                      ],
                    )
                  ],
                )
              ],
            ),

          ],
        ),
      ),
    );
  }

  adjustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          count += 1;
        });
        return;
      case 'MINUS':
        setState(() {
          if (count != 0) {
            count -= 1;
          }
        });
        return;
    }
  }

  price() {}
}
