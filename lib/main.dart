import 'package:covidapp/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

 class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
     
          bottomNavigationBar: menu(),
            body: HomeScreen()
            // body: TabBarView(
            //   children: [
            //     Container(child: HomeScreen()),
            //     Container(child: Icon(Icons.directions_transit)),
            //     Container(child: Icon(Icons.directions_bike)),
            //     Container(child: Icon(Icons.directions_bike)),
            //   ],
            // ),
          ),
        ),
      );
    }
 Widget menu() {
return Container(
  color: Color(0xFF3F5AA6),
  child: TabBar(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white70,
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorPadding: EdgeInsets.all(5.0),
    indicatorColor: Colors.blue,
    tabs: [
      Tab(
        text: "Home",
        icon: Icon(Icons.home),
      ),
      Tab(
        text: "Sức khỏe ",
        icon: Icon(Icons.health_and_safety),
      ),
      Tab(
        text: "Biểu đồ",
        icon: Icon(Icons.bar_chart),
      ),
      Tab(
        text: "Thoát",
        icon: Icon(Icons.exit_to_app),
      ),
    ],
  ),
);
} }