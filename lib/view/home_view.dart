import 'package:flutter/material.dart';

import '../widgets/welcome_widget.dart';
import '../widgets/decorated_appbar.dart';
import '../controllers/resturant_controller.dart';
import '../widgets/resturants_list.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/home_view';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ResturantController? resturantController = ResturantController();

  int _selectedIndex = 0;

  List<String> cats = ['الجميع', 'أسماك', 'مشويات', 'مشروبات', 'مقبلات'];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          alignment: Alignment.center,
          height: 35,
          width: 135,
          decoration: BoxDecoration(
            color: _selectedIndex == index ? Color(0xffEF2823) : Colors.white,
            border: Border.all(color: Color(0xffEF2823), width: 1),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            cats[index],
            style: TextStyle(
              color: _selectedIndex == index ? Colors.white : Color(0xffEF2823),
              fontFamily: Theme.of(context).textTheme.bodyText2?.fontFamily,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              DecoratedAppBar(),
              SizedBox(height: 33),
              WelcomeWidget(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: cats.asMap().entries.map(
                      (MapEntry map) {
                        return _buildIcon(map.key);
                      },
                    ).toList(),
                  ),
                ),
              ),
              ResturantsList(selectedIndex: _selectedIndex),
            ],
          ),
        ),
      ),
    );
  }
}
