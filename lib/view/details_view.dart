import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsView extends StatelessWidget {
  static const routeName = '/details_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                // IconButton(
                //     icon: Icon(Icons.arrow_back_ios_outlined, size: 20),
                //     onPressed: () {
                //       Navigator.pop(context);
                //     }),
              ],
              automaticallyImplyLeading: false,
              snap: false,
              floating: false,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios_outlined, size: 20),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              pinned: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              expandedHeight: 250,
              collapsedHeight: 60,
              flexibleSpace: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: ExactAssetImage('assets/images/big.png'),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 10,
                  //   bottom: 80,
                  //   right: 20,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 10),
                  //     child: IconButton(
                  //         icon: Icon(Icons.arrow_back_ios_outlined,
                  //             size: 20, color: Colors.white),
                  //         onPressed: () {
                  //           Navigator.pop(context);
                  //         }),
                  //   ),
                  // ),
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
                            'اهل الشام',
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
                            initialRating: 5,
                            maxRating: 5,
                            minRating: 0,
                            itemSize: 15,
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
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 27),
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
                          'شاورما ',
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
                            Text('المنصوره'),
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
                            Text.rich(
                              TextSpan(text: 'مفتوح ', children: [
                                TextSpan(text: 'من 10 ص الي 10 م '),
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
                            Text('مفتوح'),
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
                        SizedBox(height: 16),
                        CategoriesSection(),
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

class CategoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.850,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (ctx, i) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Card(
              child: ProductItem(),
            ),
          );
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: Image.asset(
              'assets/images/item.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        SizedBox(
          height: 9,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Expanded(
              child: Container(
            padding: EdgeInsets.all(9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('بطاطس سوري'),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '20ج ٫ م ',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.black),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.red,
                          size: 15,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ),
      ],
    );
  }
}
