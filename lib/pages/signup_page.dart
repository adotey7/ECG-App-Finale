import 'package:ecg_app/components/rounded_icon_buttons.dart';
import 'package:ecg_app/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../main.dart';
import 'dashboard.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool showPassword = true;

  Future signUp() async {
    if (passwordConfirmed()) {
      showDialog(
        context: context,
        builder: ((context) => const Center(
              child: CircularProgressIndicator(),
            )),
      );
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
      } on FirebaseAuthException catch (e) {
        print(e);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      }

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
  }

  bool passwordConfirmed() {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
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
                  return 'This field cannot be empty';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                label: Text(
                  'Email',
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                hintText: 'Enter your email',
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
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            TextFormField(
              controller: confirmPasswordController,
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
                  'Confirm Password',
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
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
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  signUp();
                }
              },
              child: Text(
                'Sign Up',
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
