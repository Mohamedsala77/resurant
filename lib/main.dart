import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tabbar.dart';
import 'food_page.dart';

void main() {

  runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabcontrol;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontrol = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 6.0, right: 6, left: 6),
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Container(
                child: CircleAvatar(
                  minRadius: 30,
                  backgroundColor: Colors.lightBlueAccent,
                  foregroundColor: Colors.grey,
                  backgroundImage: AssetImage("assets/icons8.png"),
                ),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "SEARCH FOR",
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w800, fontSize: 27.0),
              )),
          Padding(
              padding: EdgeInsets.only(top: 2),
              child: Text(
                "RECIPES",
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w800, fontSize: 27.0),
              )),
          Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(50)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                        hintText: "search"),
                  ))),
          Padding(
              padding: EdgeInsets.only(top: 8, left: 10),
              child: Text(
                "Recommended",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23.0),
              )),
          Container(
              padding: EdgeInsets.only(top: 10),
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Menue("Hamburger", "21", Color(0xFFDA9551),
                      "assets/burger.png"),
                  Menue("Fries", "14", Color(0xFF6A8CAA), "assets/fries.png"),
                  Menue("hotdog", "20", Colors.yellow.shade300,
                      "assets/hotdog.png"),
                  Menue("pizza", "20", Colors.redAccent, "assets/pizza.png"),
                  Menue("donuts", "17", Color(0xFF56CC7E),
                      "assets/doughnut.png"),
                ],
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                tabs: [
                  Tab(child: Text('FEATURED')),
                  Tab(child: Text('COMBO')),
                  Tab(child: Text('FAVORITES')),
                  Tab(child: Text('RECOMMENDED')),
                ],
                controller: tabcontrol,
                isScrollable: true,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.red,
                labelStyle: GoogleFonts.notoSans(
                    fontSize: 16.0, fontWeight: FontWeight.w700),
                unselectedLabelStyle: GoogleFonts.notoSans(
                    fontSize: 12.0, fontWeight: FontWeight.w500),
              )),
          Container(
              height: 250,
              child: TabBarView(
                controller: tabcontrol,
                children: <Widget>[
                  Bar(),
                  Bar(),
                  Bar(),
                  Bar(),
                ],
              ))
        ],
      ),
    ));
  }

  Menue(String Food_name, String price, Color color_background,
      String image_path) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Food_page(
                    foodName: Food_name,
                    hertag: Food_name,
                    imgPath: image_path,
                    pricePerItem: price,
                  )));
        },
        child: Hero(
          tag: Food_name,
          child: Container(
            decoration: BoxDecoration(
                color: color_background, borderRadius: BorderRadius.circular(20)),
            height: 150,
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration:
                      BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(image_path),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: 5,
                )),
                Text(
                  "$Food_name",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w900,
                      fontSize: 17.0),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: 5,
                )),
                Text(
                  "\$$price",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w900,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
