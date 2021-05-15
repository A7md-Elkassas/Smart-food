import 'package:flutter/material.dart';

import '../view/details_view.dart';

class DecoratedAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: MediaQuery.of(context).size.height * 0.14,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffFFC501),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: null, icon: Icon(Icons.menu, color: Colors.black)),
          Text(
            'الرئيسية',
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.bodyText1?.fontFamily,
              color: Theme.of(context).textTheme.bodyText1?.color,
              fontSize: 25,
            ),
          ),
          IconButton(
              onPressed: null, icon: Icon(Icons.search, color: Colors.black)),
        ],
      ),
    );
  }
}
