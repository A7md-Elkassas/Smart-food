import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './view/details_view.dart';
import './view/login_view.dart';
import './view/home_view.dart';
import './view/splash.dart';
import './controllers/authentication.dart';
import './controllers/resturant_controller.dart';
import './controllers/location_controller.dart';
import './controllers/items_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Authentication()),
        ChangeNotifierProvider.value(value: ResturantController()),
        ChangeNotifierProvider.value(value: LocationController()),
        ChangeNotifierProvider.value(value: ItemsController()),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
