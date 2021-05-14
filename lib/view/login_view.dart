import 'package:flutter/material.dart';
import 'package:smart_food/view/home_view.dart';

import '../constants/constant.dart';
import '../shared_component/circular_button.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login-view';
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 65),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset('assets/images/logo-login.png'),
              ),
              SizedBox(height: 42),
              Container(
                padding: EdgeInsets.only(right: 8),
                alignment: Alignment.topRight,
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.bodyText1?.fontFamily,
                    fontSize: 25,
                    color: Theme.of(context).textTheme.bodyText1?.color,
                  ),
                ),
              ),
              SizedBox(height: 42),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      textDirection: TextDirection.rtl,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'رقم الهاتف',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: isVisible ? true : false,
                      textDirection: TextDirection.rtl,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'كلمة المرور',
                        prefixIcon: isVisible
                            ? IconButton(
                                icon: Icon(Icons.visibility_off,
                                    color: Colors.grey),
                                onPressed: () {
                                  setState(() {
                                    isVisible = false;
                                  });
                                },
                              )
                            : IconButton(
                                icon:
                                    Icon(Icons.visibility, color: Colors.grey),
                                onPressed: () {
                                  setState(() {
                                    isVisible = true;
                                  });
                                },
                              ),
                      ),
                    ),
                    SizedBox(height: 43),
                    CircularButton(
                      child: Text(
                        'دخول',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily:
                              Theme.of(context).textTheme.bodyText2?.fontFamily,
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                        ),
                      ),
                      onPress: () {
                        Navigator.pushNamed(context, HomeView.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
