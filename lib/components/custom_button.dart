import 'package:ecg_app/pages/meter_screen.dart';
import 'package:ecg_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String value;
  // final String amount;
  const CustomButton({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return MeterScreen(amount: widget.value);
          }));
        },
        splashColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            color: kMainBodyColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              '${widget.value}Ghc',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
