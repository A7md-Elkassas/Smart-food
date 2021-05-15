import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'package:smart_food/controllers/resturant_controller.dart';
import '../widgets/categories_section.dart';

class DetailsView extends StatelessWidget {
  static const routeName = '/details_view';

  @override
  Widget build(BuildContext context) {
    var restId = ModalRoute.of(context)!.settings.arguments as String;
    var resturantInfo = Provider.of<ResturantController>(context, listen: false)
        .findById(restId);
    return Scaffold(
      //backgroundColor: Colors.transparent,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              snap: false,
              floating: false,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios_outlined, size: 20),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              pinned: true,
              expandedHeight: 250,
              collapsedHeight: 60,
              flexibleSpace: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(resturantInfo.restImg!),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 30,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            resturantInfo.restName.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.fontFamily,
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: resturantInfo.rate!,
                            maxRating: 5,
                            minRating: 0,
                            itemSize: 15,
                            allowHalfRating: true,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (double value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resturantInfo.restType.toString(),
                          style: TextStyle(
                            fontFamily: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.fontFamily,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 20,
                            ),
                            Text('${resturantInfo.restLocation}'),
                          ],
                        ),
                        SizedBox(height: 16),
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later,
                              color: Colors.green,
                              size: 20,
                            ),
                            SizedBox(width: 2),
                            Text.rich(
                              TextSpan(text: 'مفتوح ', children: [
                                TextSpan(
                                    text:
                                        '${resturantInfo.open}  الي ${resturantInfo.close} '),
                              ]),
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(
                              Icons.delivery_dining,
                              color: Colors.grey,
                              size: 20,
                            ),
                            SizedBox(width: 2),
                            Text(resturantInfo.delivery == 1
                                ? 'متاح التوصيل'
                                : 'غير متاح التوصيل'),
                          ],
                        ),
                        SizedBox(height: 16),
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'الاصناف',
                          style: TextStyle(
                            fontFamily: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.fontFamily,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        CategoriesSection(
                          id: resturantInfo.restId,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
