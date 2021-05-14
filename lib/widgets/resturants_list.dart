import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constants/constant.dart';
import '../controllers/resturant_controller.dart';
import '../view/details_view.dart';

class ResturantsList extends StatelessWidget {
  const ResturantsList({
    required int selectedIndex,
  }) : _selectedIndex = selectedIndex;

  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ResturantController>(context)
          .fetchResturant(_selectedIndex),
      builder: (ctx, AsyncSnapshot<dynamic?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(child: Text("There is no Connection"));

          case ConnectionState.waiting:
            if (!snapshot.hasData && snapshot.hasError) {
              return Center(child: Text("Error Retreiving Data"));
            }
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            return Expanded(
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    var resturant = snapshot.data[i];
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, DetailsView.routeName,
                                        arguments: resturant.restId);
                                  },
                                  child: SizedBox(
                                      height: 108,
                                      width: 120,
                                      child: Image.network(
                                        resturant.restImg,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        resturant.restName,
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
                                        initialRating: resturant.rate,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.only(left: 1.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (_) {},
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        resturant.restType,
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
                                            resturant.restLocation,
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
                                            resturant.delivery == 1
                                                ? 'متاح التوصيل'
                                                : 'غير متاح التوصيل',
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
                    );
                  }),
            );
        }

        return Padding(
          padding: const EdgeInsets.all(10),
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
