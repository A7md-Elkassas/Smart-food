import 'package:flutter/material.dart';
import 'package:smart_food/view/details_view.dart';
import 'package:smart_food/view/login_view.dart';
import 'package:smart_food/view/home_view.dart';
import 'package:smart_food/view/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Food',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color(0xff46200B),
            fontFamily: 'TajawalBold',
          ),
          bodyText2: TextStyle(
            fontFamily: 'Tajawal',
          ),
        ),
      ),
      home: Splash(),
      routes: {
        LoginView.routeName: (context) => LoginView(),
        HomeView.routeName: (context) => HomeView(),
        DetailsView.routeName: (context) => DetailsView(),
      },
    );
  }
}
