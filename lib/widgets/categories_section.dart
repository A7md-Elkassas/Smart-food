import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/items_controller.dart';
import '../constants/constant.dart';

class CategoriesSection extends StatelessWidget {
  CategoriesSection({this.id});
  final dynamic? id;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<ItemsController>(context).fetchMeals(id),
        builder: (context, AsyncSnapshot<dynamic>? snapshot) {
          switch (snapshot!.connectionState) {
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
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.35),
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, i) {
                    var meal = snapshot.data[i];
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                child: Image.network(
                                  meal.prodImage,
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        meal.prodName,
                                        style: TextStyle(
                                          fontFamily: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .fontFamily,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Text(
                                              ("${meal.prodPrice} ج . م"),
                                              textAlign: TextAlign.right,
                                              style: kItemInfo.copyWith(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.shopping_cart_outlined,
                                              color: Colors.red,
                                              size: 18,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
          }
          return (Center(
            child: CircularProgressIndicator(),
          ));
        });
  }
}
