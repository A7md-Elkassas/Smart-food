import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'مرحبا',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1?.color,
              fontFamily: Theme.of(context).textTheme.bodyText1?.fontFamily,
              fontSize: 27,
            ),
          ),
          Text(
            'عن ماذا تبحث؟',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1?.color,
              fontFamily: Theme.of(context).textTheme.bodyText1?.fontFamily,
              fontSize: 27,
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
