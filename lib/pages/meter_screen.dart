import 'package:ecg_app/pages/payment.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class MeterScreen extends StatelessWidget {
  final String amount;
  final _formKey = GlobalKey<FormState>();
  MeterScreen({Key? key, required this.amount}) : super(key: key);

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
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Enter your meter ID $amount',
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please make sure your Meter ID is correct';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text(
                          'Meter ID',
                        ),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintText: 'Enter your Meter ID',
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
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Payment(),
                        ),
                      );
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
