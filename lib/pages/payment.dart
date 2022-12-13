import 'package:ecg_app/pages/dashboard.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final _formKey = GlobalKey<FormState>();
  final numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: height * 0.80,
            width: width * 0.80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Enter your momo',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SizedBox(
                  width: width * 0.65,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: numberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please make sure you entered a valid number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text(
                          'Momo number',
                        ),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintText: 'Enter your momo number',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        numberController.text.trim().length == 10) {
                      Alert(
                        context: context,
                        type: AlertType.success,
                        desc: 'Check your meter.',
                        buttons: [
                          DialogButton(
                            child: Text('Okay'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          DashboardScreen())));
                            },
                          )
                        ],
                      ).show();
                    }
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: kMainBodyColor,
                    fixedSize: Size(width * 0.60, height * 0.07),
                    shape: const StadiumBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
