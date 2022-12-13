import 'package:ecg_app/pages/auth_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Expanded(
                child: SizedBox(
                  height: 10,
                ),
              ),
              Image.asset(
                'images/ecglogogh.png',
                width: width * 0.60,
              ),
              const Expanded(
                child: SizedBox(
                  height: 10,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AuthenticationPage();
                      },
                    ),
                  );
                },
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 40),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
