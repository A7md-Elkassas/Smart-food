import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constants/constant.dart';
import '../widgets/welcome_widget.dart';
import '../widgets/decorated_appbar.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/home_view';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  int _selectedIndex = 0;

  List<String> cats = [
    'الجميع',
    'أسماك',
    'مشويات',
  ];

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
  // _icons[index],
  //       size: 25.0,
  //       color: _selectedIndex == index
  //           ? Theme.of(context).primaryColor
  //           : Color(0XFFB4C1C4),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DecoratedAppBar(),
            SizedBox(height: 33),
            WelcomeWidget(),
            Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
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
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 108,
                                    width: 120,
                                    child: Image.asset(
                                        'assets/images/item-1.png')),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'اهل الشام',
                                          style: TextStyle(
                                            fontFamily: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.fontFamily,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.color,
                                            fontSize: 20,
                                          ),
                                        ),
                                        RatingBar.builder(
                                          itemSize: 15,
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          itemCount: 5,
                                          itemPadding:
                                              EdgeInsets.only(left: 1.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'شاورما',
                                          style: kItemInfo,
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              size: 15,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'المنصوره',
                                              style: kItemInfo,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.delivery_dining,
                                              size: 15,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'المنصوره',
                                              style: TextStyle(
                                                color: Color(0xff787878),
                                                fontSize: 12,
                                                fontFamily: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    ?.fontFamily,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
