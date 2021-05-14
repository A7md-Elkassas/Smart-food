import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_food/controllers/resturant_controller.dart';

import '../constants/constant.dart';
import '../shared_component/circular_button.dart';
import '../view/home_view.dart';
import '../controllers/authentication.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login-view';
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Map<String, String>? _authData = {
    'phone': '',
    'password': '',
  };
  GlobalKey<FormState> _formKey = GlobalKey();

  ResturantController? resturantController = ResturantController();
  Future<void> _confirmData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<Authentication>(context, listen: false)
            .login(_authData!['phone']!, _authData!['password']!);
      } catch (e) {
        if (e.toString().contains('logged In')) {
          Navigator.pushNamed(context, HomeView.routeName);
        } else {
          _showErrorDialog(e.toString());
        }
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Error Occurred'),
              content: Text(message),
              actions: [
                TextButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ));
  }

  bool _isLoading = false;
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
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      textDirection: TextDirection.rtl,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'رقم الهاتف',
                      ),
                      validator: (value) {
                        String? errorMsg;
                        if (value!.isEmpty || value.length < 10) {
                          errorMsg = 'Invalid Mobile Number!';
                        }
                        return errorMsg;
                      },
                      onSaved: (value) {
                        _authData!['phone'] = value!.trim();
                      },
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
                      validator: (value) {
                        String? errorMsg;
                        if (value!.isEmpty || value.length < 6) {
                          errorMsg = 'Password is too short!!';
                        }
                        return errorMsg;
                      },
                      onSaved: (value) {
                        _authData!['password'] = value!.trim();
                      },
                    ),
                    SizedBox(height: 43),
                    _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : CircularButton(
                            child: Text(
                              'دخول',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.fontFamily,
                                fontWeight: FontWeight.w900,
                                fontSize: 22,
                              ),
                            ),
                            onPress: _confirmData,
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
