import 'package:ecg_app/components/rounded_icon_buttons.dart';
import 'package:ecg_app/pages/dashboard.dart';
import 'package:ecg_app/pages/forgort_password.dart';
import 'package:ecg_app/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPassword = true;
  Future signIn() async {
    showDialog(
      context: context,
      builder: ((context) => const Center(
            child: CircularProgressIndicator(),
          )),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
          ),
        ),
      );
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please make sure your email is correct';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                label: Text(
                  'Email',
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                hintText: 'test@gmail.com',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
            TextFormField(
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please make sure your password is correct';
                }
                return null;
              },
              obscureText: showPassword,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                label: Text(
                  'Password',
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                hintText: 'Enter your password',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (showPassword) {
                      setState(() {
                        showPassword = false;
                      });
                    } else {
                      setState(() {
                        showPassword = true;
                      });
                    }
                  },
                  icon: const Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                  child: Text('forgot password?'),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  signIn();
                }
              },
              child: Text(
                'Log In',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: kMainBodyColor,
                fixedSize: const Size(double.infinity, 50),
                shape: const StadiumBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
