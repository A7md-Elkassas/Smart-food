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
                    childAspectRatio: 0.850,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, i) {
                    var meal = snapshot.data[i];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
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
                                  child: Container(
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
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
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
                              )),
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
