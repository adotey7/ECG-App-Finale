import 'package:ecg_app/pages/login_page.dart';
import 'package:ecg_app/pages/signup_page.dart';
import 'package:ecg_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final pageViewController = PageController(initialPage: 0);
  Color activeColor = kMainBodyColor;
  Color nonActiveColor = Colors.white;
  Color activeTextColor = Colors.white;
  Color nonActiveTextColor = Colors.indigo;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => pageViewController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut),
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              color: _currentIndex == 0
                                  ? activeColor
                                  : nonActiveColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  color: _currentIndex == 0
                                      ? activeTextColor
                                      : nonActiveTextColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => pageViewController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut),
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              color: _currentIndex == 1
                                  ? activeColor
                                  : nonActiveColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: _currentIndex == 1
                                      ? activeTextColor
                                      : nonActiveTextColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: PageView(
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        controller: pageViewController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          LoginPage(),
                          SignUpPage(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
