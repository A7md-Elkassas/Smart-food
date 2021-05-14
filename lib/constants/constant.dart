import 'package:flutter/material.dart';

const InputDecoration kTextFieldDecoration = InputDecoration(
  hintText: '',
  hintStyle: TextStyle(
    fontFamily: 'Tajawal',
    fontSize: 20,
    color: Colors.grey,
    fontWeight: FontWeight.w700,
  ),
  hintTextDirection: TextDirection.rtl,
  fillColor: Color.fromRGBO(174, 198, 50, 0.25),
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
);

const TextStyle kItemInfo = TextStyle(
  color: Color(0xff787878),
  fontSize: 12,
  fontFamily: 'Tajawal',
  fontWeight: FontWeight.w700,
);
